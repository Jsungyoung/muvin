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
<jsp:include page="header.jsp" />
<section>
  <div class="container">
    <form method="get" class="write_form">



        <c:set var="view" value="${review}" scope="session"/>

        <input type="hidden" id="no" value="<c:out value="${sessionScope.view.no}"/> ">

            제목
        <div>
            <input type="text" id="title" name="title" readonly value="<c:out value="${sessionScope.view.title}"/>"/>
        </div>

        <div>
            <%--
                            수정일과 작성일이 같은경우 작성일 출력
                            작성일과 수정일이 다른경우 수정일 출력
            --%>
            <c:if test="${sessionScope.view.reg_date==sessionScope.view.mod_date}">
                작성일 : <c:out value="${sessionScope.view.reg_date}"/>
            </c:if>
            <c:if test="${sessionScope.view.reg_date!=sessionScope.view.mod_date}">
                <div>
                작성일 : <c:out value="${sessionScope.view.reg_date}"/>
                / 수정일 : <c:out value="${sessionScope.view.mod_date}"/>
                </div>
            </c:if>
        </div>
        <div>
            방문일 : <c:out value="${sessionScope.view.visit_date}"/>
        </div>
<%--        </c:forEach>--%>
        <c:forEach items="${images}"  var="img">
            <input type="image"  src="<c:out value="${img.url}"/>" onclick="return false">
        </c:forEach>
        <div>
        <textarea name="content" id="content" rows="20"  readonly><c:out value="${sessionScope.view.content}"/></textarea>
        </div>
<%--      <input type="submit" value="작성" onclick="createBoard()">--%>
      <input type="button" value="home" onclick="location.href='/board'">
    </form>

      <button><a href="http://localhost:8084/boardUpdate?no=${sessionScope.view.no}">수정하기</a></button>
      <input type="button" value="삭제하기" onclick="delBoard()">
<%--            <script src="javascript/boardView.js"></script>--%>
  </div>
</section>
<jsp:include page="footer.jsp" />
<script src="javascript/deleteBoard.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</body>
</html>
