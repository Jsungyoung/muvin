<%--
  Created by IntelliJ IDEA.
  User: 박진규
  Date: 2022-11-18
  Time: 오후 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="css/boardWrite.css">
</head>
<body>
<section>
  <div class="container">
    <form class="write_form">


      <div>
        <input type="text" id="title" name="title" required>
      </div>
      <div>
        <textarea name="content" id="content" rows="20" required></textarea>
      </div>
<%--      <input type="submit" value="작성" onclick="createBoard()">--%>
      <input type="button" value="home" onclick="location.href='/board'">
    </form>
  </div>
</section>
</body>
</html>
