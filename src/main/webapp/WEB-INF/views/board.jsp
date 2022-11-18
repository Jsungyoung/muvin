<%@ page import="com.example.muvin.domain.place_review.Place_review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.muvin.domain.place_review.Place_reviewDto" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.muvin.service.Place_reviewService" %>
<%@ page import="org.springframework.web.bind.annotation.GetMapping" %>
<%@ page import="com.example.muvin.domain.place_review.Place_reviewRepository" %>
<%@ page import="com.example.muvin.domain.user.UserDto" %><%--
  Created by IntelliJ IDEA.
  User: 박진규
  Date: 2022-11-15
  Time: 오전 11:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="css/board.css">

</head>
<body>
<div class="container">
    <h2>게시글 목록</h2>
    <table class="board_list">
        <colgroup>
            <col width="15%"/>
            <col width="*"/>
            <col width="10%"/>
            <col width="15%"/>
            <col width="5%"/>
            <col width="15%"/>
        </colgroup>
        <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">방문일</th>
            <th scope="col">별점</th>
            <th scope="col">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="place">
            <tr>

                    <td><c:out value="${place.no}"/></td>
                    <td><a href="boardView.jsp?no=${place.no}"><c:out value="${place.title}"/></a></td>
                    <td><c:out value="${place.pr_nickname}"/></td>
                    <td><c:out value="${place.visit_date}"/></td>
                    <td><c:out value="${place.score}"/></td>
                    <td><c:out value="${place.reg_date}"/></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button type="button" onclick="location.href='/boardWriteForm'">글쓰기</button>
<%--    <input type="button" value="submit" onclick="createBoard()">--%>
    <input type="button" value="home" onclick="location.href='/board'">
</div>
</body>
</html>