package com.xiaoxiao.service;

import com.xiaoxiao.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiaoxiao
 * @since 2022-04-13
 */
public interface UserService extends IService<User> {
    User findByName(String username);
}
