
var url = "/test/admin/income";

fetch(url, {
	method: "POST",
	async: false,
	headers: {
		"Content-Type": "text/plain",
	},
	body: "month"
})
.then(response => {
		return response.json();
})
.then(json => {
	if(json.result == "success") {
		const monthlyIncome = json.income;
		console.log(monthlyIncome);
		$('#monthlyIncome').text(formatKRW(monthlyIncome));
	}
})


fetch(url, {
	method: "POST",
	async: false,
	headers: {
		"Content-Type": "text/plain",
	},
	body: "year"
})
.then(response => {
		return response.json();
})
.then(json => {
	if(json.result == "success") {
		const yearlyIncome = json.income;
		console.log(yearlyIncome);
		$('#yearlyIncome').text(formatKRW(yearlyIncome));
	}
})



//한국 돈 numberFormat
function formatKRW(number) {
	return new Intl.NumberFormat('ko-KR').format(number) + '원';
}




