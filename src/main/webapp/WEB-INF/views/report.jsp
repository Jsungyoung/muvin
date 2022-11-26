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
    <style>
        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 1000;

            /* 숨기기 */
            z-index: -1;
            opacity: 0;
        }

        .show {
            opacity: 1;
            z-index: 1000;
            transition: all 0.5s;
        }

        .window {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .popup {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);

            /* 임시 지정 */
            width: 100px;
            height: 100px;

            /* 초기에 약간 아래에 배치 */
            transform: translate(-50%, -40%);
        }

        .show .popup {
            transform: translate(-50%, -50%);
            transition: all 0.5s;
        }
    </style>
</head>

<body>
<button onclick="show()">팝업열기</button>
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
            <button onclick="closePopup()">팝업닫기</button>
        </div>
        <div>
            <div></div>
        </div>
    </div>
</div>

<script>
    function show() {
        document.querySelector(".background").className = "background show";
    }

    function close() {
        document.querySelector(".background").className = "background";
    }

    document.querySelector("#show").addEventListener("click", show);
    document.querySelector("#close").addEventListener("click", close);
</script>
</body>
</html>
