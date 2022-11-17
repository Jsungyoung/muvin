<%@ page import="com.example.muvin.entity.Place_review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.muvin.domain.place_review.Place_reviewDto" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.muvin.service.Place_reviewService" %><%--
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
<%
Place_reviewService service = new Place_reviewService();
List<Place_review> list = service.readReviewAll();
%>
<div class="container">
    <h2>게시글 목록</h2>
    <table class="board_list">
        <colgroup>
            <col width="15%"/>
            <col width="*"/>
            <col width="10%"/>
            <col width="20%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="board">
            <tr>
                <td><c:out value=""/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>