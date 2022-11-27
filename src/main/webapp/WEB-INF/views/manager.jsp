<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-24
  Time: 오후 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/wholeMap.css">
    <title>Title</title>
</head>
<style>
    table {
        width: 1000px;
    }
</style>
<body>
<jsp:include page="header.jsp"/>
<section>

    <table>
        <h1>관리자 페이지</h1>
        <thead>
        <tr>
            <th>번호</th>&nbsp;&nbsp;
            <th>카테고리</th>&nbsp;&nbsp;
            <th>신고내용</th>&nbsp;&nbsp;
            <th>영화이름</th>&nbsp;&nbsp;
            <th>장소이름</th>
        </tr>
        </thead>
        <tbody id="container">

        </tbody>
    </table>
</section>
<jsp:include page="footer.jsp" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/javascript/reportAll.js"></script>
</body>
</html>
