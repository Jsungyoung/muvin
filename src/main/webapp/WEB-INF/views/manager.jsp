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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>

    <table>
        <h1>관리자 페이지</h1>
        <thead>
        <tr>
            <th>번호</th>&nbsp;&nbsp;
            <th>내용</th>&nbsp;&nbsp;
            <th>영화이름</th>&nbsp;&nbsp;
            <th>주소</th>
        </tr>
        </thead>
        <tbody id="container">
        </tbody>
    </table>
</section>
<script src="/javascript/reportAll.js"></script>
</body>
</html>
