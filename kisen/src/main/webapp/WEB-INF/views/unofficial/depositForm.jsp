  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>    

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    <title>DepositForm</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        #logo{
            height: 50px;;
        }
        ul li{
            list-style: none;
        }
        .searchList li{
            float: left;
            margin: 0.5rem;
            padding: 0.3rem 0.7rem;
        }
        .searchList{
            margin-bottom: 0;
        }
        #name{
            font-size: 25px;
            color: black;
            font-weight: bolder;
        }
        #search_img{
            height: 23px;
        }
        .box{
            margin-top: 0;
            height: 45px;
            background-color: #C8A9C8;
        }
        .search-ul{
            margin-right: 5rem;
            height: 29px;
            list-style: none;
        }
        .search-ul li{
            height: 80%;
            margin: 0.5rem 1rem 0 1rem;
        }       
        .search-ul li a{
            padding-top: 0.3rem;
            margin-top:  1rem;
        }
        a{
            color: black;
        }
        .navbar{
            float: none;
            margin: 0 auto;
            padding: 0.5rem 1rem ;
        }
        header{
            text-align: center;
        }
            /* position:absolute;
            left:50%;
            transform: translateX(-50%); */
        .main-navbar form{
            margin: 0 1rem 0 3.5rem; 
        }
        .main-navbar{   
            padding: 0.5rem 1rem ;
        }
        .divide{
            height: 80%;
            margin: 0.5rem 0.5rem 0 0.5rem;
        }
        .menu-ul{
            width: 100%;
            height: 100%;
            margin-bottom: 0;
        }

        footer{
            height: 200px;
        }
        .footer-introduce{
            width: 908px;

        }
        .footer-introduce li span{
            color: gray;
        }
        .footer-ul{
            margin: 1rem 2.5rem ;
            width: 250px;
        }
        .span-color{
            background-color: #39516A;
            color: whitesmoke;
            padding:   0 0.5rem ;
        }
        .span-color-h{
            background-color: #39516A;
            color: whitesmoke;
            padding:   0.1rem 0.5rem ;
            margin-bottom: 2rem;
        }
        header hr {
            margin: 0;
            border: 0;
            border-top: 1px solid rgba(0,0,0,.1);
        }
        .memu-div{
            width: 100%;
        }
        
        .btn-outline-warning {
    color:  #9033b5;
    background-color: transparent;
    background-image: none;
    border-color:  #9033b5;
 
}


.btn-outline-warning:hover{
    color:  white;
    background-color: #c7a2e0;
    background-image: none;
    border-color:  #c7a2e0;
}
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset = "UTF-8"></script>
<link
rel="stylesheet"
href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


  <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
 

</head>
<body>
    
   

    
    <section>

<form>
  <div class="form-group">
    <label for="title">폼제목</label>
     <input type="text" class="form-control" placeholder="폼제목을 입력하세요">
  </div>
 


  
 <div class="form-group">
		<label for="content">상세설명</label>
		<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
	</div>
	
	 <div class="form-group">
    <label for="date">입금기간</label>
    </div>
      <!-- jquery UI 링크 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<p><input type="text" id="from"> ~ <input type="text" id="to"></p>
<p><input type="text" id="alternateFrom" size="30"> ~ <input type="text" id="alternateTo" size="30"></p>

<!-- jquery UI CDN -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- 언어 별 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.2/i18n/jquery.ui.datepicker-ko.min.js"></script>
<!-- Date 라이브러리 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
  
<script>
$(function(){
var option = {
// datepicker 애니메이션 타입
// option 종류 : "show" , "slideDown", "fadeIn", "blind", "bounce", "clip", "drop", "fold", "slide"
showAnim : "slideDown",
// 해당 월의 다른 월의 날짜가 보이는 여부, 예를 들면 10월이면 전후에 9월 마지막과 11월의 시작 일이 보이는 여부입니다. 즉, 달력이 꽉 차 보이게 하는 것
showOtherMonths: true,
// 선택 여부 (showOtherMonths 옵션과 같이 일치시키지 않으면 에러가 발생합니다.)
selectOtherMonths: true,
// 달력 밑에 오늘과 닫기 버튼이 보인다.
showButtonPanel: true,
// 년 월이 셀렉트 박스로 표현 되어서 선택할 수 있다.
changeMonth: true,
changeYear: true,
// 한번에 보이는 개월 수
numberOfMonths: 1,
// 데이터 포멧
dateFormat: "yy-mm-dd",
// 텍스트 박스 옆의 달력 포시
showOn: "button",
//이미지 타입인지 버튼 타입인지 설정
buttonImageOnly: true,
// 이미지 경로
buttonImage: "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
// 버튼 타입이면 버튼 값
buttonText: "Select date",
// alt 데이터 포멧
altFormat: "DD, d MM, yy",
// 선택 가능한 날짜(수 형식) - 현재 기준 -20일
minDate: -20,
// 선택 가능한 최대 날짜(문자 형식) - 현재 기준 +1월 +20일
maxDate: "+1M +20D",
// 주 표시
showWeek: true
};
var optionFrom = option;
optionFrom.altField = "#alternateFrom";
var dateFormat = "mm/dd/yy";
// 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없다.
var from = $( "#from" )
.datepicker(optionFrom)
.on( "change", function() {
to.datepicker( "option", "minDate", getDate( this ) );
});
var optionTo = option;
optionTo.altField = "#alternateTo";
// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
var to = $( "#to" )
.datepicker(optionTo)
.on( "change", function() {
from.datepicker( "option", "maxDate", getDate( this ) );
});
function getDate( element ) {
return moment(element.value).toDate();
}
});
</script>

 <div class="form-group">
    <label for="bankinfo">은행정보</label>
     <input type="text" class="form-control" placeholder="은행명">
      <input type="text" class="form-control" placeholder="계좌번호">
       <input type="text" class="form-control" placeholder="예금주명">

  
  </div>
	
	 <div class="form-group">
    <label for="productname">상품명</label>
      <input type="text" class="form-control" placeholder="상품명을 입력하세요">
  </div>
   <div class="form-group">
    <label for="price">가격</label>
    <input type="text" class="form-control" placeholder="가격을 입력하세요">
  </div>
   <div class="form-group">
    <label for="stock">재고</label>
    <input type="text" class="form-control" placeholder="재고를 입력하세요">
  </div>
  <input class="btn btn-default" type="submit" value="+상품추가">
  <h3>배송방법</h3>
   <div class="form-group">
    <label for="delivery">배송방법</label>
     <input type="text" class="form-control" placeholder="예)택배">
  </div>
   <div class="form-group">
    <label for="deliveryprice">배송비</label>
      <input type="text" class="form-control" placeholder="0">원
  </div>
	
  
   <div class="form-group">
    <label for="deliveryinfo">(선택)배송안내</label>
    <textarea class="form-control" rows="3" placeholder="배송에 대한 안내가 필요할 경우 작성하세요"></textarea>
  </div>
  
    <div class="col-2" id="edit">
		      
		      <div class="py-2">
		      	<button type="submit" class="btn btn-outline-warning" onclick="goWrite(this.form)">폼만들기</button>
		      </div>
		      
	    </div>
	
 
  <script>
  $(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});
	});
  </script>
  
  
  
  

</form>



</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	