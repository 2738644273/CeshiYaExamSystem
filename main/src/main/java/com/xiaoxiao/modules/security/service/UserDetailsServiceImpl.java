
package com.xiaoxiao.modules.security.service;


import com.xiaoxiao.commons.exception.BadRequestException;
import com.xiaoxiao.entity.User;
import com.xiaoxiao.modules.security.security.VO.JwtUser;
import com.xiaoxiao.modules.security.security.DTO.UserDto;
import com.xiaoxiao.service.RoleService;
import com.xiaoxiao.service.UserService;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 查询用户存不存在
 */
@Service("userDetailsService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserService userService;


    public UserDetailsServiceImpl(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) {
        User user = userService.findByName(username);
        if (user == null) {
            throw new BadRequestException("账号不存在");
        } else {
            if (!user.isEnabled()) {
                throw new BadRequestException("账号未激活");
            }
            return createJwtUser(user);
        }
    }

    /**
     * 创建jwt用户对象
     * @param user
     * @return
     */
    private UserDetails createJwtUser(User user) {
        Set<String> perlist = new HashSet<>();
        perlist.add(user.getRoleID().toString());
     Collection<SimpleGrantedAuthority> authorities = perlist.stream().map(SimpleGrantedAuthority::new).collect(Collectors.toList());
        return new JwtUser(
                user.getUid(),
                user.getUserName(),
                user.getNickName(),
                user.getSex(),
                user.getClassId(),
                user.getPassword(),
                user.getAvatar(),
                authorities,
                user.isEnabled(),
                user.getCreateTime()
        );
    }
}
