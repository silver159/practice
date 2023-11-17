// 파일 업로드 함수
function photoView(event) {
	$('#output').attr('src', URL.createObjectURL(event.target.files[0]));
}

function updateValue(value) {
    document.getElementById("limitValue").textContent = value;
}

function photoView(event) {
   $('#output').attr('src', URL.createObjectURL(event.target.files[0]));
}

function updateValue(value) {
    document.getElementById("limitValue").textContent = value;
}




$(() => {

//	리스트 클릭시 car_idx 가져옴
	$('.list-item').click((context) => {
		var tr_target = $(context.currentTarget);

		var checkBox = tr_target.find('.check');
		checkBox.prop('checked',!checkBox.prop('checked'));
		
	});

	
	
//	추가하기 버튼 클릭 모달창 생성 select박스로 option 전달
	$('#show_modal').click(() => {
		
		create_opstions();

		$('#infoTable').hide();
	});
	
	
//	선택한 차량 정보를 Table에 띄우기
	$('#info_select_btn').click(() => {
		
		const data = select_option_idx();
		
		const url = "/test/admin/selectedCarinfo";
		// DB조회
		fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "text/plain",
			},
			body: data.toString()
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				var carInfo = JSON.parse(json.carInfo);

				
				var carInfo_print = "";
				carInfo_print += 
					'<input id="carInfo_idx" value="' +carInfo.carInfo_idx+ '" hidden/>' +
					'<td>' +carInfo.maker+ '</td>' +
					'<td>' +carInfo.model+ '</td>' +
					'<td>' +carInfo.series+ '</td>' +
					'<td>' +carInfo.type+ '</td>' +
					'<td>' +carInfo.fuel+ '</td>' +
					'<td>' +carInfo.fuelRatio+ '</td>' +
					'<td>' +carInfo.transmission+ '</td>' +
					'<td>' +carInfo.seatCount+ '</td>';

				$('#selectedCar').html(carInfo_print);
				$('#infoTable').show();
				$('#info_add_btn').show();
				$('#back_put_group').hide();
				$('#carInsert_btn').show();
				$('#info_delete_btn').show();
			}
		})
	})
	
	
//	새로운 차량 추가를 위해 창 띠우기
	$('#info_add_btn').click((context) => {	
		
		const is = confirm('새로운 차량을 추가하시겠습니까?');
		if(!is){
			return;
		}
		
		var carInfo_print = "";
		
		carInfo_print += 
			'<td><input class="form-control" name="maker" placeholder="기아,제네시스..."></td>' +
			'<td><input class="form-control" name="model" placeholder="K3,G70..."></td>' +
			'<td><input class="form-control" name="series" placeholder="올뉴,안적으셔도 됩니다."></td>' +
			'<td>' +
				'<select class="form-control text-center" name="type">' +
					'<option>소형</option>' +
					'<option>중형</option>' +
					'<option>대형</option>' +
				'</select>' +
			'</td>' +
			'<td>' +
				'<select class="form-control text-center" name="fuel">' +
					'<option>휘발유</option>' +
					'<option>경유</option>' +
					'<option>전기</option>' +
				'</select>' +
			'</td>' +
			'<td><input class="form-control" name="fuelRatio" placeholder="8.8 ~ 11.2km"></td>' +
			'<td>' +
				'<select class="form-control text-center" name="transmission">' +
					'<option>자동</option>' +
					'<option>수동</option>' +
				'</select>' +
			'</td>' +
			'<td><input class="form-control" type="text" name="seatCount" autocomplete="off"></td>';
			
		
		
		$('#selectedCar').html(carInfo_print);
		
		$('#infoTable').show();
		$('#image_box').show();
		$('#info_add_btn').toggle();
		$('#back_put_group').toggle();
		$('#carInsert_btn').hide();
		$('#info_select_btn').hide();
		$('#info_delete_btn').hide();
	})
	
	$('#info_back_btn').click(() => {
		$('#infoTable').hide();
		$('#image_box').hide();
		$('#info_select_btn').show();
		$('#info_delete_btn').show();
		$('#info_add_btn').toggle();
		$('#back_put_group').toggle();
	})
	
//	새로운 차량정보 등록하기
	$('#info_put_btn').click(() => {
		
		
		const form_list = $('#selectedCar').find('input.form-control');
		
		var form_is = false;
		
		console.log(form_list);
		$.each(form_list, function (index, list) {
			if(index == 2){
				return true;
			}	
			if($(list).val().length == 0){
				form_is = true;
				return;
			}
		})
		
		if(form_is){
			alert('정보를 입력해주세요');
			return;
		}
		
		
		
		
		const is = confirm('차량정보를 등록하시겠습니까?'); 
		if(!is){
			return;
		}
		
		$('#infoInsert_form').submit();
		
		setTimeout(() => {
			alert('등록되었습니다.');
			$('#infoTable').hide();
			$('#image_box').hide();
			$('#info_select_btn').show();
			$('#info_delete_btn').show();
			
			$('#info_add_btn').toggle();
			$('#back_put_group').toggle();
			create_opstions();
		}, 500);
			
	});
	
//	새로운 차 등록하기

	$('#carInsert_btn').click(() => {
		
		if(!$('input[name=carNumber]').val()){
			alert('차량번호를 입력하세요');
			return;
		};
		if(!$('input[name=year]').val()){
			alert('차량연식을 입력하세요');
			return;
		};
		if(!$('input[name=dayCost]').val()){
			alert('1일 대여 요금을 입력하세요');
			return;
		};
		if(isNaN($('input[name=dayCost]').val())){
			alert('숫자만 입력해주세요');
			return;
		}
		
		const is = confirm('차량을 등록하시겠습니까?');
		if(!is){
			return;
		}
		
		const data = select_option_idx();
		
		const url = "/test/admin/selectedCarinfo";
		fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "text/plain",
			},
			body: data.toString()
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				var carInfo = JSON.parse(json.carInfo);
				const carInfo_idx = carInfo.carInfo_idx;
//				졸라신기함
//				console.log(carNumber, year, dayCost, carInfo_idx);
				console.log(carInfo_idx);
				$('input[name=carInfo_idx').val(carInfo_idx);
				
				$('#carInsert_form').submit();
				
				setTimeout(() => {
					alert('차량 등록완료');
					location.reload();
				}, 500);

				
			}
					
		})
	})
	

//	차량 삭제하기
	$('#car_delete_btn').click(() => {
		
		const box_checked = $('.check:checked');
		
		if(box_checked.length == 0){
			alert('삭제할 차량을 선택하세요.');
			return;
		}
		
		const is = confirm('삭제하시겠습니까?');
		if(!is){
			return;
		}
		
		const data = {
			car_idx: []
		}
		
		$.each(box_checked, function (index, elm) {
			data.car_idx.push($(elm).val());
		})
		
		const url = "/test/admin/carDelete";
		// 데이터 조회
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
				
				setTimeout(() => {
					alert('삭제완료s');
					location.reload();
				}, 500);
			}
		})
		
		
	})
	
	
	
//	차량정보 삭제
	$('#info_delete_btn').click(() => {
		const is = confirm('차량정보를 삭제하시겠습니까?');
		if(!is){
			return;
		}
		
		
		const carInfo_idx = $('#carInfo_idx').val();
		console.log(carInfo_idx);
		const data = carInfo_idx;
		console.log(typeof data);
		const url = "/test/admin/carInfoDelete";
		fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "text/plain",
			},	
			body: data
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				setTimeout(() => {
					alert('삭제완료s');
					create_opstions();
				}, 500);
			}
		})
		
		
	})
//	carList 전체보기
	$('#total_btn').click(() => {
		
		const summarys = $('.summary');
		
		$.each(summarys, function (index, summary) {
			$(summary).show();
		})
		
		$('#carTable').removeAttr('style');
		$('#carTable').parent().attr('class', 'col-lg-12');
		
	})
//	carList 요약보기
$('#summary_btn').click(() => {
		
	const summarys = $('.summary');
	
	$.each(summarys, function (index, summary) {
		$(summary).hide();
	})

	$('#carTable').attr('style', 'width: 600px;');
	$('#carTable').parent().attr('class', 'col-lg-12 d-flex justify-content-center');
	
})
	
	
	
	
	
	const create_opstions = () => {
		const url = "/test/admin/carinfo";
		// 데이터 조회
		fetch(url, {
			method: "POST"
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				var infoList = JSON.parse(json.infoList);
				console.log(infoList);
				return infoList.list;
			}
		})
		.then(list => {
			const target = $('#info_select');

			var option = '';
			
			$.each(list, function (index, info) {
				option += '<option>' +info.model+ ' ' +info.series+ '</option>';
			})
			
			target.html(option);
		})
	}
	
	const select_option_idx = () => {
		var idx;
		const options = $('#info_select').children();
		const selected = $('#info_select').val();
		$.each(options, function (index, option) {
			
			if($(option).val() == selected){
				idx = index + 1;
				return;
			}
			
		})
		return idx;
	}
	
	
});








