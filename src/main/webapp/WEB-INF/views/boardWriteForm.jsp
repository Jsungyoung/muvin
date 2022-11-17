<%--
  Created by IntelliJ IDEA.
  User: 박진규
  Date: 2022-11-17
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
보드라이트입니다
<section>
    <form class="write_form" name="writeForm" method="post" action="">
        <div>
            <input type="text" id="title" name="title" required>
        </div>
        <div>
            <textarea name="content" id="content" rows="20" required></textarea>
        </div>
        <input type="submit" value="작성">
    </form>
</section>
</body>
</html>
