<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/common.css"/>
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<style type="text/css">

.noticeIds {
	cursor: pointer;
	color: rgb(13, 110, 253);
}

</style>
<script type="text/javascript">
	$(() => {
		
		$("#noticeModal").on("hidden.bs.modal", function () {
	  		$("#idx").val("");
	  		$("#name").val("");
	  		$("#subject").val("");
	  		$("#contents").val("");
		});
		
		
		$("#allCheck").click(function () {
            if ($(this).is(":checked")) {
               $(".check").prop("checked", true);
            } else {
               $(".check").prop("checked", false);
            }
         });
         
         $(".check").click(function () {
            if (!$(this).is(":checked")) {
               $("#allCheck").prop("checked", false);
            }
         });
		
         $("#del").click(function () {
     		var delIds = "";
     		$(".check").each(function (index) {
     			if ($(this).is(":checked")) {
     				delIds += "," + $(this).val();
     			}
     		});
     		
     		if (delIds == "") {
     			alert("삭제 할 이벤트를 체크하세요.");
     		} else {
     			if (confirm("삭제하시겠습니까?")) {
     				var url = '<%= request.getContextPath() %>/admin/noticeDelete.do';
     				
     				fetch(url, {
     					method: "delete",
     					headers: {
     		            	'Accept': 'application/json', 
     		            	'Content-Type': 'application/json'
     		          	},
     		          	body: delIds.substr(1, delIds.length)
     				})
     		  		.then((response) => {
     				  	return response.json();
     			  	})
     			  	.then((json) => {
     			  		if (json.result == "success") {
     			  			window.location= '<%= request.getContextPath() %>/admin/notice.do';
     			  		}
     			  	})
     			  	.catch((error) => console.log("error:", alert(error)));
     			}
     		}
     		
     	});
         
	})
      // 공지사항 저장 함수
 	function saveNotice() {
         var idx = $("#idx").val();
         var name = $("#name").val();
         var subject = $("#subject").val();
         var contents = $("#contents").val();

         var data = {
             name: name,
             subject: subject,
             contents: contents
         };
         data["action"] = "insert";
         if(confirm("공지를 저장하시겠습니까 ?")){
         $.ajax({
             url: "<%= request.getContextPath()%>/admin/noticeInsert.do",
             type: "POST",
             data: data,
             success: function(data) {
             	// 성공적으로 완료될 때 실행될 콜백 함수
     		     if(name != null && subject != null && contents != null) {
                   alert("저장 성공");
                // 모달 창 닫기
                   $("#noticeModal").modal("hide");
                   window.location.reload();
                }	        	
             },
             error: function(xhr, status, error) {
                 // 저장 실패 시 처리
                 alert("공지 저장에 실패했습니다: " + error);
               }
             });
         }else{
		        alert("취소 되었습니다.");
		    }
	    //	confirm 확인하는것
         }      
	
	function showADD() {
//			alert(123);
		$("#saveBtn").show();
		$("#updateBtn").hide();
	}
</script>
	

<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<jsp:include page="/WEB-INF/views/layout/side.jsp" />
		</div>

		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<jsp:include page="/WEB-INF/views/layout/header.jsp" />
			</nav>
			<br>

            	
			<div class="table-responsive" style="padding: 20px;">
				<form action="<%= request.getContextPath() %>/admin/notice.do"
					method="get">
					<div class="input-group" style="margin-bottom: 30px;">
						<span class="input-group-text">이름</span> 
						<input type="text" aria-label="First name" class="form-control" name="name"	value="${param.name}"> 
						<span class="input-group-text">제목</span>
						<input type="text" aria-label="Last name" class="form-control" 	name="subject" value="${param.subject}">
						<button class="btn btn-primary" type="submit" id="btnSearch" style="width: 100px;">검색</button>
					</div>
				</form>

				<div class="float-start" role="group" aria-label="Basic example"
					style="padding-top: 10px;">
					<span>전체: ${requestScope.totalCount} 개</span>
				</div>
				<div class="btn-group float-end" role="group"
					aria-label="Basic example">
					<button id="add" class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#noticeModal" style="width: 100px;" onclick="showADD()">추가</button>
					<button id="add" class="btn btn-secondary" data-bs-toggle="modal"
						data-bs-target="#noticeModal" style="width: 100px;"  >수정</button>
					<button id="del" class="btn btn-danger" style="width: 100px;">삭제</button>
				</div>
				<br> <br>

				<div id="table-container">
				<table class="table table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th><input type="checkbox" id="allCheck" /></th>
							<th>글 번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>작성일</th>
							<th>수정시간</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
					<c:forEach var="item" items="${list}">
						<tr>
							<td><input type="checkbox" class="check" value="${item.idx}" /></td>
							<td align="center">${item.idx}</td>
							<td align="center">
								<c:set var="name" value="${fn:replace(item.name, '<', '&lt;')}" />
								<c:set var="name" value="${fn:replace(name, '>', '&gt;')}" />
								${name}
							</td>
							<td align="center">
								<c:set var="subject" value="${fn:replace(item.subject, '<', '&lt;')}" />
								<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}" />
								<span class="noticeIds" onclick="noticeUpdate(${item.idx})" data-bs-toggle="modal" data-bs-target="#noticeModal">${subject}</span>
							</td>				
							

							<!-- 날짜 포멧 이쁘게 진행  -->
								<td align="center">
								<fmt:formatDate value="${item.regdate}" pattern="yyyy.MM.dd(E) a h:mm:ss" />
								</td>
								<td align="center"><fmt:formatDate value="${item.updatedate}" pattern="yyyy:MM:dd(E) a h:mm:ss" />
								</td>
							<td align="center">${item.hit}</td>
						</tr>
					</c:forEach>
					</tbody>
					
				</table>
				</div>

				<nav aria-label="Page navigation">${ paging }</nav>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="noticeModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">공지 사항</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="idx" name="idx">
					<div class="input-group mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" id="name" placeholder="이름" name="name" maxlength="20">
			               <label for="floatingName">이름</label>
			             </div>
		          	</div>
					<div class="input-group mb-3">
			             <div class="form-floating">
			               <input type="text" class="form-control vaildation" id="subject" placeholder="제목" name="subject" maxlength="100">
			               <label for="floatingSubject">제목</label>
			             </div>
		          	</div>
		          	<div class="input-group mb-3">
			             <div class="form-floating">
			               <textarea class="form-control" name="contents" id="contents" placeholder="내용" style="height: 400px;"></textarea>
			               <label for="floatingSubject">내용</label>
			             </div>
		          	</div>
				</div>

				<div class="modal-footer">
					<button id="noticeInsert" type="submit" class="btn btn-primary" onclick="saveNotice()">저장</button>
					<button id="updateBtn" type="button" class="btn btn-primary" onclick="noticeUpdate()">수정</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>