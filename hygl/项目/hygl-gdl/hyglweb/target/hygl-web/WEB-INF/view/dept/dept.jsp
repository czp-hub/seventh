<%--
  Created by IntelliJ IDEA.
  User: lenovo1
  Date: 2020/1/2
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="../../commons/jqCss.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-4">
            <div class="panel panel-info">
                <div class="panel-body">
                        <a onclick="showAddDept()">添加部门</a>
                        <a onclick="showUpdateDept()">修改部门</a>
                        <a onclick="deleteDept()">删除部门</a>
                        <a onclick="deleteUser()">删除人员</a>
                </div>
                <div class="panel-footer">
                    <ul id="deptTree" class="ztree"></ul>
                </div>
            </div>


        </div>
        <div class="col-xs-8" id="showDeptForm">

        </div>

    </div>

</div>
<div id="detpDiv" style="display: none">
    <form class="form-horizontal" onsubmit="return false" id="userForm">
        <div class="form-group">
            <label  class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="userName" id="userName" placeholder="请输入用户名">
                <input type="hidden" id="id" name="id">
                <input type="hidden" id="deptId" name="deptId">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">手机</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入手机">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">职务</label>
            <div class="col-sm-10">

            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" onclick="saveUser()"><span id="buName"></span></button>
            </div>
        </div>
    </form>
</div>
<div id="updateDeptDiv" style="display: none">
    <form class="form-horizontal" onsubmit="return false" id="detpUpdateForm">
        <div class="form-group">
            <label  class="col-sm-2 control-label">父节点</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"  id="pName" disabled>
                <input type="hidden" id="dId" name="id">
                <input type="hidden" id="pId" name="pId">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">节点名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="name" id="name">
            </div>
        </div>
    </form>
</div>
<div id="addDeptDiv" style="display: none">
    <form class="form-horizontal" onsubmit="return false" id="detpAddForm">
        <div class="form-group">
            <label  class="col-sm-2 control-label">父节点</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"  id="add_pName" disabled>
                <input type="hidden" id="add_pId" name="pid">
            </div>
        </div>
        <div class="form-group">
        <label  class="col-sm-2 control-label">节点名称</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="name">
        </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">部门级别</label>
            <div class="col-sm-10">
                <input type="radio"  name="classId" value="1">部门级
                <input type="radio"  name="classId" value="2">部门人员
            </div>
        </div>
    </form>
</div>
<script>
    var deptFormDiv;
    var updateDeptDiv;
    var addDpetDiv;
    $(function () {
        initDeptZtree()
        deptFormDiv= $("#detpDiv").html()
        updateDeptDiv=$("#updateDeptDiv").html();
        $("#updateDeptDiv").html("")
        addDpetDiv=$("#addDeptDiv").html();
        $("#addDeptDiv").html("")
    })
   /* function initDeptZtree() {
        $.ajax({
            url:"http://localhost:8093/dept",
            type:"get",
            success:function(result) {
                    console.log(result)
                    var setting = {
                        data: {
                            simpleData: {
                                enable: true
                            },
                            key: {
                                url: "xUrl"
                            }
                        }
                        ,callback: {
                            onClick: categroyClick    //树的点击事件  没有配置
                        }
                    };
                    $.fn.zTree.init($("#deptTree"), setting, result);
                }

        })
    }*/
    function categroyClick(event, treeId, treeNode) {
        console.info(treeNode)
        if(treeNode.classId==3){
                $("#showDeptForm").html(deptFormDiv)
            $("#buName").html("更新用户")

            $("#deptId").val(treeNode.pId);
            $.ajax({
                url:"http://localhost:8090/user",
                type:"post",
                data:{
                    id:treeNode.id
                },
                success:function (result) {
                    if(result.code==200){
                        var data=result.data;
                        $("#id").val(data.id);
                        $("#phone").val(data.phone);
                        $("#userName").val(data.userName);
                    }
                }
            })
            $("#detpDiv").html("")

        } else if(treeNode.classId==2){
            $("#showDeptForm").html(deptFormDiv)
            $("#buName").html("新增用户")
            $("#deptId").val(treeNode.id);
            $("#detpDiv").html("")
        } else {
            $("#showDeptForm").html("")
        }
    }
    function saveUser() {
        $.ajax({
            url:"http://localhost:8090/user",
            type:'put',
            data:$("#userForm").serialize(),
            success:function (result) {
                if(result.code==200){
                    alert("操作成功")
                    $("#showDeptForm").html("")
                    initDeptZtree()
                }
            }
        })
    }
    function deleteUser() {
        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        var nodes = treeObj.getSelectedNodes();
            if(nodes.length>0){
                if(nodes[0].classId==3){
                    console.info(nodes[0])
                    $.ajax({
                        url:"http://localhost:8090/user/"+nodes[0].id,
                        type:"delete",
                        success:function (result) {
                            if(result.code==200){
                                alert("删除成功")
                                $("#showDeptForm").html("")
                                initDeptZtree()
                            }
                        }
                    })
                }else {
                    alert("请选择人员")
                }
            }else if(nodes.length>1){
                alert("请选择人员")
            }else {
                alert("请选择人员")
            }
    }
    var v_deptUpdateDlg;
    function showUpdateDept() {
        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        var nodes = treeObj.getSelectedNodes();
        if(nodes.length>0){
            if(nodes[0].pId!=null){
                var node = treeObj.getNodeByParam("id", nodes[0].pId, null);
            }


            v_deptUpdateDlg=bootbox.dialog({
                title: "修改部门",
                message: updateDeptDiv,
                size: 'large',
                buttons: {
                    confirm : {
                        label: '<i class="glyphicon glyphicon-ok"></i> 确认',
                        className:"btn-info",
                        callback: function () {
                                $.ajax({
                                    url:"http://localhost:8093/dept",
                                    type:"post",
                                    data:$("#detpUpdateForm").serialize(),
                                    success:function (result) {
                                        if(result.code==200){
                                            alert("修改成功")
                                            initDeptZtree()
                                        }
                                    }
                                })
                        }
                    },
                    cancel : {
                        label: '<i class="glyphicon glyphicon-remove"></i> 取消'
                    }
                },
            });
            if(nodes[0].pId==null){
                $("#pName").val("最高节点")
                $("#pId").val(0)
            }else {
                $("#pName").val(node.name)
                $("#pId").val(node.id)
            }
            
            $("#name").val(nodes[0].name)
            $("#dId").val(nodes[0].id)
        }else if(nodes.length>1){

        }else {

        }

    }
    function showAddDept() {
        console.info(addDpetDiv)
        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        var nodes = treeObj.getSelectedNodes();
        if(nodes.length>0){
            if(nodes[0].classId==null){
                v_deptUpdateDlg=bootbox.dialog({
                    title: "新增部门",
                    message:addDpetDiv,
                    size: 'large',
                    buttons: {
                        confirm : {
                            label: '<i class="glyphicon glyphicon-ok"></i> 确认',
                            className:"btn-info",
                            callback: function () {
                                $.ajax({
                                    url:"http://localhost:8093/dept",
                                    type:"put",
                                    data:$("#detpAddForm").serialize(),
                                    success:function (result) {
                                        if(result.code==200){
                                            alert("新增成功")
                                            initDeptZtree()
                                        }
                                    }
                                })
                            }
                        },
                        cancel : {
                            label: '<i class="glyphicon glyphicon-remove"></i> 取消'
                        }
                    },
                });
                $("#add_pName").val(nodes[0].name)
                $("#add_pId").val(nodes[0].id)
            }

        }else if(nodes.length>1){

        }else {

        }
    }
    function deleteDept() {
        alert(1111111)
        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        var nodes = treeObj.getSelectedNodes();
        if(nodes.length>0){
            bootbox.confirm({
                locale:"zh_CN",
                message: "确认要删除?",
                buttons: {
                    confirm: {
                        label: '确认',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if(result){
                        $.ajax({
                            url:"http://localhost:8093/dept/"+nodes[0].id,
                            type:"delete",
                            dataType:"json",
                            success:function (result) {
                                if(result.code==200){
                                    bootbox.alert({
                                        message: '删除成功',
                                        size:"small",
                                        title:"提示信息"
                                    });
                                    treeObj.removeNode(nodes[0].id);

                                }
                            },
                        })
                    }
                }
            });

        }else if(nodes.length<1){

        }else {

        }
    }
</script>
</body>
</html>
