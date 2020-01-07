package com.fh.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "t_dept")
public class DeptBean {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField(value = "pid")
    private Integer pid;

    @TableField(value = "name")
    private String name;
    @TableField("classId")
    private Integer classId;

}
