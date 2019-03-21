<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, model.TextVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>띵동 - 웹툰 큐레이팅</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
body {
	font: 400 15px/1.8 Lato, sans-serif;
	color: #777;
}

h3, h4 {
	margin: 10px 0 30px 0;
	letter-spacing: 10px;
	font-size: 20px;
	color: #111;
}

.container {
	padding: 80px 120px;
}

.person {
	border: 10px solid transparent;
	margin-bottom: 25px;
	width: 80%;
	height: 80%;
}

.person:hover {
	border-color: #f1f1f1;
}

.carousel-inner img {
	width: 100%;
	margin: auto;
}

.carousel-caption h3 {
	color: #000000 !important;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}

.bg-1 {
	background: #ffffff;
	color: #bdbdbd;
}

.bg-1 h3 {
	color: #000000;
}

.bg-1 p {
	font-style: italic;
}

.list-group-item:first-child {
	border-top-right-radius: 0;
	border-top-left-radius: 0;
}

.list-group-item:last-child {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail p {
	margin-top: 15px;
	color: #555;
}

.btn {
	padding: 10px 20px;
	background-color: #333;
	color: #f1f1f1;
	border-radius: 0;
	transition: .2s;
}

.btn:hover, .btn:focus {
	border: 1px solid #333;
	background-color: #fff;
	color: #000;
}

.nav-pills li a, nav-toggle {
	text-align: center;
	color: #000000;
	font-size: 11px;
	border: 0;
}

.nav-pills li a:hover {
	color: #665200;
	background-color: #ffcc00;
	font-weight: bold;
}

.navbar {
	font-family: Montserrat, sans-serif;
	margin-bottom: 0;
	background-color: #ffcc00;
	border: 0;
	font-size: 11px;
	letter-spacing: 4px;
	box-shadow: 0 3px 5px 0 rgba(0, 0, 0, 0.2), 0 5px 10px 0
		rgba(0, 0, 0, 0.19);
}

.navbar li a, .navbar .navbar-brand {
	color: #000000;
}

.navbar-nav li a:hover {
	color: #665200;
	font-weight: bold;
}

.navbar-nav li.active a, .nav-pills li.active a {
	font-weight: bold;
	font-size: 12px;
	background-color: #ffcc00 !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	background-color: #ffcc00;
}

.open .dropdown-toggle {
	color: #ffcc00;
	background-color: #ffcc00 !important;
}

.dropdown-menu li a {
	color: #000 !important;
}

.dropdown-menu li a:hover {
	background-color: #ffeb99 !important;
}


.form-control {
	border-radius: 0;
}

footer {
    background-color: #2d2d30;
    color: #f5f5f5;
    padding: 20px;
    font-size: 11px;
}
footer a {
    color: #f5f5f5;
}
footer a:hover {
    color: #777;
    text-decoration: none;
}  
textarea {
	resize: none;
}

/* 요일별 웹툰 스타일 적용 */
table {
	line-height: 20px;
}

th, td {
	padding: 10px;
	margin: 2px;
	text-align: left;
}

ol, ul {
    list-style: none;
    margin:0px; padding:0px;
   	text-align: left;
}

.floating-box {
    display: inline-block;
    width: 150px;
    height: 120px;
    margin: 20px;
    border: 1px solid #ffffff;  
}

</style>

</head>


<!-- 상단바 한줄로 된 메뉴 (WEBTOON부터~) -->
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="#myPage"><img src="img/logo_bs1.png" height="45px"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">

					<li><a href="#best">최고의 에피소드</a></li>
					<li><a href="#day">요일별웹툰</a></li>
					<li><a href="#toon_all">웹툰백과사전</a></li>
					<li><a href="#contact">마이페이지</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">MORE <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">메뉴1</a></li>
							<li><a href="#">메뉴2</a></li>
							<li><a href="#">메뉴3</a></li>
						</ul></li>
					<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
				</ul>
			</div>
		</div>
	</nav>



<!-- 움직이는 이미지(추천웹툰) -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="/articleboard/graph/bco1.png" width="1200" height="500">
        <div class="carousel-caption">
        
        </div>       
      </div>

      <div class="item">
        <img src="/articleboard/graph/bco2.png" width="1200" height="500">
        <div class="carousel-caption">
       
        </div>      
      </div>
    
      <div class="item">
        <img src="/articleboard/graph/bco3.png" width="1200" height="500">
        <div class="carousel-caption">
       
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>



	
	<!-- 그래프 / 최고의 에피소드 -->
<div id="best" class="bg-1">
  <div class="container text-center">
    <h3 class="text-center">최고의 에피소드</h3>
    <p class="text-center">Best Episode</p>
  

	<a href='http://comic.naver.com/webtoon/detail.nhn?titleId=642700&no=1&weekday=sat' alt="공복의 저녁식사 1화">
	   <img src="/articleboard/graph/dinner.png" width='350px' height='350px' target="_blank"></a>
	<a href='http://comic.naver.com/webtoon/detail.nhn?titleId=597447&no=23&weekday=sat' alt="프리드로우 21화">
		<img src="/articleboard/graph/free.png" width='350px' height='350px' target="_blank"></a>
<br>
	<a href='http://comic.naver.com/webtoon/detail.nhn?titleId=677737&no=2&weekday=sat' alt="대가리 1화">
		<img src="/articleboard/graph/head.png" width='350px' height='350px' target="_blank"></a>
	<a href='http://comic.naver.com/webtoon/detail.nhn?titleId=651673&no=1	91&weekday=sat' alt="유미의 세포 190화">
		<img src="/articleboard/graph/yumi.png" width='350px' height='350px' target="_blank"></a>
  
    </div>
  </div>
	
	
	<!--  전체목록 보기  -->
		<%
			ArrayList<TextVO> list = (ArrayList<TextVO>) request.getAttribute("webtoon_list");
		%>


<section>
	<!-- 요일별 웹툰  -->
	<div id="day" class="container text-center">
		<h3>요일별 웹툰</h3>
		<p>
			<em>webtoon!</em>
		</p>

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">월요웹툰</a></li>
			<li><a data-toggle="tab" href="#menu1">화요웹툰</a></li>
			<li><a data-toggle="tab" href="#menu2">수요웹툰</a></li>
			<li><a data-toggle="tab" href="#menu3">목요웹툰</a></li>
			<li><a data-toggle="tab" href="#menu4">금요웹툰</a></li>
			<li><a data-toggle="tab" href="#menu5">토요웹툰</a></li>
			<li><a data-toggle="tab" href="#menu6">일요웹툰</a></li>
		</ul>

		<%
			if (list == null) {
		%>
		<h3 align="center">"아무것도없다"</h3>
		<%
			} else {
		%>

		<div class="tab-content">
			<!-- 월요일 -->
			<div id="home" class="tab-pane fade in active">
 				<ul>
					<%
						for (TextVO vo : list) {
								if (vo.getDay().contains("mon")) {
					%>
					<div class="floating-box">
					<li>
						<a
							href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>' target="_blank">
							<img src='<%=vo.getImg_url()%>'>
						</a>
						<dl>
							<dt><%=vo.getTitle()%></dt>
							<dd><%=vo.getDay()%></dd>
							<dd><%=vo.getAuthor()%></dd>
						</dl>
					</li>
</div>
					<%
						}
							}
					%>
 				</ul>
			</div>
			<%
				}
			%>

			<div id="menu1" class="tab-pane fade">
				<ul>
					<%
						for (TextVO vo : list) {
							if (vo.getDay().contains("tue")) {
					%>

										<div class="floating-box">
					<li>
						<a
							href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>' target="_blank">
							<img src='<%=vo.getImg_url()%>'>
						</a>
						<dl>
							<dt><%=vo.getTitle()%></dt>
							<dd><%=vo.getDay()%></dd>
							<dd><%=vo.getAuthor()%></dd>
						</dl>
					</li>
</div>

					<%
						}
					}
					%>
				</ul>
			</div>

			<div id="menu2" class="tab-pane fade">
				<ul>
					<%
						for (TextVO vo : list) {
							if (vo.getDay().contains("wed")) {
					%>

										<div class="floating-box">
					<li>
						<a
							href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>' target="_blank">
							<img src='<%=vo.getImg_url()%>'>
						</a>
						<dl>
							<dt><%=vo.getTitle()%></dt>
							<dd><%=vo.getDay()%></dd>
							<dd><%=vo.getAuthor()%></dd>
						</dl>
					</li>
</div>

					<%
						}
					}
					%>
				</ul>
			</div>
			<div id="menu3" class="tab-pane fade">
				<ul>
					<%
						for (TextVO vo : list) {
							if (vo.getDay().contains("thu")) {
					%>

									<div class="floating-box">
					<li>
						<a
							href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>' target="_blank">
							<img src='<%=vo.getImg_url()%>'>
						</a>
						<dl>
							<dt><%=vo.getTitle()%></dt>
							<dd><%=vo.getDay()%></dd>
							<dd><%=vo.getAuthor()%></dd>
						</dl>
					</li>
</div>

					<%
						}
					}
					%>
				</ul>
			</div>
			<div id="menu4" class="tab-pane fade">
				<ul>
					<%
						for (TextVO vo : list) {
							if (vo.getDay().contains("fri")) {
					%>

									<div class="floating-box">
					<li>
						<a
							href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>' target="_blank">
							<img src='<%=vo.getImg_url()%>'>
						</a>
						<dl>
							<dt><%=vo.getTitle()%></dt>
							<dd><%=vo.getDay()%></dd>
							<dd><%=vo.getAuthor()%></dd>
						</dl>
					</li>
</div>

					<%
						}
					}
					%>
				</ul>
			</div>
			<div id="menu5" class="tab-pane fade">
				<ul>
					<%
						for (TextVO vo : list) {
							if (vo.getDay().contains("sat")) {
					%>

										<div class="floating-box">
					<li>
						<a
							href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>' target="_blank">
							<img src='<%=vo.getImg_url()%>'>
						</a>
						<dl>
							<dt><%=vo.getTitle()%></dt>
							<dd><%=vo.getDay()%></dd>
							<dd><%=vo.getAuthor()%></dd>
						</dl>
					</li>
</div>
					<%
						}
					}
					%>
				</ul>
			</div>
			
			<div id="menu6" class="tab-pane fade">
				<ul>
					<%
						for (TextVO vo : list) {
							if (vo.getDay().contains("sun")) {
					%>

									<div class="floating-box">
					<li>
						<a
							href='http://comic.naver.com/webtoon/list.nhn?titleId=<%=vo.getId()%>' target="_blank">
							<img src='<%=vo.getImg_url()%>'>
						</a>
						<dl>
							<dt><%=vo.getTitle()%></dt>
							<dd><%=vo.getDay()%></dd>
							<dd><%=vo.getAuthor()%></dd>
						</dl>
					</li>
</div>

					<%
						}
					}
					%>
				</ul>
				
			</div>
		</div>
	</div>
	

	
	<!-- 관리자 모드 -->

 	<div id="toon_all" class="container text-center">
<!-- 		<h3>manager/password</h3> -->
		<h3>웹툰백과사전</h3>
		<form method="post" action ="/articleboard/mdcd" target="iframe_all">
		
<!-- 			<input name="manager" type ="text" required>
			<input name="password" type= "text" required> -->
			
			<button type ="submit">목록보기</button>
		</form>
		<iframe name="iframe_all" id="iframe_all" src="" height="400" width="100%"
		 style="border:0px"></iframe>
	</div>	

	<script>
	var tag = document.getElementById("article"); 
	</script>
	
	 
	<!-- 담기 모드 
	<div id="manage" class="container text-center">
		<h3>담기 모드 이동</h3>
		<p><a href="/articleboard/newsjsp/check.jsp">담기모드로</a><p>
		
		<form method="post" name = "readLike" action ="/articleboard/mdcd">
			<button type ="submit" onclick = >목록전체보기</button>
		</form>
	</div>	
	 -->
	
	
</section>

		<!-- Footer (만든 사람 표시) -->
<!-- Footer (만든 사람 표시) -->
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>Made in 맨땅에코딩</p> 
</footer>

	<!-- 자바스크립트쪽  -->
	<script>
		$(document).ready(
				function() {
					// Initialize Tooltip
					$('[data-toggle="tooltip"]').tooltip();

					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {

								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {

									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 900, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							});
				})
	</script>

</body>
</html>
