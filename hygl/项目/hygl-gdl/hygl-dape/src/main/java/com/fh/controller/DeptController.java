package com.fh.controller;

import com.fh.bean.DeptBean;
import com.fh.service.IDeptService;
import com.fh.utils.response.ResponseServer;
import com.fh.vo.DeptZtree;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RequestMapping("dept")
@RestController
@CrossOrigin(origins = "http://localhost:8080")
public class DeptController {
    @Resource(name = "deptService")
    private IDeptService deptService;
    @GetMapping
    public List<DeptZtree> getDeptZtree(){
                return deptService.getDeptZtree();
    }
    @PostMapping
    public ResponseServer updateDept(DeptBean deptBean){
                deptService.updateDept(deptBean);
                return ResponseServer.success();
    }
    @PutMapping
    public ResponseServer addDept(DeptBean deptBean){
        deptService.addDept(deptBean);
        return ResponseServer.success();
    }
    /**
     * 删除部门
     */
    @DeleteMapping("/{id}")
    public ResponseServer deleteDept(@PathVariable("id") Integer id){
            deptService.deleteDept(id);
            return ResponseServer.success();
    }
}
