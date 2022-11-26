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
    <link rel="stylesheet" href="css/boardWrite.css">

    <!-- 서머노트를 위해 추가해야할 부분 -->

    <!--  -->
</head>
<body>
<jsp:include page="header.jsp" />
<%
    HttpSession sessionCheck = request.getSession();
    String id = (String)sessionCheck.getAttribute("log");
%>
<section>
<%--    <div class="container">--%>
<%--        <textarea class="summernote" name="editordata"></textarea>--%>
<%--    </div>--%>
<%--    <script>--%>
<%--        $('.summernote').summernote({--%>
<%--            height: 150,--%>
<%--            lang: "ko-KR"--%>
<%--        });--%>
<%--    </script>--%>

    <input type="hidden" id="no" name="no" value="">
    <div class="container">
        <form method="post"  class="write_form">
            <%--        <input type="hidden" id="no" name="no" value="">--%>
            <input type="date" id="visit_date" name="visit_date" value="2022-11-18">
            <input type="hidden" id="pr_nickname" name="pr_nickname" value="닉네임">

            <div>
                <input type="text" id="title" name="title" required>
            </div>
            <div>
                <textarea name="content" id="content" rows="20" required></textarea>

<%--            <textarea name="contents" id="summernote"></textarea>--%>
            </div>
            <input type="number" max="10" min="0" id="score" name="score" >
            <input type="file" id="input_img" onchange="imageUpdate()" accept="image/*">
            <input type="button" value="작성" onclick="createBoard()">
            <input type="button" value="home" onclick="location.href='/board'">
        </form>
    </div>

</section>

<%--서머노트 --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<script src="javascript/createBoard.js"></script>
<script src="javascript/imageUpdate.js"></script>
</body>
</html>