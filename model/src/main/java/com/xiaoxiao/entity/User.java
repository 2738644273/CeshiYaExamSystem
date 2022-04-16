package com.xiaoxiao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author xiaoxiao
 * @since 2022-04-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "uid", type = IdType.AUTO)
    private Long uid;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 密码
     */
    private String password;

    /**
     * 角色id
     */
    @TableField("roleID")
    private Integer roleID;

    /**
     * 头像
     */
    private String avatar;

    private Integer isDel;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 创建时间
     */
    private Timestamp createTime;

    /**
     * 登录时间
     */
    private Timestamp loginTime;

    private Integer classId;

    private Integer sex;

    private  boolean enabled;
}
