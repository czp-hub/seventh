package com.fh.service;

import com.fh.utils.response.ResponseServer;

public interface RightService {

    /**
     * 初始化权限菜单
     * @return
     */
    ResponseServer showSystemList(Integer pId);
}
