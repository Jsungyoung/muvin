<%--
  Created by IntelliJ IDEA.
  User: hanseung-u
  Date: 2022/11/25
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/report.css"/>
</head>
<body>
<div class="background">
<div class="window">
    <div class="popup">
        <input type="hidden" id="placeNo"/>
        <select onchange="changeCategory(this)">
            <option value="컨텐츠와 상관없는 내용">컨텐츠와 상관없는 내용</option>
            <option value="비속어 사용">비속어 사용</option>
            <option value="홍보글/도배글">홍보글/도배글</option>
            <option value="개인정보 유">개인정보 유출</option>
            <option value="불쾌한 표현">불쾌한 표현</option>
            <option value="불법정보를 포함함">불법정보를 포함함</option>
        </select>
        <textarea id="content"></textarea>
        <button onclick="sendReport()">보내기</button>
        <button onclick="closePopup()">팝업닫기</button>
    </div>
</div>
</div>

<script src="/javascript/report.js"></script>
</body>
</html>
