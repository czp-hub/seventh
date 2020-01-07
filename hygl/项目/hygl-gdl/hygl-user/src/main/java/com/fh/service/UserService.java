package com.fh.service;

import com.fh.bean.UserBean;
import com.fh.utiles.PageBean;

public interface UserService {

    public UserBean queryUserName(String userName);

    public PageBean<UserBean> queryUser(PageBean<UserBean> page, UserBean userBean);

    public  void deleteUser(String id);

    public  void addUser(UserBean userBean);

    public UserBean togoUser(String id);

    public void updateUser(UserBean userBean);
}
