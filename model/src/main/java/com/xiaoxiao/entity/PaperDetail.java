package com.xiaoxiao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class PaperDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String title;

    /**
     * 答案列表
     */
    private String answerList;

    private Integer isDel;

    /**
     * 问题列表
     */
    private String questionList;

    /**
     * 单选：0，多选 1

     */
    private Integer type;

    /**
     * 题目唯一编号
     */
    private String paperDetailUnique;

    /**
     * 试卷id
     */
    private String paperUnique;


}
