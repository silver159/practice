<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메인페이지입니다.</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="../css/styles_main.css"/>
    <link rel="stylesheet" href="../css/style_index.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/rental.js"></script>
    
	    <style type="text/css">
	    
	    .chk_group label:nth-child(n) {
	    	margin: 2px 3px;
	    }
	    
	    .rental-box {
	    	width: 450px;
	    	border: 1px solid gray;
	    	top: 200px;
	    	right: 0;
	    }
	    
	    .rental-box rental-time {
	    	border: none;
	    }
	    
    	.map #map {
		  /* pointer-events: none; */
		  height: 100%;
		  width: 100%;
		  border: 0;
		}
		
		.content-section {
			padding: 2rem;
		}
		
		.service-icon:hover {
			color: #fff;
			background-color: rgb(236, 184, 7);
		}
		
		.service {
		  padding: 3rem 0;
		  background: linear-gradient(90deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.1) 100%), url("./images/bg-callout.jpg");
		  background-position: center center;
		  background-repeat: no-repeat;
		  background-size: cover;
		}
		
		.service h2, .service .h2 {
		  font-size: 3.5rem;
		  font-weight: 700;
		  display: block;
		  max-width: 30rem;
		}	
		
		.masthead {
    	  height: 100vh;
	  	}
    </style>

</head>
<body>
	<!-- Navigation-->
    <a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
			<li class="sidebar-brand">
            	<c:choose>
				    <c:when test="${sessionScope.memberName == null}">
				    	<a class="menu_title" href="<%= request.getContextPath() %>/login/login.do">로그인</a>
				    </c:when>
				    <c:otherwise>
				    	<a href="<%=request.getContextPath()%>/member/info.do">${sessionScope.memberName} 님</a>
				    	&nbsp;&nbsp;
				    	<a href="<%=request.getContextPath()%>/login/logout.do"><i class="bi bi-box-arrow-right"></i></a>
				    </c:otherwise>
				</c:choose>
            </li>        
            <li class="sidebar-nav-item"><a href="#main">홈으로</a></li>
            <li class="sidebar-nav-item"><a href="<%= request.getContextPath()%>/login/register.do">임시 회원가입</a></li>
            <li class="sidebar-nav-item"><a href="#services">몰루</a></li>
            <li class="sidebar-nav-item"><a href="#promotion">어디루</a></li>
            <li class="sidebar-nav-item"><a href="<%= request.getContextPath()%>/rental/rentalPage">랜트카 조회하기</a></li>
        </ul>
    </nav>
    <a class="scroll-to-top rounded" href="#main"><i class="fas fa-angle-up"></i></a>
    
    저는 carList 페이지입니다.
    
    <div class="row">
    	<div class="col-md-3 col-sm-12">
    	</div>
    	<div class="col-md-5 col-sm-12">
			<div id="carListContainer">
				<div class="car-box">
				</div>
			</div>
    	</div>
    	<div class="col-md-4 col-sm-12">
    	</div>
    </div>
	
	
	
	<div class="form-control position-fixed p-1 rental-box">
		<table class="table-bordered form-control">
			<tr>
				<td colspan="2">
					<i class="bi bi-bell"></i> <span id="chk_result">전체 차량</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" class="btn-check" id="chk_all" checked="checked">
					<label class="btn btn-outline-primary" for="chk_all">전체</label>
					<span class="chk_group">
						<input type="checkbox" class="btn-check" id="chk_ele">
						<label class="btn btn-outline-primary" for="chk_ele">전기차</label>

						<input type="checkbox" class="btn-check" id="chk_die">
						<label class="btn btn-outline-primary" for="chk_die">경유</label>

						<input type="checkbox" class="btn-check" id="chk_gas">
						<label class="btn btn-outline-primary" for="chk_gas">휘발유</label>
						<br/>
						<input type="checkbox" class="btn-check" id="chk_sm">
						<label class="btn btn-outline-primary" for="chk_sm">경형/소형</label>

						<input type="checkbox" class="btn-check" id="chk_big">
						<label class="btn btn-outline-primary" for="chk_big">중형/대형</label>

						<input type="checkbox" class="btn-check" id="chk_five">
						<label class="btn btn-outline-primary" for="chk_five">5인승</label>

						<input type="checkbox" class="btn-check" id="chk_five_over">
						<label class="btn btn-outline-primary" for="chk_five_over">5인승 이상</label>
					</span>
					<!-- hidden -->
					<input type="hidden" name="fuel">
					<input type="hidden" name="type">
					<input type="hidden" name="seatCount">
				</td>
			</tr>
			<tr>	
				<td colspan="2">
					<div id="search" class="m-3 text-center">조회하기</div>
				</td>
			</tr>				
		</table>
	</div>
	<form id="article" action="/test/car/article" method="post" hidden>
		<input name="car_idx"/>
		<input name="rentalDateStr"/>
		<input name="dueDateStr"/>
	</form>
	<div id="data-container" data-carlist_json="${carList_json}"></div>
	
	
<script type="text/javascript">
	const carList = ${carList_json};
	const list = carList.list;
	
	
	var carBox = '';
	
	var nextSame = false;
	
	
	for(var i = 0; i < list.length; i ++) {
		var car = list[i];
		
		carBox += nextSame ? onlydata(car) : open(car);
		console.log(carBox);
		if(i != list.length - 1){
			
			if(list[i].model == list[i+1].model){
				//같다.
				nextSame = true;
			}else {
				// 다르다. 닫아준다.
				nextSame = false;
				carBox += close();
			}
		}
	}
	
	carBox += close();
	console.log(carBox);
	$('#carListContainer').html(carBox);
	
	/* 차 한건에 대한 예약하기 버튼 클릭시 예약 페이지로 넘어가기*/
	const reservation = car_idx => {
		var userID = "${memberID}";
		
		if(userID == ''){
			if(confirm('로그인이 필요합니다.\r\n 로그인페이지로 이동하시겠습니까?')){
				location.href='<%= request.getContextPath() %>/login/login.do';
			}
			return false;
		} else {
			$('#article input[name=car_idx]').val(car_idx);
			
			$('#article').submit(); 
			
		}
		
	};
    
</script>
	
    <script src="../js/scripts_main.js"></script>	
</body>
</html>