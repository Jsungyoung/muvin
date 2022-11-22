<%--
  Created by IntelliJ IDEA.
  User: 박진규
  Date: 2022-11-20
  Time: 오후 5:09
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
<jsp:include page="header.jsp" />
<section>
    <div class="container">

        <form method="get" class="update_form">

            <c:set var="view" value="${update}" scope="session"/>
            <input type="hidden" id="no" value="<c:out value="${sessionScope.view.no}"/>">

            제목
            <div>
                <input type="text" id="title" name="title" value="<c:out value="${sessionScope.view.title}"/>"/>
            </div>

            <div>
                방문일 : <input type="date" id="visit_date" name="visit_date" value="<c:out value="${sessionScope.view.visit_date}"/>">
            </div>
                <%--        </c:forEach>--%>
            <div>
                <textarea name="content" id="content" rows="20" ><c:out value="${sessionScope.view.title}"/></textarea>
            </div>
            <div>
                점수 : <input type="number" max="10" min="0" id="score" name="score" value="<c:out value="${sessionScope.view.score}"/>" >
            </div>
                <%--      <input type="submit" value="작성" onclick="createBoard()">--%>
            <input type="button" value="home" onclick="location.href='/board'">
            <input type="button" value="수정" onclick="updateBoard()">
        </form>
            <%--            <script src="javascript/boardView.js"></script>--%>
    </div>

</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="javascript/boardUpdate.js"></script>
</body>
</html>