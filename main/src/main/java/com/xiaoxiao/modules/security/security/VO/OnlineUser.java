package com.xiaoxiao.modules.security.security.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 在线用户实体
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OnlineUser {

    private String userName;

    private String nickName;

    private String key;

    private Date loginTime;

    private Integer classId;

    private  Integer sex;
}
