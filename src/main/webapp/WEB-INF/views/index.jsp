<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-13
  Time: 오후 6:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/grid.css">
    <link rel="stylesheet" href="/css/slide.css">
    <title>Title</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
<header><h1>movin</h1></header>
<nav class="nav_tab">
    <ul>
        <li>탐색</li>
        <li>영화</li>
        <li>메뉴1</li>
        <li>문의</li>
        <li>로그인</li>
    </ul>
</nav>
<section>
<div class="gallery">
    <ul class="clearfix">
        <li><div class="img">box4</div></li>
        <li><div class="img">box5</div></li>
        <li><div class="img">box1</div></li>
        <li><div class="img">box2</div></li>
        <li><div class="img">box3</div></li>
        <li><div class="img">box4</div></li>
        <li><div class="img">box5</div></li>
        <li><div class="img">box1</div></li>
    </ul>
</div>

<div class="g_item">
    <ul>
        <li class="on"></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>

<div class="container-holder">
    <div class="click-prev nav-button">◀</div>
    <div class="outsideViewBefore container"><img src="https://i.ytimg.com/vi/9pazuPD3AtU/hqdefault.jpg" /></div>
    <div class="inView1 container"><img src="https://i.ytimg.com/vi/z6FYVuSDPT0/hqdefault.jpg" /></div>
    <div class="inView2 container"><img src="https://i.ytimg.com/vi/AXXqMfdASns/hqdefault.jpg" /></div>
    <div class="inView3 container"><img src="https://i.ytimg.com/vi/JNgVNAwFk1E/hqdefault.jpg" /></div>
    <div class="inView4 container"><img src="https://i.ytimg.com/vi/hmH5jv12DjI/hqdefault.jpg" /></div>
    <div class="inView5 container"><img src="https://i.ytimg.com/vi/3TxuFOG-q1Y/hqdefault.jpg" /></div>
    <div class="outsideViewAfter container"><img src="https://i.ytimg.com/vi/6G7cc4S4KTM/hqdefault.jpg" /></div>
    <div class="click-next nav-button">▶</div>
</div>

<!--The following just discribes the code, and is not needed for it to run (Inline css was used as to not clutter the actual css for the containers)-->
<div style="width: 100%; margin-top: 10%; font-family: lato, sans-serif;" class="description">
    <h3 style=" text-align: center;">How does it work?</h3>
    <div style="width: 70%; margin-left: 10%; max-width: 700px;">

        <h4 style="">Very basic description:</h4>
        <p style="">컨테이너 좌측 이동 시: 첫 번째는 좌측에 음수 margin  받고 view에서 밀림 & 다른 컨테이너는 1unit씩 이동</p>
        <br>

        <h4 style="">More detailed description:</h4>
        <p>In this example, there are 7 containers, 5 in view, and 2 out of view.
            <br>
            근데 얘 원래 이랬는지 모르겠는데 슬라이드 넘어갈 때 버튼이 스륵 내려갔다옴;;
            <br> HTML Layout -
            각 컨테이너는 float left & width 20% (100%/containers in view)
            negative margin-left equal to the width (-20%)
            last container will have a negative margin right of the same value
            <br>
            컨테이너 클래스 transition 속성
            트랜지션에 마진 - 효과 더 주고 싶으면 투명도
            transition for the opacity 50%-70% the length of that of the margin
            use ease for both transition(otherwise it might look a little bit stuttery at times if you use linear)
            <br>
            마진의 transition speed가 제이쿼리 timeout 함수에서 사용됨
            <br>
            <br>
            내비 버튼 - 컨테이너 홀더 안에 absolute position(좌측 버튼은 left: 0, 우측 버튼은 right:0)
            근데 니맘대루 해두 됨
            <br>
            <br> To move everything to a side, lets take left,
            we shift every container's class to the class of the container to its left.
            This is being done by using the "swapClass" function for each element,
            requiring you to manually write the code for each container.
            First we will move the classes for container 1-after (we don't move the before container for now).
            So container 1 will move left out of view because it gets a negative margin to the left,
            while container after moves into view because it loses its
            negative margin to the right.
            <br> timeout function, with the same duration as the css animation for the container's margin transition.
            This means that what is inside the timeout function will happen when the animation (css transition) ends.
            Now the "before" container
            gets removed from the DOM, we swap the before class with the after class,
            and then put it back into the DOM after the previous "after" container (which now is the 5'th container).
            I will see about making a function in the future that will automatically
            get the classes in the container and switch them.
            <br>
            <br>
            애니메이션 진행 중일 때(timeout 함수가 실행되기 전) 다음/이전 버튼 사용자가 누르는 것 막기 위해 animationPause 변수 설정 -> 애니메이션이 활성하ㅗ되어 있는지
            애니메이션 시작하면 1, 끝나면 0

        </p>
    </div>
</div>
</section>
<footer>
    선준 진규 성영 진아 승우
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
</body>
<script src="/javascript/slide.js"></script>
</html>
