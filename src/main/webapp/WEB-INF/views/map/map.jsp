<%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-18
  Time: 오후 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>촬영지 지도</title>
    <link rel="stylesheet" href="css/wholeMap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div class="map" id="map" style="width:700px;height:700px;"></div>

<div class="xy"></div>


<div>

    <form>
    <select class="areaName" onchange="printResult()">
        <option>선택</option>
        <option value="">전체</option>
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="인천">인천</option>
        <option value="부산">부산</option>
        <option value="대전">대전</option>
        <option value="광주">광주</option>
        <option value="대구">대구</option>
        <option value="경상">경상</option>
        <option value="전라">전라</option>
        <option value="제주">제주</option>
        <option value="강원">강원</option>
    </select>

    </form>

    <table class="all_map" id="all_map">
        <thead class="title1">
            <tr>
                <th>이미지</th>
                <th>장소명</th>
                <th>주소</th>
                <th>영화바로가기</th>
                <th>신고하기</th>
            </tr>
        </thead>
        <tbody class="container">
        </tbody>
    </table>


</div>

<script>

</script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
<script src="/javascript/allMap.js"></script>
<script src="/javascript/report.js"></script>
</body>
</html>