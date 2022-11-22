<%--
  Created by IntelliJ IDEA.
  User: EZEN
  Date: 2022-11-21
  Time: 오후 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/contentAll.css">
</head>
<body>
<jsp:include page="../header.jsp" />
    <section>
        <form method="post" action="javascript:findContent()">
            <input type="text" id="query">
            <input type="submit" value="검색하기">
        </form>

        <div class="content_all"></div>
    </section>

<script src="/javascript/findContent.js"></script>
</body>
</html>
