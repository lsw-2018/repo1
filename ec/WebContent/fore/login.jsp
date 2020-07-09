<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/user/login.action" method="post">
    <input type="text" name="username"/><br><br>
    <input type="password" name="password"/><br><br>
    <input type="submit" value="登录"/>
</form>
</body>
</html>