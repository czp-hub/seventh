package com.fh.service;

import com.fh.bean.UserBean;
import com.fh.param.UserSearchParam;
import com.fh.utiles.PageBean;

public interface UserService {

    public UserBean queryUserName(String userName);

    public PageBean<UserBean> queryUser(UserSearchParam userSearchParam);

    public  void deleteUser(Integer id);

    public  void addUser(UserBean userBean);

    public UserBean togoUser(Integer id);

    public void updateUser(UserBean userBean);
}
