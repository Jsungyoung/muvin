<%@ page import="java.util.ArrayList" %>
<%@ page import="org.hibernate.boot.model.source.internal.hbm.MappingDocument" %>
<%@ page import="com.example.muvin.domain.place.Place" %>
<%@ page import="com.example.muvin.domain.place.PlaceRepository" %>
<%@ page import="com.example.muvin.domain.place.PlaceDto" %>
<%@ page import="com.example.muvin.service.PlaceService" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="javax.websocket.MessageHandler" %>
<%@ page import="com.example.muvin.controller.WholeMapController" %>
<%@ page import="org.springframework.stereotype.Service" %><%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-15
  Time: 오후 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>지도</title>
<%--    <link rel="stylesheet" href="/css/wholeMap.css">--%>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>

<div class="tvmovie"></div>
<div id="map" style="width:500px ;height:500px;"></div>



<table class="board_list" id="board_list">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="10%"/>

    </colgroup>
    <thead>
    <tr>

        <th scope="col">이미지</th>
        <th scope="col">장소이름</th>
        <th scope="col">별점</th>
        <th scope="col">장소이름</th>
        <th scope="col">별점</th>

    </tr>
    </thead>
    <tbody>



    <form method="get"  class="write_form">

        <c:forEach items="${maplist}" var="mplace" >
            <tr>
                <td><img src="${mplace.place_URL}"> </td>
                <td><c:out value="${mplace.place_name}"/></td>
                <td><c:out value="${mplace.area_name}"/></td>
                <input type="hidden" name="no" id="movie_code" value="${mplace.movie_code}"/>
                <td><a href="http://localhost:8084/boardView?no=${mplace.no}"><c:out value="${mplace.title}"/></a></td>
            </tr>

        </c:forEach>

    </form>
    </tbody>

</table>




<script src="/javascript/wholeMap.js"></script>
<script>

    const urlParams = new URL(window.location.href).searchParams;
    const movieid = urlParams.get('movie_id');
    const tvid = urlParams.get('tv_id');

    let output = '';
    if(movieid !== null) {
        output = "<input type='hidden' value='${movieid}' />"
    } else if (tvid !== null){
        output = "<input type='hidden' value='${tvid}' />"
    }
    $('.tvmovie').append(output);

</script>
</body>
</html>
