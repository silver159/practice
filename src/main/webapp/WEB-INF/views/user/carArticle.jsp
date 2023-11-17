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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="../css/styles_main.css"/>
    <link rel="stylesheet" href="../css/style_index.css"/>
    <style type="text/css">
    
     #rental-box {
     	width: 450px;
    	border: 1px solid gray;
    	top: 200px;
    	right: 30px;
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
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 

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
    저는 차 1건을 보는 페이지입니다.
	

	<div class="car-box">
		<div class="p-3 d-flex">
			<div>
				<%-- <img src="upload/maker/${car.maker}" alt="maker 사진"/> --%>
				<h4>${car.maker}</h4>
				<h3 id="model">${car.model}</h3>
			</div>
			<div class="position-relative">
				<img class=""
					src="<%= request.getContextPath()%>/images/car.png"
					width="300px"/>
			</div>
		</div>
		<!-- 차이름 가격 및 예약버튼  -->
		<div>
			<p>${car.model} ${car.series}</p>
			<span>${car.year}년식 · ${car.seatCount}인승</span>
		</div>
		<div>
			${car.dayCost}
		</div>
	</div>
	<div id="rental-box" class="form-control p-1">
		<table class="table-bordered form-control">
			<tr class="rental_day">
				<td colspan="2">
					<i class="bi bi-clock"></i> <span id="date_result">${rentalDate} ~ ${dueDate}</span>
 				</td>
			</tr>
			<tr class="rental_schedule" hidden="hidden">
				<td colspan="1">
					대여 : <input id="rental_start" class="form-control" type="date" name="rentalDate" min="${rentalDate}" value="${rentalDate}">
 				</td>
				<td colspan="1">
					반납 : <input id="rental_end" class="form-control" type="date" name="dueDate" min="${dueDate}" value="${dueDate}">
 				</td>
 			</tr>
 			<tr class="rental_schedule" hidden="hidden">
				<td colspan="2">
					<div class="text-center m-2 schedule_select">일정 선택완료</div>
 				</td>
			</tr>
			<tr>
				<td colspan="2">
					<i class="bi bi-bell"></i>${car.model} ${car.series}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					1일 대여 요금 <br/>
					${car.dayCost}원
				</td>
			</tr>
			<tr>	
				<td colspan="2" id="cost_result">
					<div id="data" style="width: 380px;"
						data-car_idx="${car.car_idx}"
						data-rental_date="${rentalDate}"
						data-due_date="${dueDate}"
						class="m-3 text-center">${car.dayCost}원로 예약하기</div>
				</td>
			</tr>
		</table>
	</div>
	
	<script type="text/javascript">
	$(() => {
		
		/* 날짜창 띄우기 (날짜 클릭)*/
		$('.rental_day').click(() => {
			$('.rental_schedule').removeAttr('hidden');
			$('.rental_day').attr('hidden', 'hidden');
		});
		
		/* 결과창 띄우기 (일정선택완료 클릭)*/
		$('.schedule_select').click(() => {
			
			/* 결과창 내용 변경 코드 필요*/
			const rentalDateStr = $('input[name=rentalDate]').val();
			const dueDateStr = $('input[name=dueDate]').val();
			
			const result = rentalDateStr+ '~' +dueDateStr;
			$('#date_result').html(result);
			
			/* 빌린 일수와 1일 대여요금 계산 */
			var rentalDate = new Date(rentalDateStr);
			var dueDate = new Date(dueDateStr);
			
			var milliseconds = dueDate - rentalDate;
			
			var count = ( milliseconds / 86400000 );
			
			const data = $('#data');
			
			data.attr('data-rental_date', rentalDateStr);
			data.attr('data-due_date', dueDateStr);
			
			
			
			data.html(count * ${car.dayCost} + "원로 예약하기");
			
			$('.rental_schedule').attr('hidden', 'hidden');
			$('.rental_day').removeAttr('hidden');
		});
		
		/* 대여일 값 변경 시 반납일 조정 함수*/
		$('#rental_start').change(context => {
			var target = $(context.target);
			var dueDateObj = $('#rental_end');
			
			
			var rentalDate = new Date(target.val());
			rentalDate.setDate(rentalDate.getDate() + 1);
			var dueDate = rentalDate;
			var dueDateString = formatDate(dueDate, 'yyyy-MM-dd');

			// 입련되어 있던 값으로 날짜 크기 비교
			var rentalDate = new Date(target.val());
			var dueDate = new Date(dueDateObj.val());
			
			console.log(dueDate, rentalDate);
			console.log(dueDateString);
			
			if(rentalDate >= dueDate){
				console.log('대여일이 크다.')
				dueDateObj.attr('min', dueDateString);
				dueDateObj.val(dueDateString);
			} else {
				console.log('반압일이 크다.')
				dueDateObj.attr('min', dueDateString);
			}

		});
		// simpleFomatDate 메소드
		const formatDate = (date, pattern) => {

			if(pattern ==  'yyyy-MM-dd'){
				const year = date.getFullYear();
				const month = String(date.getMonth() + 1).padStart(2, '0');
				const day = String(date.getDate()).padStart(2, '0');
				const fomatDate = year+ '-' +month+ '-' +day;
				return fomatDate;
			} else if(pattern == 'MM.dd(E)'){
				const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
				const month = date.getMonth() + 1; // 월은 0부터 시작하므로 +1
				const day = date.getDate();
				const dayOfWeek = date.getDay(); // 요일은 0(일요일)부터 6(토요일)까지
				
				// 월과 일이 한 자리 수인 경우 두 자리 수로 변경
				const formatMonth = month < 10 ? `0${month}` : month;
				const formatDay = day < 10 ? `0${day}` : day;
				
				const fomatDate = `${formattedMonth}.${formattedDay}.(${daysOfWeek[dayOfWeek]})`;
				
				return fomatDate;
			}
		}
		
	});

		
	
	
	/* 결제하기 */
	$('#data').click(context => {

		var tdElement = document.getElementById("total");
		var totalCost = tdElement.textContent;
		totalCost = `Cost.replace("원", "");
		var tc = parseFloat(totalCost);

		function execute() {
			var is = confirm("예약하는거 확실해?");
			
			if(!is) {
				return;
			}
			
			var target = $(context.target);
		    var car_idx = target.data('car_idx');
		    var rentalDate_str = target.data('rental_date');
		    var dueDate_str = target.data('due_date');
		    
		    
		    var data = {
	    		car_idx: car_idx,
	    		rentalDateStr: rentalDate_str,
	    		dueDateStr: dueDate_str
			};
			
		    console.log(data);
		    
		    
		    var url = "/test/rental/rental";
		    
		    fetch(url, {
				method: "POST",
				headers: {
					"Content-Type": "application/json",
				},
				body: JSON.stringify(data),
			})
			.then(response => {
				return response.json();
			})
			.then(json => {
				if(json.result == "success") {
					window.location= '<%= request.getContextPath() %>/';
				}
			})
		}
		var IMP = window.IMP; // 생략 가능
	    IMP.init("imp10626336");
        IMP.request_pay({
            pg: 'html5_inicis',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '고대일',
            amount: tc,
            buyer_email: 'ktym14452@naver.com',
            buyer_name: '${sessionScope.memberName}',
            buyer_tel: '010-2563-1675',
            buyer_addr: 'addr',
            buyer_postcode: '123-456'
        }, function (data) {
            if (data.success) {
                var msg = "결제 완료";
                msg += '고유ID : ' + data.imp_uid;
                msg += '// 상점 거래ID : ' + data.merchant_uid;
                msg += '// 결제 금액 : ' + data.paid_amount;
                msg += '// 카드 승인번호 : ' + data.apply_num;
                execute();
                
            } else {
                var msg = "결제 실패: " + data.error_msg;
                alert(msg);
                window.location.reload();
            }
        });
		
		
		
	});
			
	</script>
    <script src="../js/scripts_main.js"></script>	
</body>
</html>