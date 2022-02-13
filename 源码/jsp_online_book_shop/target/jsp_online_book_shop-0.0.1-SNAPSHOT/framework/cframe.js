$(function(){
	
	$(window).load(function(){
		cframeInit();
		//后台首页的全屏功能的bug，如果不得不取出Iframe的大小变化后的监听事件。
		$(window).resize(function(){
			cframeInit();
		});
	});
})


//初始化页面
function cframeInit(){
	var win_h = $(window).height();
	var conheight;
	try{
		conheight = $('#mainIframe',parent.document).parents(".frameMain").find(".con").height();
	}catch(e){
		conheight = win_h;
	}
	
	var fullScreenTAG = sessionStorage.getItem("fullScreenTAG");
	if(fullScreenTAG == 1){
		conheight = $(parent.document).height();
	}
	
	//计算Iframe的高度与父元素相同
	$('#mainIframe',parent.document).css("height",750);
	//计算Iframe内cBody的高度，使其固定
	$(".cBody").height(800);
	//为cBody设置滚动条的样式
	$(".cBody").mCustomScrollbar();
}

//商品图片放大
function imgBig(_this){
    _this.className = "imgBig";
    _this.width = "200";
    _this.height = "200";
}

//商品图片放小
function imgSmall(_this){
    _this.className = "imgSmall";
    _this.width = "20";
    _this.height = "20";
}

//图片加载失败后默认图片
function errorImg(_this){
    _this.src = '../../images/imgError.png';
    _this.onerror=null;
}

//身份证正面图片加载失败后默认图片
function errorCardZMImg(_this){
    _this.src = '../../images/cardZMImgError.png';
    _this.onerror=null;
}

//身份证反面图片加载失败后默认图片
function errorCardFMImg(_this){
    _this.src = '../../images/cardFMImgError.png';
    _this.onerror=null;
}

//营业执照图片加载失败后默认图片
function errorYyzzImg(_this){
    _this.src = '../../images/yyzzImgError.png';
    _this.onerror=null;
}


//2018年07月13日 新功能tips提示功能详细用途的提示栏
function getTips(_this, str){
	layer.tips(str , $(_this), {
	  	tips: [1, '#3595CC'],
	  	time: 0
	});
}