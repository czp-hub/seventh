package com.fh.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("t_right")
public class RightPo {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    @TableField("rightName")
    private String rightName;
    @TableField("pId")
    private String pId;
    @TableField("rightUrl")
    private String rightUrl;

}
