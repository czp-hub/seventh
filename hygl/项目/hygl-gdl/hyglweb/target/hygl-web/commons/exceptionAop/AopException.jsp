<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<body>
<script >
    var token = "";
    if (sessionStorage.getItem("token")) {
        token = sessionStorage.getItem("token");
    }
    $(function () {
        $.ajaxSetup({ //发送请求前触发
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            complete: function (XMLHttpRequest, textStatus) {
                var nologin = XMLHttpRequest.getResponseHeader("NOLONGIN");
                if (nologin == "5006") {
                    window.location.href = "<%=request.getContextPath()%>/index.jsp";
                }
            },
            beforeSend: function (xhr) { //可以设置自定义标头
                xhr.setRequestHeader('token', token);
            }
        })
        if(token == '' || token == "undefined"){
            csJsp();
        }
    })



    function csJsp() {
        $.post({
            url:"http://localhost:8090/user/jupmJsp",
            dataType:"json",
            async:false,
        });
    }

</script>

</body>
</html>
