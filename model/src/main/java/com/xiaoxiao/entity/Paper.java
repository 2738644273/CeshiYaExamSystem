package com.xiaoxiao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
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
public class Paper implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 试卷名字
     */
    private String paperName;

    /**
     * 试卷唯一编号
     */
    private String unique;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    private Integer isDel;

    /**
     * 开考时间
     */
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    private LocalDateTime endTime;

    /**
     * 是否开始
     */
    private Integer isStart;

    private Integer classId;

    /**
     * 课程id
     */
    private Integer crouseId;


}
