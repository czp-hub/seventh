<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Live2D</title>

    <script type="text/javascript" src="<%=request.getContextPath()%>/commons/jquery-3.3.1.js"></script>
    <link rel="stylesheet" type="text/css" href="https://files.cnblogs.com/files/yjlblog/flat-ui.min.css"/>
    <link href="<%=request.getContextPath()%>/commons/live2d/assets/waifu.css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/commons/live2d/assets/waifu-tips.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/commons/live2d/assets/live2d.js"></script>

</head>
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

<center>
    <a href="<%=request.getContextPath()%>/jumpController/jumpPage?url=main/main">
        <h1>
            去吧
        </h1>
    </a>
</center>
</body>
</html>