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
    <article id="userInfoBox">
        <h2 class="text2">마이페이지</h2>
        <form id="my">
            <div id="userinfo">
                <div class="inputBox">
                    <h4>아이디</h4>
                    <input type="text" id="id" name="id" value="${user.id}" readonly>
                </div>
                <div class="inputBox">
                    <h4>이름</h4>
                    <input type="text" name="name" id="name" value="${user.name}" readonly>
                </div>
                <div class="inputBox">
                    <h4>닉네임</h4>
                    <input type="text" name="nickname" id="nickname" value="${user.nickname}" readonly>
                </div>
                <div class="inputBox">
                    <h4>전화번호</h4>
                    <input type="text" name="phone" id="phone" value="${user.phone}" readonly>
                </div>
                <div class="inputBox">
                    <h4>생년월일</h4>
                    <input type="text" name="birth" id="birth" value="${user.birth}" readonly>
                </div>
                <div class="inputBox">
                    <h4>이메일</h4>
                    <input type="text" name="email" id="email" value="${user.email}" readonly>
                </div>
            </div>
            <div class="btn">
                <button type="button" class="btn-3" onclick="location.href='/user/updateForm'">회원정보 수정</button>
                <button type="button" class="btn-3"  onclick="location.href='/user/deleteForm'">회원탈퇴</button>
            </div>
        </form>
    </article>
    <article id="placeInfoBox">
        <h2>내가 등록한 장소</h2>
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
    </article>
    <article>
        <div class="btn">
            <button type="button" class="btn-3"  onclick="location.href='../mymovieList'">찜한 영화 보러가기</button>
            <button type="button" class="btn-3"  onclick="location.href='../mytvList'">찜한 드라마 보러가기</button>
        </div>
    </article>
</section>
<jsp:include page="../footer.jsp" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/javascript/mypage.js"></script>
</body>
</html>
