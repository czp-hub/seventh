package com.fh.service;

import com.fh.bean.DeptBean;
import com.fh.vo.DeptZtree;

import java.util.List;

public interface IDeptService {
    List<DeptZtree> getDeptZtree();

    void updateDept(DeptBean deptBean);

    void addDept(DeptBean deptBean);

    void deleteDept(Integer id);
}
