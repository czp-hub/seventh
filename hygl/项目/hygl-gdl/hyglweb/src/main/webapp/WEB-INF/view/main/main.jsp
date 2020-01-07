<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/30
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:include page="../../commons/jqCss.jsp"></jsp:include>
<style>
    li{
        list-style: none;
    }
</style>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid" style="background-color: #00aaee">
        <div class="navbar-header">
            <img alt="Brand" src="/commons/img/hygl_artery4_right_02.jpg" style="width: 130px;height: 84px">
        </div>
        <div class="navbar-header" style="float: left;padding-left: 30px">
            <h1><span style="color: #b9def0">北京市人民政府办公厅</span></h1>
        </div>
        <div class="navbar-header" style="float: left;padding-left: 30px">
            <h1><span style="color: #ad6704">会议管理系统</span></h1>
        </div>
        <div class="navbar-header" style="float: left;padding-left: 250px;padding-top: 20px">
            <h4 ><a style="color: #b9def0"><i class="glyphicon glyphicon-home"></i>首页</a></h4>
        </div>
        <div class="navbar-header" style="float: left;padding-left: 150px;padding-top: 20px">
            <h4 ><a style="color: #b9def0"><i class="glyphicon glyphicon-user"></i></a></h4>
        </div>
        <div class="navbar-header" style="float: right;padding-top: 20px">
            <h4><a style="color: #b9def0">退出</a></h4>
        </div>
    </div>
</nav>
    <div class="container-fluid" >
        <div class="row">
            <div class="col-xs-3" style="height: 600px">
                <ul class="list-group" id="systemListPage">
                </ul>
            </div>
            <div class="col-xs-8" style="height: 600px;">
                <div class="panel panel-default">
                    <div class="panel-footer" id="frameMainTitle">
                        <span><i class="bg-primary"></i>后台首页</span>
                    </div>
                    <div class="panel-body">
                        <footer>
                            <iframe style="width: 100%;height: 100%" id="mainIframe" src="" scrolling="no" frameborder="no" ></iframe>
                        </footer>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="../../../commons/exceptionAop/AopException.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        showSystemList()
    })

    function showSystemList() {
        $.ajax({
            url:"http://localhost:8091/rights/"+0,
            type:"get",
            dataType:"json",
            success:function (result) {
                if ("200" == result.code){
                    console.info(result.data)
                    var systemListPage="";
                    var systemList=result.data;
                    for (var i = 0; i < systemList.length; i++) {
                        if (0 == systemList[i].pid){
                            systemListPage+='<a href="#javascript:void(0);" onclick="secondShow('+systemList[i].id+')">\n' +
                                '                        <li class="list-group-item">\n' +
                                '                                <span id="systemSpan_'+systemList[i].id+'" class="glyphicon glyphicon-chevron-right">'+systemList[i].rightName+'</span>\n'+
                                '                                <div id="second_'+systemList[i].id+'"><div>'+
                                '                        </li>\n' +
                                '              </a>';
                        }
                    }
                    $("#systemListPage").html(systemListPage);
                }
            }
        })
    }
    function secondShow(pId) {
        $.ajax({
            url:"http://localhost:8091/rights/"+pId,
            type:"get",
            dataType:"json",
            success:function (result) {
                if ("200" == result.code){
                    var systemList=result.data;
                    var secondPage="";
                    for (var i = 0; i < systemList.length; i++) {
                        if (0 != systemList[i].pid && pId == systemList[i].pid){
                            secondPage+='<ul>\n' +
                                '                        <a href="#javascript:void(0);" onclick="mainClick(\''+systemList[i].rightUrl+'\',this)">\n' +
                                '                            <li><span class="glyphicon glyphicon-menu-right">'+systemList[i].rightName+'</span></li>\n' +
                                '                        </a>\n' +
                                '                    </ul>';
                        }
                    }
                    $("#second_"+pId).html(secondPage);
                }
            }
        })
        $("#systemSpan_"+pId).attr("class","glyphicon glyphicon-chevron-down");
    }
    function mainClick(url,obj) {
        $("#frameMainTitle span").html('<i class=""></i>'+$(obj).text());
        $("#mainIframe").attr("src","/jumpController/jumpPage?url="+url);
    }
</script>
</html>
