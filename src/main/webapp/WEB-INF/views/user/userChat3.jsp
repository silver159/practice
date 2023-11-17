<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Web Socket Example</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
<style>
  /* 모달 상단에 배경색 적용 */
  .modal-header {
    background-color: #007bff; 
    color: #ffffff;
    border-bottom: 1px solid #dee2e6;
  }

  /* 모달 하단에 배경색 적용 */
  .modal-footer {
    background-color: #007bff; 
    color: #ffffff; 
    border-top: 1px solid #dee2e6;
  }
</style>
</head>
<body>

	<img id="openModalButton" src="${pageContext.request.contextPath}/images/chat-icon.png" alt="Click Image" class="img-fluid">

	<!-- 모달 시작 -->
	<div class="modal fade" id="questionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상담사와 채팅하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->
				<textarea id="messageTextArea" rows="10" cols="50" disabled="disabled"></textarea>
				<!-- 채팅 영역 -->
				<form class="modal-footer">
					<input id="textMessage" type="text" onkeydown="return enter()">
					<input type="button" value="Send" onclick="sendMessage()">
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		// 서버의 broadsocket의 서블릿으로 웹 소켓을 한다.
		var webSocket = new WebSocket(
				"ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/broadsocket");
		// 콘솔 텍스트 영역
		var messageTextArea = document.getElementById("messageTextArea");
		// 접속이 완료되면
		webSocket.onopen = function(message) {
			// 콘솔에 메시지를 남긴다.
			messageTextArea.value += "상담원 대기중...\n";
		};
		// 접속이 끝기는 경우는 브라우저를 닫는 경우이기 떄문에 이 이벤트는 의미가 없음.
		webSocket.onclose = function(message) {
		};
		// 에러가 발생하면
		webSocket.onerror = function(message) {
			// 콘솔에 메시지를 남긴다.
			messageTextArea.value += "error...\n";
		};
		// 서버로부터 메시지가 도착하면 콘솔 화면에 메시지를 남긴다.
		webSocket.onmessage = function(message) {
			messageTextArea.value += "(상담사) => " + message.data + "\n";
		};
		// 서버로 메시지를 발송하는 함수
		// Send 버튼을 누르거나 텍스트 박스에서 엔터를 치면 실행
		function sendMessage() {
			// 텍스트 박스의 객체를 가져옴
			let message = document.getElementById("textMessage");
			// 콘솔에 메세지를 남긴다.
			messageTextArea.value += message.value + "\n";
			// 소켓으로 보낸다.
			webSocket.send(message.value);
			// 텍스트 박스 추기화
			message.value = "";
		}
		// 텍스트 박스에서 엔터를 누르면
		function enter() {
			// keyCode 13은 엔터이다.
			if (event.keyCode === 13) {
				// 서버로 메시지 전송
				sendMessage();
				// form에 의해 자동 submit을 막는다.
				return false;
			}
			return true;
		}
	</script>
	<script>
		// 모달 띄우기 버튼 클릭
		document.getElementById('openModalButton').addEventListener(
				'click',
				function() {
					// 모달 띄우기
					var myModal = new bootstrap.Modal(document
							.getElementById('questionModal'), {
						backdrop : 'static', // 배경 클릭시 모달이 닫히지 않도록 설정
					});
					myModal.show();
				});
	</script>
</body>
</html>
