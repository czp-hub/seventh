<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>M（.T V T.）M</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/commons/login/css/style.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/commons/login/css/body.css"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/commons/jquery-3.3.1.js"></script>
    <link rel="stylesheet" type="text/css" href="https://files.cnblogs.com/files/yjlblog/flat-ui.min.css"/>
    <link href="<%=request.getContextPath()%>/commons/live2d/assets/waifu.css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/commons/live2d/assets/waifu-tips.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/commons/live2d/assets/live2d.js"></script>
</head>


<script>
    function  longIn() {
        var userName= $("#userName").val();
        var userPassword=  $("#userPassword").val();
        $.ajax({
            url: "http://localhost:8090/login/queryLong",
            dataType: "json",
            type:"POST",
            data:{
                userName:userName,
                password:userPassword
            },
            success: function (result) {
                if(result.code==200){
                    var token = result.data;
                    sessionStorage.setItem("token",token);
                    location.href="<%=request.getContextPath()%>/jumpController/jumpPage?url=main/main";
                }
                alert(result.message)
            },
            error:function () {
                alert("遇到未知错误")
            }
        })
    }
</script>


<body>


<%--核心min--%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/commons/live2d/assets/waifu.css">
<%--换装模板    形象切换 --%>
<div class="waifu" id="waifu">
    <div class="waifu-tips" style="opacity: 1;"></div>
    <div class="waifu-tool">
        <span class="fui-home"></span>
        <span class="fui-chat"></span>
        <span class="fui-eye"></span>
        <span class="fui-user"></span>
        <span class="fui-photo"></span>
        <span class="fui-info-circle"></span>
        <span class="fui-cross"></span>
    </div>
    <canvas id="live2d" width="280" height="250" class="live2d">
    </canvas>
</div>


<%--css样式--%>
<script src="<%=request.getContextPath()%>/commons/live2d/assets/live2d.js"></script>
<script src="<%=request.getContextPath()%>/commons/live2d/assets/waifu-tips.js"></script>
<script type="text/javascript">initModel()</script>


<div class="container">
    <section id="content">
        <form action="">
            <h1>会员登录</h1>
            <div>
                <input type="text" placeholder="邮箱" required="" id="userName" />
            </div>
            <div>
                <input type="password" placeholder="密码" required="" id="userPassword" />
            </div>
            <div class="">
                <span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>			</div>
            <div>
                <input type="submit" value="登录" onclick="longIn()"  class="btn btn-primary" id="js-btn-login"/>
                <a href="#">忘记密码?</a>
            </div>
        </form>
        <div class="button">
            <span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
            <a href="#">点击查看</a>
        </div>
    </section>
</div>


<br>
<div style="text-align:center;">
</div>
</body>
</html>