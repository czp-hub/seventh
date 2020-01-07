package com.fh.service.Impl;

import com.fh.bean.UserBean;
import com.fh.dao.UserDao;
import com.fh.service.UserService;
import com.fh.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public UserBean queryUserName(String userName) {
        return userDao.queryUserName(userName);
    }

    public PageBean<UserBean> queryUser(PageBean<UserBean> page, UserBean userBean) {
        Long count = userDao.queryCount();
        page.setRecordsTotal(count);
        page.setRecordsFiltered(count);
        List<UserBean> list = userDao.queryUser(page,userBean);
        page.setData(list);
        return page;
    }

    public void deleteUser(String id) {
        userDao.deleteById(id);
    }

    public void addUser(UserBean userBean) {
        userDao.insert(userBean);
    }

    public UserBean togoUser(String id) {
        return userDao.selectById(id);
    }

    public void updateUser(UserBean userBean) {
        userDao.updateUser(userBean);
    }
}
