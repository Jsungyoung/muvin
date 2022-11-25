<%--
  Created by IntelliJ IDEA.
  User: EZEN
  Date: 2022-11-24
  Time: 오후 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body onload="javascript:loadMyTv()">
<jsp:include page="../header.jsp"/>
<section>
  <h3>내가 찜한 영화</h3>
  <div>
    <ul class="nav nav-pills">
      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#wish">볼래요</a></li>
      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#watch">봤어요</a></li>
    </ul>
  </div>

  <div class="tab-content">
    <div class="tab-pane fade show active" id="wish">
      <c:set var="wishlist" value="" scope="request"/>
      <div>
        <c:forEach items="${wishlist}" var="item" varStatus="info" begin="1" end="1">

        </c:forEach>
      </div>
    </div>
    <div class="tab-pane fade" id="watch">
      봤다고 한 콘텐츠
    </div>
  </div>
</section>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>

