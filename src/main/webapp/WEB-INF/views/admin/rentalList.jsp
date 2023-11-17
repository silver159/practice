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
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/adminRentalList.js"></script> 
		
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

					<!-- 상단 4 -->
                    <div class="row mb-4">
						<!-- YearlyIncome -->
                        <div class="col-xl-3 col-md-6">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs text-success mb-1">연 매출</div>
                                            <h5 id="yearlyIncome" class="mb-0"></h5>
                                        </div>	
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- MonthlyIncome -->
                        <div class="col-xl-3 col-md-6">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs text-primary mb-1">매출 (월별)</div>
                                            <h5 id="monthlyIncome" class="mb-0"></h5>
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
					
					
					<!-- 차량 리스트 -->


                    <div class="row my-5" style="padding-bottom: 200px;">
                    
						<div class="col-lg-12 text-center fs-3 mb-3">
							출고 된 차량 리스트
						</div>
                    	<div class="col-lg-12">
	                    	<table class="table table-striped table-hover">
				            	<thead class="table-dark">
				            		<tr class="text-center">
				            			<th><input type="checkbox" id="allCheck"/></th>
				            			<th>차량번호</th>
				            			<th>브랜드</th>
				            			<th>모델</th>
				            			<th>시리즈</th>
				            			<th>대여일자</th>
				            			<th>반납일자</th>

				            			<th>1일대여 요금</th>
				            			<th>총 대여비용</th>
				            		</tr>
				            	</thead>
				            	<tbody class="table-group-divider">
				            		<c:forEach var="list" items="${rentalList}">
				            		<tr class="text-center list-item">
				            			<td><input type="checkbox" class="check" value="${list.car_idx}"/></td>
				            			<td>${list.carNumber}</td>
				            			<td>${list.maker}</td>
										<td>${list.model}</td>
				            			<td>${list.series}</td>

				            			<td><fmt:formatDate value="${list.rentalDate}" pattern="yy년 MM월 dd일"/></td>
				            			<td><fmt:formatDate value="${list.dueDate}" pattern="yy년 MM월 dd일"/></td>

				            			<td><fmt:formatNumber value="${list.dayCost}" pattern=",000원"/></td>
				            			<td><fmt:formatNumber value="${list.cost}"    pattern=",000원"/></td>
				            		</tr>
				            		</c:forEach>
				            	</tbody>
				            </table>
                    	</div>
                    	<div class="col-lg-12 text-right">
                    		<input id="show_modal" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#modal" value="모달창"/>
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
								<input name="carInfo_idx" type="hidden"]>
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
			            		
			            		
			            		
			            		
									<!-- 프로필 사진 -->
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
			            		
			            		
			            		
			            		
			            		
			            		
			                    	<table id="carTable" class="table table-striped table-hover" style="display: none; table-layout: fixed;">
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


<!-- 디졋다  -->
<script type="text/javascript">



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

</body>
</html>