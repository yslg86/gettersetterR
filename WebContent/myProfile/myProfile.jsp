<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>My Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="myProfile.js"></script>
<script src="main.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="myProfile.css" type="text/css"/>
</head>
<header>
	<nav class="navbar row">
		<div id="menuDiv" class="container col-md-12">			
			<!-- 로고가 들어갈 div -->
			<a href="<%=request.getContextPath()%>/index.do"><div id="logoDiv"><img src="<%=request.getContextPath()%>/img/logo.jpg"/></div></a>
				<!-- 멤버 : 로그인,회원가입 -->													
			<div id="memberDiv"><!-- 우측정렬 -->
				<ul class="nav justify-content-end align-items-center">
					<li id="myInfo" class="nav-item">
					<!-- 아이디값주기 -->
						<a href="#" class="nav-link nav-link-blk" data-toggle="popover" 
						data-placement="left" data-title="My Info" 
						data-popover-content="#myInfoPopover"><img src="${path }/profileImage/${mem.userImage}" class="rounded-circle avatar" id="profile"></a>  					</li>
						<%-- <img src="${path }/profileImage/${mem.userImage}"/> --%>
				</ul>
			</div>
		</div>
	</nav>
	<!-- myinfo popover -->
	<div id="myInfoPopover" style="display:none" >
		<ul class="nav row">
			<li class="nav-item col-12"><a href="my_profile.html" class="nav-link nav-link-blk">My Profile</a>
			<li class="nav-item col-12"><a href="main.html"  class="nav-link nav-link-blk" id="logOut">Log Out</a>
			<li class="nav-item col-12" ><a href="main_setter.html" class="nav-link nav-link-blk" id="setterMode">Setter Mode</a>
			
		</ul>
	</div>
	<div style="margin-bottom:2%"></div>
</header>
<body>
<div class="container-fluid"> <!-- Main Div -->
	<div class="row"> <!-- row Div -->
		<div class="col-sm-2"> <!-- left col -->
			<div class="text-center proFrm"> 
			<form method="post" action="<%=request.getContextPath()%>/myProfile/myProfileOk.do" enctype="multipart/form-data" class="form-horizontal">
				<img src="img/profile-picture.jpg" class="proImg img-thumbnail img-fluid rounded-circle file-upload avatar" alt="avatar"/>
				<input type="file" id="proImgUpload" name="profilechange" class="text-enter center-block file-upload hidden"/>
				<input type="hidden" name="ischange" value="ok"/>
				<!-- <button id="proImgBtn"class="btn btn-outline-primary" data-toggle="tooltip" data-placement="bottom" title="Photo Size=170*170">Add</button> -->
				<button>Apply to Profile</button>
			</form>
			</div>
		</div> <!--left col(3) -->
		<div class="col-sm-10" style="padding-left:0;"> <!-- right col -->
			<div class="card card-primary">
				<div class="card-body">
					<div class="card-title">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link nav-link-pri active" data-toggle="tab" href="#profile-1"><i class="far fa-user-circle"></i> Profile</a></li>
							<li class="nav-item"><a class="nav-link nav-link-pri" data-toggle="tab" href="#wishList"><i class="far fa-clock"></i> Wish List</a></li>
							<li class="nav-item"><a class="nav-link nav-link-pri" data-toggle="tab" href="#history"><i class="fas fa-history"></i> History</a></li>
							<li class="nav-item"><a class="nav-link nav-link-pri" data-toggle="tab" href="#order"><i class="fas fa-shopping-cart"></i> Order</a></li>
						</ul>
					</div>
					
					<div class="tab-content">
						<div class="tab-pane fade show active" id="profile-1">
						
						<div class="tab-pane fade show active" id="profile-1">
							<div>ID : ${mem.userid}</div>
							PASSWORD <div id=pwDiv><button id = "changeBtn1" class="btn btn-outline-primary" >Change</button><form method="post" action="<%=request.getContextPath()%>/myProfile/myProfileOk.do"><div id=c1>Insert new PW<input type=password id=pwCha>Check Again<input type=password id=pwCheck name="pwchange"><button class="btn btn-danger" id="cha11">Change</button></div></div><br/></form>
							<div>TEL : ${mem.tel}</div><button id = "changeBtn2" class="btn btn-outline-primary">Change</button><form method="post" action="<%=request.getContextPath()%>/myProfile/myProfileOk.do"><div id=c2><input type=text id=telCha name="telchange"><button class="btn btn-danger" id="chaB">Change</button></div><br/><br/></form>
							<div>E-MAIL : ${mem.email}</div><button id = "changeBtn3" class="btn btn-outline-primary">Change</button><form method="post" action="<%=request.getContextPath()%>/myProfile/myProfileOk.do"><div id=c3><input type=text id=mailCha name="emailchange"><button class="btn btn-danger" id="chaC">Change</button></div><br/><br/></form>
							<div>Interest : ${mem.interestStr }</div><button id = "changeBtn4" class="btn btn-outline-primary">Change</button><br/>
									<div id="total">
										<div id=div1 > <!-- 관심분야 선택영역 -->
											<div class="btn-group" id="sport"> <!-- 관심분야설정 -->
												<div class="btn dropdown-toggle result" data-toggle="dropdown" style="background:#00069C;color:white">SPORTS</div>
												<div class="dropdown-menu btn" style="background:#4EA8D8">
												<a href="#" class="dropdown-item" id="bodybuilding1" >BODYBUILDING</a>
												<a href="#" class="dropdown-item" id="soccer1">SOCCER</a>
												<a href="#" class="dropdown-item" id="climbing1">CLIMBING</a>
												</div>
											</div><br/>
											<div class="btn-group" id="arts"><!-- 관심분야설정 -->
												<div class="btn dropdown-toggle result" data-toggle="dropdown"style="background:#00764B;color:white" >ARTS</div>
													<div class="dropdown-menu btn" style="background:#91D94F">
													<a href="#" class="dropdown-item" id="acting2">ACTING</a>
													<a href="#" class="dropdown-item" id="dancing2">DANCING</a>
													<a href="#" class="dropdown-item" id="art2">ART</a>
													</div>
											</div><br/>	
											<div class="btn-group" id="humanities"><!-- 관심분야설정 -->
												<div class="btn dropdown-toggle result" data-toggle="dropdown"style="background:#2F2F2F;color:white" >HUMANITIES</div>
													<div class="dropdown-menu btn" style="background:#D6D8DB">
													<a href="#" class="dropdown-item" id="economy3">ECONOMY</a>
													<a href="#" class="dropdown-item" id="philosophy3">PHILOSOPHY</a>
													<a href="#" class="dropdown-item" id="history3">HISTORY</a>
													</div>
											</div>	
										</div>	
										<div id="div2"> <!-- 관심분야 결과영역 -->
											<ul>
												<li id=list1><div id ="list1btn1" class="btn result" ></div><div class="btn result" id="list1btn2" style="background:white;"></div><button class="btn btn-danger dbutton result" id="delete1">X</button></li>
												<li id=list2><div id ="list2btn1" class="btn result" ></div><div class="btn result" id="list2btn2" style="background:white;"></div><button class="btn btn-danger dbutton result" id="delete2">X</button></li>
												<li id=list3><div id ="list3btn1" class="btn result" ></div><div class="btn result" id="list3btn2" style="background:white;"></div><button class="btn btn-danger dbutton result" id="delete3">X</button></li>
											</ul>
										</div>
										<form method="post" id="interform" action="<%=request.getContextPath()%>/myProfile/myProfileOk.do" >
										<div id="interest">
										<input type="hidden" name="interestchange" value="ok"/>
										<button id = closeBtn class="btn btn-outline-primary">Insert & Close</button>
										</div>
										</form>
										</div>
			
									</div>
									<form method="post" id="delete" action="<%=request.getContextPath()%>/myProfile/myProfileDeleteOk.do" >
									 
									<button id = deleteBtn  class="btn btn-outline-primary" >Delete my Account including my Information</button> 
									</form>
						
						</div>
						<div class="tab-pane fade" id="wishList"><!-- Wish List --></div> <!-- Wish List -->
						<div class="tab-pane fade" id="history"><!-- History --><div class="media">
									<div class="media-left">
											<img class="media-object thumbnail-img media-click" src="img/actingThumb1.jpg"/>
											<img class='media-object thumbnail-img media-clock' src='img/clock.jpg' data-toggle="tooltip" data-placement="bottom" title="Wish List"/>
									</div>
									<div class="media-body media-body-frm media-selected">
										<div class="media-heading">
											<img class='media-object thumbnail-img media-close' align='right' src='img/close.jpg'data-toggle="tooltip" data-placement="bottom" title="Remove from History"/>
											<b class="fnt-size-title media-click">Acting_01_A</b>
										</div>
										<span class="fnt-size-content media-click">Instructor : GYEOUNGHO, JI</span>
										<span class="fnt-size-content media-click"><i class="fas fa-users fa-xs"></i> 3,658</span><br/>
										<span class="fnt-size-content media-click">It addresses the essential programming problems and solutions that must be taken to successfully view the coding interview (developer interview). There are a total of 21 courses in five minutes per concept. From the concept of OOP to alignment, data structure, algorithm, and other important concepts that the interviewer would like to learn.</span>
									</div>
								</div><hr class="hr-line"/><div class="media">
								<div class="media-left">
										<img class="media-object thumbnail-img media-click" src="img/actingThumb2.jpg"/>
										<img class='media-object thumbnail-img media-clock' src='img/clock.jpg' data-toggle="tooltip" data-placement="bottom" title="Wish List"/>
								</div>
								<div class="media-body media-body-frm media-selected">
									<div class="media-heading">
										<img class='media-object thumbnail-img media-close' align='right' src='img/close.jpg'data-toggle="tooltip" data-placement="bottom" title="Remove from History"/>
										<b class="fnt-size-title media-click">Acting_02_A</b>
									</div>
									<span class="fnt-size-content media-click">Instructor : GYEOUNGHO, JI</span>
									<span class="fnt-size-content media-click"><i class="fas fa-users fa-xs"></i> 51,233</span><br/>
									<span class="fnt-size-content media-click">It addresses the essential programming problems and solutions that must be taken to successfully view the coding interview (developer interview). There are a total of 21 courses in five minutes per concept. From the concept of OOP to alignment, data structure, algorithm, and other important concepts that the interviewer would like to learn.</span>
								</div>
							</div><hr class="hr-line"/><div class="media">
								<div class="media-left">
										<img class="media-object thumbnail-img media-click" src="img/actingThumb3.jpg"/>
										<img class='media-object thumbnail-img media-clock' src='img/clock.jpg' data-toggle="tooltip" data-placement="bottom" title="Wish List"/>
								</div>
								<div class="media-body media-body-frm media-selected">
									<div class="media-heading">
										<img class='media-object thumbnail-img media-close' align='right' src='img/close.jpg'data-toggle="tooltip" data-placement="bottom" title="Remove from History"/>
										<b class="fnt-size-title media-click">Acting_03_C</b>
									</div>
									<span class="fnt-size-content media-click">Instructor : GYEOUNGHO, JI</span>
									<span class="fnt-size-content media-click"><i class="fas fa-users fa-xs"></i> 3,506</span><br/>
									<span class="fnt-size-content media-click">It addresses the essential programming problems and solutions that must be taken to successfully view the coding interview (developer interview). There are a total of 21 courses in five minutes per concept. From the concept of OOP to alignment, data structure, algorithm, and other important concepts that the interviewer would like to learn.</span>
								</div>
							</div>
							
							
							</div> <!-- History -->
						<div class="tab-pane fade" id="order">
							order
						</div>
					</div><!-- tab-content -->
				</div><!-- card-body -->
			</div><!-- card -->
		</div> <!-- right col(9) -->
	</div> <!-- row Div -->
</div> <!-- Main Div -->
<footer>
	<div id="companyInfoDiv" class="border row align-items-center"style="font-size:0.9em">
		<div class="col-12 col-md-4"><img src="<%=request.getContextPath()%>/img/logo.jpg" style="cursor:pointer" onclick="location.href='<%=request.getContextPath()%>/index.do'"></div>
		<div class="col-12 col-md-4">
			<p>GetterSetter|CEO:A-TownOG|TEL:02-333-3333|EMAIL:Gese@gmail.com|Business Code:428-34-23442|Address:		
			</p>
		</div>
		<div class="col-12 col-md-4">
			<p>
				recruit | how to use | app-download
			</p>
		</div>
	</div>
</footer>
</body>

<script>
var interestArr = [];
$("#closeBtn").on('click', function(){
	//배열값으로 파라미터 전송
	var str ="";
	$.map(interestArr,function(a){
		str += "<input type='hidden' name='interest' value='"+a+"'/>"
	});
	document.getElementById("interest").innerHTML += str;
	document.getElementById("interform").submit();
});
$(".dbutton").on('click', function(){
	var id = $(this).attr("id");
	var type = id.substr(id.length-1,1); // id가 delete2 => '2'
	
	var index = interestArr.indexOf(id);
	interestArr.splice(index,1);
	
	if(type == '1'){
		$("#list1").css("display","none");
	}else if(type == '2'){
		$("#list2").css("display","none");
	}
	else if(type == '3'){
		$("#list3").css("display","none");
	}
	
}); 
$(".dropdown-item").on('click', function(){
	var id = $(this).attr("id");
	var type = id.substr(id.length-1,1); // id가 soccer1 => '1'
	id = id.substr(0, id.length-1); // id가 soccer1 => 'soccer'
	
	
	var big;
	var bc;
	var list1val;
	var list2val;
	var list3val;
	if($("#list1").css("display")=="block"){
		list1val = $("#list1btn2").text();
	}
	if($("#list2").css("display")=="block"){
		list2val = $("#list2btn2").text();
	}
	if($("#list3").css("display")=="block"){
		list3val = $("#list3btn2").text();
	}
	
	if((list1val == id.toUpperCase()|| list2val == id.toUpperCase()|| list3val == id.toUpperCase())){
		$("#overlapModal").modal();
		return; // 중복체크 이 시점에서 함수 종료  $(".dropdown-item").on('click', function(){}) 에 해당하는 함수부분. 이 아래 함수부분은 실행 안됨.
	}
	
	
	if(type == '1'){
		big = "SPORTS";
		bc = "#00069C";
	}else if(type == '2'){
		big = "ARTS";
		bc = "#00764B";
	}
	else if(type == '3'){
		big = "HUMANITIES";
		bc = "#2F2F2F";
	}
	
	interestArr.push(id);
	
	if($("#list1").css("display")=="none"){
		
		$("#list1btn1").text(big);
		$("#list1btn1").css("background",bc);
		$("#list1btn2").text(id.toUpperCase());
		$("#list1").css("display", "block")
	}else if($("#list2").css("display")=="none"){
		$("#list2btn1").text(big);
		$("#list2btn1").css("background",bc);
		$("#list2btn2").text(id.toUpperCase());
		$("#list2").css("display", "block");
		}
		else if($("#list3").css("display")=="none"){
		$("#list3btn1").text(big);
		$("#list3btn1").css("background",bc);
		$("#list3btn2").text(id.toUpperCase());
		$("#list3").css("display", "block");
		}
	
	});
</script>
</html> 