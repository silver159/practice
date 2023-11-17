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
	
	.chat-container {
	    height: 350px;
	    overflow-y: scroll;
	}
	
	.message {
	    max-width: 80%;
	    margin-bottom: 10px;
	    padding: 8px;
	    border-radius: 8px;
	    overflow-wrap: break-word;
    	clear: both;
	}
	
	.right {
	    float: right;
	    background-color: #5cb85c; 
	    color: #fff;
	}
	
	.left {
	    float: left;
	    background-color: #ffffcc;
	    clear: both;
	}
	
	.sender {
	    font-weight: bold;
	}
	
	.content {
	    display: inline;
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
				<div id="messageTextArea" class="chat-container"></div>
				<!-- 채팅 영역 -->
				<form class="modal-footer">
					<input id="textMessage" type="text">
					<input type="button" value="Send" onclick="sendMessage()">
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		
		// 웹 소켓 객체를 전역으로 선언
		var webSocket;
	
		// 모달 띄우기 버튼 클릭
		document.getElementById('openModalButton').addEventListener(
			'click',
			function() {
				// 모달 띄우기
				var myModal = new bootstrap.Modal(document.getElementById('questionModal'), {
					backdrop : 'static', // 배경 클릭시 모달이 닫히지 않도록 설정
				});
				// 모달이 열릴 때 웹 소켓 연결
				myModal.show();
			    myModal._element.addEventListener('shown.bs.modal', function () {
			    	if (!webSocket || webSocket.readyState !== WebSocket.OPEN) {
			            // 소켓이 없거나 연결이 닫혔으면 새로 연결
			            setupWebSocket();
			        }
			    });
			});
		
		// 웹 소켓 설정 함수
		function setupWebSocket() {
		    // 서버의 broadsocket의 서블릿으로 웹 소켓을 한다.
		    webSocket = new WebSocket(
		        "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/broadsocket");

		    // 텍스트 영역
		    var messageTextArea = document.getElementById("messageTextArea");
			
		 	// 텍스트 입력 가져오기
		    var textMessageInput = document.getElementById("textMessage");
		    
		    // 접속이 완료되면
		    webSocket.onopen = function (message) {
		        console.log("WebSocket 연결이 열렸습니다.");
		    };

		    // 에러가 발생하면
		    webSocket.onerror = function (message) {
		        // 콘솔에 메시지를 남긴다.
		        console.log("error...");
		    };

		    // 서버로부터 메시지가 도착하면 화면에 메시지를 남긴다.
		    webSocket.onmessage = function (message) {
		        displayMessage(message.data, "left");
		        console.log(message);
		    };

			/*
		    // Send 버튼을 누르면 실행
		    document.getElementById('sendButton').addEventListener('click', function () {
		        sendMessage();
		    });
			*/
			// 엔터키를 눌렀을 때 폼 제출 막기
		    textMessageInput.addEventListener('keydown', function (event) {
		    	 // keyCode 13은 엔터이다.
		        if (event.keyCode === 13) {
		        	// 폼 제출 막기
		            event.preventDefault();
		         	// 모달이 닫히지 않도록 이벤트 전파 막기	
		            event.stopPropagation();
		         	// 서버로 메시지 전송
		            sendMessage();

		            return false;
		        }
		    });
			
		    // 모달이 닫힐 때 웹 소켓 연결 종료
		    $('#questionModal').on('hidden.bs.modal', function () {
		        if (webSocket) {
		            console.log('Closing WebSocket. ReadyState:', webSocket.readyState);
		            webSocket.close();
		        }
		    });
		}

		// 서버로 메시지를 발송하는 함수
		function sendMessage() {
		    // 텍스트 박스의 객체를 가져옴
		    let message = document.getElementById("textMessage");
		    // 화면에 메세지를 남긴다.
		    displayMessage(message.value, "right");
		    // 소켓으로 보낸다.
		    webSocket.send(message.value);
		    // 텍스트 박스 초기화
		    message.value = "";
		}

		// 데이터를 채팅창에 넣어준다.
		function displayMessage(content, alignment) {
		    let messageContainer = document.createElement("div");
		    messageContainer.classList.add("message");
		    messageContainer.classList.add(alignment);

		    // "(상담사)"와 채팅 내용을 각각 다른 줄에 표시
		    if (alignment === 'left') {
		        let sender = document.createElement("div");
		        sender.classList.add("sender");
		        sender.textContent = '(상담사)';
		        messageContainer.appendChild(sender);
		    }

		    let messageContent = document.createElement("div");
		    messageContent.classList.add("content");
		    messageContent.textContent = content;
		    messageContainer.appendChild(messageContent);

		    // 각 메시지를 새로운 줄에 추가합니다.
		    document.getElementById("messageTextArea").appendChild(messageContainer);

		    // 항상 최신 메시지를 보여주기 위해 스크롤을 맨 아래로 이동합니다.
		    document.getElementById("messageTextArea").scrollTop = document.getElementById("messageTextArea").scrollHeight;
		}
	</script>
</body>
</html>
