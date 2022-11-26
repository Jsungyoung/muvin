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
</head>
<body>
<div class="background">
<div class="window">
    <div class="popup">
        <input type="hidden" id="placeNo"/>
        <select onchange="changeCategory()">
            <option value="1">컨텐츠와 상관없는 내용</option>
            <option value="2">비속어 사용</option>
            <option value="3">홍보글/도배글</option>
            <option value="4">개인정보 유출</option>
            <option value="5">불쾌한 표현</option>
            <option value="6">불법정보를 포함함</option>
        </select>
        <textarea id="content"></textarea>
        <button onclick="sendReport()">보내기</button>
        <button id="close">팝업닫기</button>
    </div>
</div>
</div>
</body>
</html>
