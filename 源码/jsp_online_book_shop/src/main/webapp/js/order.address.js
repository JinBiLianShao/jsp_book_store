var R = false, A = false, P = false//用于验证表单


//表单验证
$(function(){
	//验证收件人姓名
	$("#receiveName").blur(function(){
		R = false;
		var val = $(this).val();
		var info = $("#name\\.info");
		info.text("");
		if(val == ""){
			info.text("收件人不能为空");
		}else{
			info.html("<img src='img/ajax_ok.png' />");
			R = true;
		}
	});
	
	//验证详细地址
	$("#fullAddress").blur(function(){
		A = false;
		var val = $(this).val();
		var info =  $("#address\\.info");
		info.text("");
		if(val == ""){
			info.text("收货地址不能为空");
		}else{
			info.html("<img src='img/ajax_ok.png' />");
			A = true;
		}
	});
	
	//验证手机号
	$("#phone").blur(function() {
		P = false;
		var val = $(this).val();
		var info = $("#phone\\.info");
		info.html("");
		if (val == "") {
			info.text("手机号不能为空");
		} else if (!val.match(/^1[3456789]\d{9}$/)) {
			info.text("请输入正确的手机号");
		} else {
			P = true;
			info.html("<img src='img/ajax_ok.png' />");
		}
	});
	
	
	//当地址和收件人正确填写后，才能点击提交
	$("#btnClientRegister").click(function(){
		if(A && R && P){
			return true;
		}else{
			
			var info = $("#name\\.info");
			alert("请填写正确的信息！")
			return false;
		}
	});
		

});