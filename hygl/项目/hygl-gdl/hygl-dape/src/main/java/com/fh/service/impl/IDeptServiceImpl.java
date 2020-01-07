package com.fh.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fh.bean.DeptBean;
import com.fh.bean.UserBean;
import com.fh.mapper.IDeptMapper;
import com.fh.mapper.IUserMapper;
import com.fh.service.IDeptService;
import com.fh.vo.DeptZtree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("deptService")
public class IDeptServiceImpl implements IDeptService {
    @Autowired
    private IDeptMapper deptMapper;
    @Autowired
    private IUserMapper userMapper;
    @Override
    public List<DeptZtree> getDeptZtree() {
        List<DeptBean> deptBeans = deptMapper.selectList(null);
        List<DeptZtree> deptZtreeList=new ArrayList<>();
        for (DeptBean deptBean : deptBeans) {
                DeptZtree deptZtree=new DeptZtree();
                deptZtree.setId(deptBean.getId());
                deptZtree.setName(deptBean.getName());
                deptZtree.setpId(deptBean.getPid());
                if(deptBean.getClassId()==2){
                    QueryWrapper<UserBean> userBeanQueryWrapper=new QueryWrapper<>();
                    userBeanQueryWrapper.eq("deptId",deptBean.getId());
                    List<UserBean> userBeans = userMapper.selectList(userBeanQueryWrapper);
                    for (UserBean userBean : userBeans) {
                        DeptZtree deptZtree2=new DeptZtree();
                        deptZtree2.setId(userBean.getId());
                        deptZtree2.setName(userBean.getUserName());
                        deptZtree2.setpId(userBean.getDeptId());
                        deptZtree2.setClassId(3);
                        deptZtreeList.add(deptZtree2);
                    }
                    deptZtree.setClassId(2);
                }
            deptZtreeList.add(deptZtree);
        }
        return deptZtreeList;
    }

    @Override
    public void updateDept(DeptBean deptBean) {
            deptMapper.updateById(deptBean);
    }

    @Override
    public void addDept(DeptBean deptBean) {
            deptMapper.insert(deptBean);
    }

    @Override
    public void deleteDept(Integer id) {
        deptMapper.deleteById(id);
    }
}
