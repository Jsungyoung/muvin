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
<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="css/board.css">

</head>
<body>
<jsp:include page="header.jsp" />
<section>

<div class="container">
    <h2>게시글 목록</h2>
    <div>
        <form name="search_form" autocomplete="off">
            <select name="type">
                <option selected style="background-color: black" value="title">제목</option>
                <option style="background-color: black" style="color: black" value="content">내용</option>
            </select>
            <input type="text" style="color: black" id="keyword" value="" name="keyword"/>
            <input type="button" style="color: black" onclick="searchExe(form.type.value)" value="검색">
        </form>
            <input type="button" style="color: black" onclick="getSearchTitle2()" value="출력테스트">
    </div>
    <table class="board_list" id="board_list">
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

<%--        <div id='result'>0</div>--%>
        <form method="get"  class="write_form">

        <c:forEach items="${list}" var="place" >
            <tr>
<%--onclick="location.href='/board'--%>
                    <td><c:out value="${place.no}"/></td>
                    <input type="hidden" name="no" id="no" value="${place.no}"/>
<%--                    <td><a href="http://localhost:8084/v1/board/reviewNo?no=${place.no}"><c:out value="${place.title}"/></a></td>--%>
                    <td><a href="http://localhost:8084/boardView?no=${place.no}"><c:out value="${place.title}"/></a></td>
                    <td><c:out value="${place.pr_nickname}"/></td>
                    <td><c:out value="${place.visit_date}"/></td>
                    <td><c:out value="${place.score}"/></td>
                    <td><c:out value="${place.reg_date}"/></td>
            </tr>
        </c:forEach>
        </form>
        </tbody>

    </table>




<%--    <button type="button" style="color: black" onclick="location.href='/boardWriteForm'">글쓰기</button>--%>
<%--    <input type="button" value="submit" onclick="createBoard()">--%>
    <input type="button" style="color: black" value="home" onclick="location.href='/board'">
    <input type="image" src="https://i.ibb.co/ZVmpFB5/1.png" />
    <script src="javascript/boardView.js"></script>
    <script src="javascript/count.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>
