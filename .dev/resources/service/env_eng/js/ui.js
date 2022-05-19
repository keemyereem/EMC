
const linkArray = [
	["/en/"],
	["ceo" , "history" , "vision" , "ci" , "map"],
	["business_intro" , "business_om" , "", "02_01_0031", "02_02_0011", "02_02_0021", "02_03_0011"],
	["ethical_management" , "safety_health", "fair_trade_pgm", "carbon_reduction", ""],
	["invest_news", "statement_financial_position" , "" ],
	["personnel_system", ""]
]

function link(idx , num){

    var chk = linkArray[idx][num];

    if(idx == 0){
        location.href = chk
    } else{
    	location.href = "/en/sub.do?MENUID=" + chk + "&MENUNO=" + idx
    }

}

function linkBBS(idx, num, bbsNo) {

    var chk = linkArray[idx][num];

    if(idx == 0){
        location.href = chk;
    } else{
    	location.href = "/en/bbs/data/bbsDataList.do?MENUID=" + chk + "&MENUNO=" + idx + "&bbsNo=" + bbsNo;
    }

}


function linkBusiness(idx, num) {
    var chk = linkArray[idx][num];
    var searchBsnsintrcnCode, searchClCode, ctgryNo;
    
    if( idx == 2 ){
    	if( num == 1 ){
    		searchBsnsintrcnCode = "A012001"; 
    		searchClCode = "A012003";
    		ctgryNo = "1";
    		location.href = "/en/env/bsnsintrcn/bsnsintrcnList.do?MENUNO=" + idx + "&SUB_MENUNO="+ num +"&searchBsnsintrcnCode=" + searchBsnsintrcnCode + "&searchClCode=" + searchClCode + "&ctgryNo=" + ctgryNo;		
    	}
    	if( num == 2 ){
    		searchBsnsintrcnCode = "A012002"; 
    		searchClCode = "A012009";
    		ctgryNo = "";
    		location.href = "/en/env/bsnsintrcn/bsnsintrcnList.do?MENUNO=" + idx + "&SUB_MENUNO="+ num +"&searchBsnsintrcnCode=" + searchBsnsintrcnCode + "&searchClCode=" + searchClCode + "&ctgryNo=" + ctgryNo;		
    	}
    }
}		
		
/*
 * 파일 다운로드
 * 3,0,1: 지속가능경영 > 윤리경영 > 윤리경영 소개 > 윤리규정 준수 Message
 * 3,0,2: 지속가능경영 > 윤리경영 > 윤리경영 소개 > 윤리규정
 * 3,0,3: 지속가능경영 > 윤리경영 > 윤리경영 소개 > 윤리경영 실천가이드
 * 3,0,4: 지속가능경영 > 윤리경영 > 윤리경영 소개 > 내부감사규정
 * 3,0,5: 지속가능경영 > 윤리경영 > 상담/제보 > 제보자 보호규정
 * */
function fnfileDownLoad(idx, num, fileno) {
	 alert("준비중");
	 return;
}