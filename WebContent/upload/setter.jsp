<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1" >
<title>My Setter</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<style>
	body{
		font-size:0.9em;
		
	}
	#menuDiv{			
		height:100px;
		font-family: 'Montserrat', sans-serif;
	}
	#logoDiv{
		height:100px;
	}	
	#logoDiv img{
		width:300px;
		height:100px;
	}
	#myInfo img{
		width:50px;
		height:50px;	
			
	}
	#myAcornNum img{
		width:20px;
		height:20px;
	}
	.nav-link{
		color:black;
	}
	.nav-link:hover{
		font-weight:bolder;
	}
	/* 헤더:점보트론 */
	#mainText{
		font-weight:bold;
	}
	.jumbotron {
		margin:0px auto;
		width:99%;
		padding: 0rem 1rem 0rem 1rem;
		margin-bottom: 10px;
		background-color: white;
		border-radius: 0.3rem;
	}
	.jumbotron h1{
		text-align:center;
		margin-bottom:30px;
	}
		
	.jumbotron h3{
		text-align:center;
		margin-bottom:30px;
		
	}
	.jumboTitle{
		font-size:1.2em;
		margin:10px;			
	}
	.jumboContent{
		font-size:1.2em;
		font-family: 'Montserrat', sans-serif;		
	}
	header .jumbotron{
		margin:0px auto;
		width:99%;
		padding: 5rem 1rem 2rem 1rem;
		background-image:url("../img/mainSetter.jpg");
		background-size:cover;
		background-repeat:no-repeat;
		background-position : center center;	
		border:black solid 2px;	
	}

	/* 액션유도div */
		
	#actionImage{
		margin:0px auto;
		width:99%;
		padding: 1rem 1rem 1rem 1rem;
		background-image:url("../img/mainSetter2.jpg");
		background-size:cover;
		background-repeat:no-repeat;
		background-position : center center;	
			
	}
	#actionText{
		color:white;
		font-weight:bold;
	}
	
		#myAcorn img{
		width:20px;
		height:20px;
	}
</style>
</head>
<body>

	<!-- 로그인 회원가입 ,로고 등등 들어갈 메뉴nav -->
	<nav class="navbar row">
		<div id="menuDiv" class="container col-md-12">			
			<!-- 로고가 들어갈 div -->
			<div id="logoDiv" ><a href="<%=request.getContextPath()%>/index.do"><img src="<%=request.getContextPath() %>/img/logo.jpg"/></a></div>
				<!-- 멤버 : 로그인,회원가입 -->													
			<div id="memberDiv"><!-- 우측정렬 -->
				<ul class="nav justify-content-end align-items-center">					
					<!-- 미 로그인상태 -->
					<c:if test="${loginStatus!=1 }">						
						<li id="login" class="nav-item"><a href="#" class="nav-link" data-toggle="modal" data-target="#loginModal">login</a></li>
						<li id="signUp" class="nav-item"><a href="<%=request.getContextPath()%>/signup/signup.do" class="nav-link">SignUp</a></li>
					</c:if>
					<!-- 로그인상태 -->
					<c:if test="${loginStatus==1 && vo.userImage!=null}">
						<li id="mySetter" class="nav-item"><a href="upload.do" class="nav-link">My Setter</a></li>
						<li id="myAcornNum" class="d-flex" ><p class="p-0">${vo.myAcorn}</p>						
							<img src="<%=request.getContextPath() %>/img/acorn.png" class="p-0"/>
						</li>
															<!--  수정 -->	
						<li id="myInfo" class="nav-item">
							<a href="#" class="nav-link" data-toggle="popover" 
							data-placement="left" data-title="My Info" 
							data-popover-content="#myInfoPopover"><img src="data:image/jpeg;base64,${vo.userImage}" class="rounded-circle" id="profile"></a>
						</li>
					</c:if>
					<c:if test="${loginStatus==1 && vo.userImage==null}">
						<li id="myAcornNum" class="d-flex" >
							
							<p class="p-0">${vo.myAcorn}</p>
							<img src="<%=request.getContextPath() %>/img/acorn.png" class="p-0"/>
							
						</li>									<!--  수정 -->	
						<li id="myInfo" class="nav-item">
							<a href="#" class="nav-link" data-toggle="popover" 
							data-placement="left" data-title="My Info" 
							data-popover-content="#myInfoPopover"><img src="<%=request.getContextPath()%>/img/profile-picture.jpg" class="rounded-circle" id="profile"></a>
						</li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
	
	<div id="myInfoPopover" style="display:none" >
		<ul class="nav row">
			<li class="nav-item col-12"><a href="<%=request.getContextPath()%>/myProfile/myProfile.do" class="nav-link">My Profile</a>
			<li class="nav-item col-12"><a href="<%=request.getContextPath()%>/logout.do"  class="nav-link" id="logOut">log Out</a>
			<li class="nav-item col-12"><a href="<%=request.getContextPath()%>/signup/payment.do"  class="nav-link" id="payment">Buy Acorn</a>
			<li class="nav-item col-12" ><a href="<%=request.getContextPath()%>/index.do" class="nav-link" id="getterMode">Getter Mode</a>

		</ul>
	</div>

	<header>
		<div class="jumbotron row">
			<div class="col-12" id="mainText">
				<h1><b>Get additional profit by Sharing your talent!</b></h1>
				<div class="row justify-content-center">
					<div class="col-2 p-0 text-center">
						<div class="jumboTitle">Total Setters</div>
						<div class="jumboContent">37,246 People</div>
					</div>
					<div class="col-2 p-0 text-center">
						<div class="jumboTitle">Average Monthly Profit</div>
						<div class="jumboContent">$ 1,593</div>
					</div>
				</div>
			</div>
			
		</div>
	</header>
	
	
	<section>
			<!-- 사용매뉴얼  -->
		<div class="jumbotron">
		<hr/>
			<h3><b>**How to be a Setter</b></h3>
			<div class="row justify-content-center">
				<div class="col-12 col-md-4 p-0 text-center">
					<div class="jumboTitle"><b>1. Shoot a Video</b></div>
					<div class="jumboContent"><i>Clear images help Getters to concentrate.</i></div>
				</div>
				<div class="col-12 col-md-4 p-0 text-center">
					<div class="jumboTitle"><b>2. Upload your file</b></div>
					<div class="jumboContent"><i>"GetterSetter" supplies a very simple way.</i></div>
				</div>
				<div class="col-12 col-md-4 p-0 text-center">
					<div class="jumboTitle"><b>3. Make various career</b></div>
					<div class="jumboContent"><i>"GetterSetter" is always on your side.</i></div>
				</div>
			</div>
		<hr/>	
		</div>
		
		<!-- 액션 유도 -->
		<div class="container-fluid jumbotron row align-items-center" id="actionImage">
		
			<div class="col-6 row justify-content-center" id="actionText">
				<h3 class="col-12">Upload your Content Right Now!</h3>
				<a href="<%=request.getContextPath()%>/upload/upload.do" class="btn btn-light col-11" style="font-family: 'Montserrat', sans-serif;"><b>Upload Now</b></a>
			</div>
			<div class="col-6" ></div>
		</div>
	</section>


	<!-- 회사 정보 -->
	<div id="footer" class="row align-items-center">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-8" style="text-align:center">
			<hr/>
			<b>GetterSetter</b> Business No. : 428-34-23442<br/>
			Representative : An.SSam | Phone : 02-6453-5567
			<p><i>33, Siheung-daero 163-gil, Guro-gu, Seoul, Republic of Korea</i></p>
			<p><b><a href="#">Employment</a> | <a href="#">Information</a> | <a href="#">Application Download</a></b></p>
		</div>
		<div class="col-12 col-md-2"></div>
		
	</div>

</body>
 <script type="text/javascript" src="../main.js"></script> 
</html>