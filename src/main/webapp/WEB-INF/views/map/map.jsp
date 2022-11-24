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
</head>
<body>
<jsp:include page="../header.jsp" />

<div class="map" id="map" style="width:700px;height:700px;"></div>

<div class="xy"></div>


<div>
    requestScope.placeList.size() : ${requestScope.placeList.size()}


        <button class="areaName" onclick="printResult()" value="서울">서울</button>
        <button class="areaName" value="경기">경기</button>
        <button class="areaName" value="인천">인천</button>
        <button class="areaName" value="부산">부산</button>
        <button class="areaName" value="대전">대전</button>
        <button class="areaName" value="광주">광주</button>
        <button class="areaName" value="대구">대구</button>
        <button class="areaName" value="경상">경상</button>
        <button class="areaName" value="전라">전라</button>
        <button class="areaName" value="제주">제주</button>
        <button class="areaName" value="충청">충청</button>
        <button class="areaName" value="강원">강원</button>



    <table class="all_map" id="all_map">
        <thead class="title1">
        </thead>
        <tbody class="container">
        </tbody>



        <%--
        <tbody>
        <c:forEach items="${requestScope.placeList}" var="placeList">
            <tr>
                <td><img style="width: 50px; height: 50px;" src="${placeList.placeURL}"></td>
                <td><c:out value="${placeList.placeName}"/></td>
                <td><c:out value="${placeList.areaName}"/></td>
                <td><input type="hidden" id="movie_code" value="${placeList.movieCode}"></td>
            </tr>
        </c:forEach>
        </tbody>
        --%>
    </table>


</div>
<script>

    function printResult() {
        $('.title1').empty();
        $('.container').empty();
        let areaName =$('.areaName').val();


        let settings = {
            url: "http://localhost:8084/v1/map2/?areaName=" + areaName ,
            method: "GET",
            timeout: 0,
            headers: {
                "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
                "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L",
                "Cookie": "JSESSIONID=4F6D07857C9FB21FD2E10BCF0C294D06"
            },
        };

        $.ajax(settings).done(function (response) {
            async : false,
            console.log(response);
            const list = response;

            $('.title1').append(
                `<tr>
                    <th>이미지</th>
                    <th>장소명</th>
                    <th>주소</th>
                    <th>영화바로가기</th>
                </tr>`
            );

            let str = '';

            list.forEach(e => {
                console.log(e);
                let placeURL = e.placeURL;
                let placeName = e.placeName;
                let areaName = e.areaName;
                let movieCode = e.movieCode;
                let areaCode = e.areaCode;



                str='<tr>'
                str+="<td>"+'<img style="width : 50px; height : 50px;" src='+placeURL+'>'+"</td>";
                str+="<td>"+placeName+"</td>";
                str+="<td>"+areaName+"</td>";
                str+="<td>"+movieCode+"</td>";
                str+="</tr>";
                $('.container').append(str);


            })
        });
    };


</script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="/javascript/allMap.js"></script>
</body>
</html>
