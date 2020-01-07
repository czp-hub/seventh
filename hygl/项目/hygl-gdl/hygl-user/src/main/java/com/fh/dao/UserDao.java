package com.fh.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.bean.UserBean;
import com.fh.utiles.PageBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserDao extends BaseMapper<UserBean> {

    public UserBean queryUserName(String userName);

    public  Long queryCount();

    public List<UserBean> queryUser(@Param("page") PageBean<UserBean> page, @Param("userBean") UserBean userBean);

    public void updateUser(UserBean userBean);


}
