<%--
  Created by IntelliJ IDEA.
  User: EZEN
  Date: 2022-11-23
  Time: 오후 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/myList.css">
</head>
<body onload="javascript:loadMyContent()">
<jsp:include page="../header.jsp"/>
<c:set var="userId" value="${log}" scope="session"/>
<input type="hidden" value="${userId}" id="user">

    <section>
        <h3>내가 찜한 영화</h3>
        <div>
            <ul class="nav nav-pills">
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#wish">볼래요</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#watch">봤어요</a></li>
            </ul>
        </div>

        <div class="tab-content">
            <div class="tab-pane fade show active" id="wish">
            </div>
            <div class="tab-pane fade" id="watch">
            </div>
        </div>
    </section>
<jsp:include page="../footer.jsp" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/javascript/myContent.js"></script>
</body>
</html>
