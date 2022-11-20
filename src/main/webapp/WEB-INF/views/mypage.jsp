<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-20
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="id" value="${sessionScope.log}"/>
<c:out value="${id}"/>
</body>
</html>
