<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet">	
    <!-- css -->
    <link rel="stylesheet"  href="./css/styles_main.css" />
    <link rel="stylesheet" href="./css/style_index.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet"  href="<%= request.getContextPath()%>/css/style2.css" />

	
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<!-- slider -->	
	
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/index.js" defer="defer"></script> 
	<style type="text/css">
		
		#rental-box {
			/* 		
			right: 90px;
			top: 550px;
			 */
	    	width: 420px;
	    	
	    }
	    
	    .autoplay img:hover {
	    	
	    	cursor: pointer;
	    
	    }
	    
		#rental-box .row {
			padding: 10px 0;
			border: 1px solid black;
		
		}
		#rental-box .row:first-child {
			border-top-left-radius: 10px; 
			border-top-right-radius: 10px;
			cursor: pointer;
		}
		#rental-box .row:last-child {
			background-color: #ED6C25;
			color: white;
			border-bottom-left-radius: 10px; 
			border-bottom-right-radius: 10px;
			cursor: pointer;
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
 <a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
 <!-- Navigation-->
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
            <li class="sidebar-nav-item"><a href="#services">몰루</a></li>
            <li class="sidebar-nav-item"><a href="#promotion">어디루</a></li>
            <li class="sidebar-nav-item"><a href="#location">위치</a></li>
        </ul>
    </nav>
    

    <!-- Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__logo">
            <a href="/test"><img src="<%= request.getContextPath()%>/images/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <ul class="offcanvas__widget__add">
            <li><i class="fa-solid fa-clock"></i> Week day: 09:00 am to 18:30 pm</li>
            <li><i class="fa-solid fa-envelope"></i> ktym14452@gmail.com</li>
        </ul>
        <div class="offcanvas__phone__num">
            <i class="fa fa-phone"></i>
            <span>(+82) 010 2563 1675</span>
        </div>
        <div class="offcanvas__social">
          <a href="#"><i class="fa-brands fa-facebook"></i></a>
          <a href="#"><i class="fa-brands fa-twitter"></i></a>
          <a href="#"><i class="fa-brands fa-google"></i></a>
          <a href="#"><i class="fa-brands fa-instagram"></i></a>
        </div>
    </div>
    <!-- Menu End -->

    <!-- Header -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <ul class="header__top__widget">
                            <li><i class="fa-solid fa-clock"></i> Week day: 09:00 am to 18:30 pm</li>
                            <li><i class="fa-solid fa-envelope"></i> ktym14452@gmail.com</li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div class="header__top__right">
                            <div class="header__top__phone">
                                <i class="fa fa-phone"></i>
                                <span>(+82) 010 2563 1675</span>
                            </div>
                            <div class="header__top__social">
                                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                <a href="#"><i class="fa-brands fa-google"></i></a>
                                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="/test"><img src="<%= request.getContextPath()%>/images/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="header__nav">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="/test">Home</a></li>
                                <li><a href="./car.html">Cars</a></li>
                                <li><a href="./blog.html">Blog</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="./about.html">About Us</a></li>
                                        <li><a href="./car-details.html">Car Details</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="./about.html">About</a></li>
                                <li><a href="./contact.html">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header-->
    <!-- body -->
    
    <iframe src="/test/user/event.do" frameborder="0" width="100%" height="380px"></iframe>
    <div class="container">
    	<div class="row">
    		<div class="col-md-10">
    			
			    <c:forEach items="${keywordList.keySet()}" var="list" varStatus="loopStatus">
			    
					<div class="row mb-2">
						<h4 class="my-4">${list} 찾으시나요?</h4>
						<div id="keyword_wrap_${loopStatus.index}" class="autoplay d-flex align-items-center">
			    		<input class="keyword_name" type="hidden" value="${list}">
				    	<c:forEach items="${keywordList.get(list)}" var="car">
				    	
							<img src="/upload/${car.image}" style="width:390px; height: 220px; padding: 0 20px;">
							
				    	</c:forEach>
				    	
			    		</div>
			    	</div>
			    	
			    </c:forEach>
    			
			</div>
			<div class="col-md-2">

				<div id="rental-box" class="p-3 fs-5">
				
					<div class="row">	
						<span id="chk_result"><i class="bi bi-bell"></i> 전체 차량</span>
					</div>
					<div class="row">
						<span class="chk_all">
							<input type="checkbox" class="btn-check" id="chk_all" checked="checked">
							<label class="btn btn-outline-primary" for="chk_all">전체</label>
						</span>
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
					</div>
					<div class="row">
						<div id="search" class="m-3 text-center">조회하기</div>
						<form id="dynamic_form" method="get">
						</form>
					</div>
					
				</div>

			</div>
		</div>
    </div>
    

    
    
    
    
	<form id="article" action="/test/car/article" method="post" hidden>
		<input name="car_idx"/>
		<input name="rentalDateStr"/>
		<input name="dueDateStr"/>
	</form>
	
	<!-- body end -->
    <!-- Footer-->
    <footer class="footer text-center">
        <div class="container px-4 px-lg-5">
            <ul class="list-inline mb-5">
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white mr-3" href="#!"><i class="icon-social-facebook"></i></a>
                </li>
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white mr-3" href="#!"><i class="icon-social-twitter"></i></a>
                </li>
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white" href="#!"><i class="icon-social-github"></i></a>
                </li>
            </ul>
            <p class="text-muted small mb-0">Copyright &copy; poject</p>
        </div>
    </footer>
    
    <!-- silder -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#main"><i class="fas fa-angle-up"></i></a>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./js/scripts_main.js"></script>
</body>
</html>