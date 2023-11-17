$(() => {
	
//	리스트 클릭시 car_idx 가져옴
	$('.list-item').click((context) => {
		var tr_target = $(context.currentTarget);

		var checkBox = tr_target.find('.check');
		checkBox.prop('checked',!checkBox.prop('checked'));
		
	});

	
});




