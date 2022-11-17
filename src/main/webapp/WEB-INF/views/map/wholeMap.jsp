<%@ page import="java.util.ArrayList" %>
<%@ page import="org.hibernate.boot.model.source.internal.hbm.MappingDocument" %>
<%@ page import="com.example.muvin.domain.place.Place" %>
<%@ page import="com.example.muvin.domain.place.PlaceRepository" %>
<%@ page import="com.example.muvin.domain.place.PlaceDto" %>
<%@ page import="com.example.muvin.service.PlaceService" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %><%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-15
  Time: 오후 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>지도</title>
</head>
<body>
<%
    // 영화 코드가 '1' 이라고 치면
    String movie_code = "1";

     PlaceService place = new PlaceService();

     List<Place> places = place.readPlaceList(movie_code);

%>

    <div class="layout">
        <table>
            <thead>
                <tr>
                    <th>장소의 x좌표</th>
                    <th>장소의 y좌표</th>
                    <th>지역 이름</th>
                    <th>영화 코드</th>
                </tr>
            </thead>
            <tbody>
            <%for(Place plist : places){ %>
                <tr>
                    <td><%=plist.getX()%></td>
                    <td><%=plist.getY()%></td>
                    <td><%=plist.getArea_name()%></td>
                    <td><%=plist.getArea_code()%></td>
                </tr>
            </tbody>
            <%
                }
            %>
        </table>




    </div>



</script>
</body>
</html>
