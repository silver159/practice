<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
	<!-- Custom styles for this template -->
    <link href="<%= request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%= request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css"/>
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/adminCarList.js"></script> 
		
</head>
<body id="page-top">
    <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
       	<div class="border-end bg-white" id="sidebar-wrapper">
            <jsp:include page="/WEB-INF/views/layout/side.jsp"/>      
        </div>
    <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
            </nav>
    
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> 보고서 다운로드</a>
                    </div>

                    <!-- 상단 4 -->
                    <div class="row mb-4">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary mb-1">매출 (월별)</div>
                                            <h5 id="monthlyIncome" class="mb-0"></h5>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                수입 (연간)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">작업
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                보류 중인 요청</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
					<!-- 상단 4 끝 -->
					
                    <!-- 중단 2 -->
                    <div class="row mb-4">

                        <!-- Project Card -->
                        <div class="col-lg-7">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                                </div>
                                <div class="card-body">
                                    <!-- Project 1 -->
                                    <h4 class="small font-weight-bold">
                                    	Payout Details
                                    	<span class="float-right">80%</span>
                                    </h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar"
                                        	style="width: 80%"
                                            aria-valuemin="0" aria-valuemax="100"
                                            aria-valuenow="80">
										</div>
                                    </div>
                                    
                                    <!-- Project 2 -->
                                    <h4 class="small font-weight-bold">
                                    	Account Setup
                                    	<span class="float-right">Complete!</span>
                                    </h4>
                                    <div class="progress">
                                    	<div class="progress-bar bg-success" role="progressbar"
                                        	style="width: 100%"
                                            aria-valuemin="0" aria-valuemax="100"
                                            aria-valuenow="100">
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">차량 상태</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="chart_car"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2">
											<i class="fas fa-circle" style="color: #4e73df"></i> 입고
										</span>
										<span class="mr-2">
											<i class="fas fa-circle" style="color: #FFB266"></i> 출고
										</span>
										<span class="mr-2">
											<i class="fas fa-circle" style="color: #1cc88a"></i> 정비
										</span>
									</div>
								 </div>
							 </div>
						</div>
					</div>
					<!-- 중단 2 끝 -->
					
					<!-- 하단 차량 리스트 -->



                    <div class="row mb-4" style="padding-bottom: 200px;">
                    
						<div class="d-flex mb-3">
							<div id="car_delete_btn" class="me-auto btn btn-danger">삭제하기</div>
							<div class="btn-group">
								<div id="total_btn"   class="btn btn-warning">전체보기</div>
								<div id="summary_btn" class="btn btn-secondary">요약보기</div>

							</div>
						</div>
                    	<div id="summary_table_center" class="col-lg-12 d-flex justify-content-center">
	                    	<table id="carTable" class="table table-striped table-hover">
				            	<thead class="table-dark">
				            		<tr class="text-center">
				            			<th><input type="checkbox" id="allCheck"/></th>
				            			<th>차량번호</th>
				            			<th>년식</th>
				            			<th class="summary">브랜드</th>
				            			<th>모델</th>
				            			<th>시리즈</th>
				            			<th class="summary">차종</th>
				            			<th class="summary">연료</th>
				            			<th class="summary">연비</th>
				            			<th class="summary">트랜지션</th>
				            			<th class="summary">승차인원</th>
				            			<th>총 출고일</th>
				            			<th>상태</th>
				            		</tr>
				            	</thead>
				            	<tbody class="table-group-divider">
				            		<c:forEach var="list" items="${carList.list}">
				            		<tr class="text-center list-item">
				            			<td><input type="checkbox" class="check" value="${list.car_idx}"/></td>
				            			<td>${list.carNumber}</td>
				            			<td>${list.year}</td>
				            			<td class="summary">${list.maker}</td>
										<td>${list.model}</td>
				            			<td>${list.series}</td>
				            			<td class="summary">${list.type}</td>
				            			<td class="summary">${list.fuel}</td>
				            			<td class="summary">${list.fuelRatio}</td>
				            			<td class="summary">${list.transmission}</td>
				            			<td class="summary">${list.seatCount}인승</td>
				            			<td>${list.rentalCount}일</td>
				            			<td class="status">${list.status}</td>
				            		</tr>
				            		</c:forEach>
				            	</tbody>
				            </table>
                    	</div>
                    	<div class="col-lg-12 text-right">
                    		<input id="show_modal" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#modal" value="추가하기"/>
                    	</div>
                    </div>	
	            </div>
	        </div>
	    </div>
	</div>
</div>
	<!-- bootstrap 모달 -->

	<!-- Button trigger modal -->
	
	
	<!-- Modal -->
	<div class="modal fade" id="modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
			  
				<div class="modal-body">
					<div class="container-fluid">
						<form id="carInsert_form" action="<%= request.getContextPath()%>/admin/carInsert" method="post" target="form_ifr">
							<div class="row my-2">
								<div class="col-lg-4 col-md-12">
									차량 번호
									<input name="carNumber" type="text" class="form-control">
								</div>
								<div class="col-lg-4 col-md-12">
									연식
									<input name="year" type="text" class="form-control">
								</div>
								<div class="col-lg-4 col-md-12">
									1일 대여 요금
									<input name="dayCost" type="text" class="form-control">
								</div>
								<input name="carInfo_idx" type="hidden">
							</div>
						</form>
						<div class="row my-2"> 
							<div class="col-lg-4 col-md-4 col-sm-5">
								기존 차량 정보
								<select id="info_select" class="form-control">
								</select>
							</div>
							<div class="col-lg-2 col-md-2 col-2">
								<br/>
								<input id="info_select_btn" type="button" class="btn btn-primary" value="선택">
								<input id="info_delete_btn" type="button" class="btn btn-danger" value="삭제" style="display: none;">
							</div>
							<div class="col-lg-6 col-md-6 col-3  text-right">
								<br/>
								<input id="info_add_btn" type="button" class="btn btn-warning" value="새로운 차량추가">
								<div id="back_put_group" class="btn-group" style="display: none;">
									<input id="info_put_btn" type="button" class="btn btn-danger" value="새로운 차량등록" >
									<input id="info_back_btn" type="button" class="btn btn-warning" value="돌아가기">
								</div>
							</div>
						</div>
						<div class="row my-2">
							
							<div class="col-12">
								<form id="infoInsert_form" action="<%= request.getContextPath()%>/admin/infoInsert" method="post" enctype="multipart/form-data" target="form_ifr">
			            		
			            		
			            		
			            		
									<!-- 차량 이미지 -->
									<div id="image_box" style="display: none;">
										<div class="row my-3">
									    	<div class="col-md-2"></div>
									    		<div class="col-md-8">
									         		<input class="form-control" type="file" accept="image/*" name="fileName" onchange="photoView(event)"/>
									      		</div>
									      	<div class="col-md-2"></div>
									   	</div>
									   	<div class="row my-3">
											<div class="col-lg-12">
												<img id="output" class="img-fluid w-100"/><br/>
											</div>
									   	</div>
									</div>
			            		
			            		
			            		
			            		
			            		
			            		
			                    	<table id="infoTable" class="table table-striped table-hover" style="display: none; table-layout: fixed;">
						            	<thead class="table-dark">
						            		<tr class="text-center">
						            			<th>브랜드</th>
						            			<th>모델</th>
						            			<th>시리즈</th>
						            			<th>차종</th>
						            			<th>연료</th>
						            			<th>연비</th>
						            			<th>트랜지션</th>
						            			<th>승차인원</th>
						            		</tr>
						            	</thead>
						            	<tbody class="table-group-divider">
						            		<tr id="selectedCar" class="text-center">
						            			<td></td>
												<td></td>
						            			<td></td>
						            			<td></td>
						            			<td></td>
						            			<td></td>
						            			<td></td>
						            			<td></td>
						            		</tr>
						            	</tbody>
						            </table>
			            		</form> 
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button id="carInsert_btn" class="btn btn-primary" type="button" style="display: none;">차량 등록하기</button>
				</div>
			</div>
		</div>
	</div>	
	<iframe name="form_ifr" hidden></iframe>
	<!-- bootstrap modal -->
	
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>




<script type="text/javascript">
const statusGroup = $('.status');

console.log(status);

$.each(statusGroup, function (index, status) {
	if($(status).text() == '출고'){
		$(status).css({"color" : "red", "font-weight" : "bold"});
	}
})


</script>


    <!-- Bootstrap core JavaScript-->
    <script src="<%= request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%= request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%= request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%= request.getContextPath()%>/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="<%= request.getContextPath()%>/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%= request.getContextPath()%>/js/demo/chart-area-demo.js"></script>
    <script src="<%= request.getContextPath()%>/js/demo/chart-pie.js"></script>

</body>
</html>