package com.fh.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName(value = "t_user")
public class UserBean implements Serializable {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    @TableField(value = "userName")
    private String userName;
    @TableField("deptId")
    private Integer deptId;


}
