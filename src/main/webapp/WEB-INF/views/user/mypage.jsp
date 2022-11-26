<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-20
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/css/mypage.css">
    <title>Title</title>
</head>
<body>
<c:set var="user" value="${user}" scope="session"/>
<jsp:include page="../header.jsp"/>
<section>
    <form id="my">
        <h2>마이페이지</h2>

        <h4>아이디</h4>
        <input type="text" id="id" name="id" value="${user.id}" readonly>

        <h4>이름</h4>
        <input type="text" name="name" id="name" value="${user.name}" readonly>

        <h4>닉네임</h4>
        <input type="text" name="nickname" id="nickname" value="${user.nickname}" readonly>

        <h4>전화번호</h4>
        <input type="text" name="phone" id="phone" value="${user.phone}" readonly>

        <h4>생년월일</h4>
        <input type="text" name="birth" id="birth" value="${user.birth}" readonly>

        <h4>이메일</h4>
        <input type="text" name="email" id="email" value="${user.email}" readonly>
        <div class="btn">
            <button type="button" onclick="location.href='/user/updateForm'">회원정보 수정</button>
            <button type="button" onclick="location.href='/user/deleteForm'">회원탈퇴</button>
        </div>
    </form>
    <table>
        <thead>
        <th>번호</th>&nbsp;&nbsp;
        <th>영화 이름</th>&nbsp;&nbsp;
        <th>장소 이름</th>&nbsp;&nbsp;
        <th>주소</th>&nbsp;&nbsp;
        <th>삭제</th>&nbsp;
        </thead>
        <tbody id="placesInfo">

        </tbody>
    </table>

    <div class="btn">
        <button type="button" onclick="location.href='../mymovieList'">찜한 영화 보러가기</button>
        <button type="button" onclick="location.href='../mytvList'">찜한 드라마 보러가기</button>
    </div>
</section>
<jsp:include page="../footer.jsp" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/javascript/mypage.js"></script>
</body>
</html>
