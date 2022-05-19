var oneNum;

$(window).load(function(){
	console.log('ajax::start');

	$.ajax({
		dataType:'json',// xml, json, script, html
	    url:'/resources/service/env_eng/json/menu.json', // 요청 할 주소
	    type:'GET', // GET, POST,

	    // 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
	    beforeSend:function(data) {

	    },
	    // 요청 완료 시
	    success : function(data){
        	console.log('성공');
        	resultMenu(data);
      	},
	    // 요청 실패.
	    error:function(data) {
	    	console.log('에러');
	    },
	    // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
	    complete:function(data) {
	    	// console.log(data);
	    }
	});
});

function resultMenu(data){
	var html = "";  // 대메뉴 html
	var sitemap = "";
	var location = "";
	html += "<ul>";
	// sitemap += "<ul>";
	$.each(data, function (key,value){
		//console.log(value)
		location += "<div class='depth depth1'>";
		if(value[oneNum]){
			location += "<a href='javascript:;' target='" + value[oneNum].target +"' title='" + value[oneNum].title + "' class='dep_tit'>" + value[oneNum].title +"</a>";
		}
		location += "<ul class='drop_box'>";
		for( var i = 0; i < value.length; i++){
			html += "<li>";
			html += "<a href='" + value[i].url +"' target='" + value[i].target +"' class='gnb_tit'>" + value[i].title +"</a>";
			sitemap += "<li>";
			sitemap += "<div class='tit_line'></div>";
			sitemap += "<p>";
			sitemap += "<img src='/resources/service/env/images/" + value[i].engTitle + "/" + value[i].imgTitle + "_tit_icon.png' alt='" + value[i].imgTitle + "_tit_icon'>"
			sitemap += "<img src='/resources/service/env/images/" + value[i].engTitle + "/" + value[i].imgTitle + "_tit_icon_hover.png' alt='" + value[i].imgTitle + "_tit_icon_hover'>"
			sitemap += "</p>";
			sitemap += "<h2>";
			sitemap += "<a href='" + value[i].url + "' target='" + value[i].target +"'>" + value[i].title +"</a>";
			sitemap += "</h2>";
			if(value[i].hasChild){
				html += "<div class=\"depth_box\">";
				html += "<div class=\"depth_wrap\">";
				sitemap += "<div class=\"depth_box\">";
				sitemap += "<div class=\"depth_wrap\">";
				for(var j = 0; j < value[i].twoDepth.length; j++){
					html += "<div class=\"depth_list\">";
					html += "<a href='" + value[i].twoDepth[j].url +"' target='" + value[i].twoDepth[j].target +"' class='list_tit' title='" + value[i].twoDepth[j].title +"'>" + value[i].twoDepth[j].title +"</a>";
	                html += "</div>";
					sitemap += "<div class=\"depth_list\">";
					sitemap += "<a href='" + value[i].twoDepth[j].url +"' target='" + value[i].twoDepth[j].target +"' class='list_tit' title='" + value[i].twoDepth[j].title +"'>" + value[i].twoDepth[j].title +"</a>";
	                sitemap += "</div>";
				}
				html += "</div>";
				html += "</div>";
				sitemap += "</div>";
				sitemap += "</div>";
			}
			html += "</li>";
			sitemap += "</li>";
			location += "<li>";
			location += "<a href='" + value[i].url +"' target='" + value[i].target +"' title='"+ value[i].title +"'>" + value[i].title +"</a>";
			location += "</li>";
		}
		location += "</ul>";
		location += "</div>";

		if(value[oneNum] && value[oneNum].hasChild){
			if(oneNum== 2){
				location += "<div class='depth depth2_en'>";
			} else {
				location += "<div class='depth depth2_en'>";
			}
			location += "<a href='javascript:;' target='" + value[oneNum].twoDepth[twoNum].target +"' title='" + value[oneNum].twoDepth[twoNum].title +"' class='dep_tit'>" + value[oneNum].twoDepth[twoNum].title +"</a>";
			location += "<ul class='drop_box'>";
			for(var k = 0; k < value[oneNum].twoDepth.length; k++){
					location += "<li>";
					location += "<a href='" + value[oneNum].twoDepth[k].url +"' target='" + value[oneNum].twoDepth[k].target +"' title='" + value[oneNum].twoDepth[k].title +"'>" + value[oneNum].twoDepth[k].title +"</a>";
					location += "</li>";
			}
		}
		html += "</ul>";
		// sitemap += "</ul>";
		location += "</ul>";
		location += "</div>";

	});

	//console.log(html);

	$('#gnbWrap').prepend(html);
	$('.sitemap ul').append(sitemap);
	$('.sub_visual_menu').append(location);
	// console.log(oneNum,twoNum);
}

function currentPageNum(a,b){
	oneNum = a-1;
	twoNum = b;
}