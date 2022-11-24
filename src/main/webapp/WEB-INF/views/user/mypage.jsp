<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-20
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="user" value="${user}" scope="session"/>
<jsp:include page="../header.jsp" />
<section>
    <form>
        <div>
            <h2>마이페이지</h2>
            <div>
                <h4>아이디</h4>
                <input type="text" id="id" name="id" value="${user.id}" readonly>
            </div>
            <div>
                <h4>비밀번호</h4>
                <input type="password" id="password" value="${user.password}" readonly>
            </div>
            <div>
                <h4>이름</h4>
                <input type="text" name="name" id="name" value="${user.name}" readonly>
            </div>
            <div>
                <h4>닉네임</h4>
                <input type="text" name="nickname" id="nickname" value="${user.nickname}" readonly>
            </div>
            <div>
                <h4>전화번호</h4>
                <input type="text" name="phone" id="phone" value="${user.phone}" readonly>
            </div>
            <div>
                <h4>생년월일</h4>
                <input type="text" name="birth" id="birth" value="${user.birth}" readonly>
            </div>
            <div>
                <h4>이메일</h4>
                <input type="text" name="email" id="email" value="${user.email}" readonly>
            </div>
        </div>
        <div>
            <button type="button" onclick="location.href='/user/updateForm'">회원정보 수정</button>
            <button type="button" onclick="location.href='/user/deleteForm'">회원탈퇴</button>
        </div>
    </form>
    <button onclick="location.href='../myMovieList'">찜한 영화 보러가기</button>
    <button onclick="location.href='../myTvList'">찜한 드라마 보러가기</button>
</section>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
