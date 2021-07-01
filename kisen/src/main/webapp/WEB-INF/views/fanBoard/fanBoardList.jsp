<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- autocomplete 관련 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fanBoard/fanBoardList.css" />
<script>
$(document).ready(function(){
	var idolNo = ${param.artistNo};
		$.ajax({
			url: "${pageContext.request.contextPath}/fanBoard/fanBoardList",
			method: "GET",
			data: {idolNo},
			success(data){
				console.log(data);
				const {list} = data;
				const {pageBar} = data;
				$("#pagingBar").append(pageBar);
				if(list.length > 0) {
				for(i=0; i<list.length; i++){
					
	                var d = new Date(list[i].fbDate), // Convert the passed timestamp to milliseconds
	                yyyy = d.getFullYear(),
	                mm = ('0' + (d.getMonth() + 1)).slice(-2),  // Months are zero based. Add leading 0.
	                dd = ('0' + d.getDate()).slice(-2),         // Add leading 0.
	                hh = d.getHours(),
	                h = hh,
	                min = ('0' + d.getMinutes()).slice(-2),     // Add leading 0.
	                ampm = 'AM',
	                time;
	                
	                // ie: 2013-02-18, 8:35 AM  
	                time = yyyy + '.' + mm + '.' + dd + '.';
	                
				if(list[i].hasAttachment){
				$("#tBody").append(
					'<tr data-no="' + list[i].fbNo + '"> '
						+ '<th scope="row">' + (i + 1) + '</th>'
						+ '<td class="title">' + list[i].fbTitle + '&nbsp;' + '<img src="${pageContext.request.contextPath}/resources/images/fanBoard/attach.png" width="16px" alt="" />' + '</td>'
						+ '<td>' + list[i].fbWriter + '</td>'
						+ '<td>' + time + '</td>'
						+ '<td>' + list[i].fbReadCnt + '</td>'
					+ '</tr>');			
				} else {
					$("#tBody").append(
							'<tr data-no="' + list[i].fbNo + '"> '
								+ '<th scope="row">' + (i + 1) + '</th>'
								+ '<td class="title">' + list[i].fbTitle + '</td>'
								+ '<td>' + list[i].fbWriter + '</td>'
								+ '<td>' + time + '</td>'
								+ '<td>' + list[i].fbReadCnt + '</td>'
							+ '</tr>');		
				}
				}
				$("tr[data-no]").click(e => {
					console.log(e.target);
					// tr에 적혀있는 data-no를 가져오기
					var $tr = $(e.target).parent();
					var no = $tr.data("no");
					location.href = "${pageContext.request.contextPath}/fanBoard/fanBoardDetail.do?no=" + no;
				});
				}
				else {
					$("#tBody").append(
							'<tr"> '
								+ '<td colspan="5">조회된 게시글이 없습니다.</td>'
							+ '</tr>');
				}
			},
			error: console.log
		})
});

$(document).ready(function(){
	var idolNo = ${param.artistNo};
		$.ajax({
			url: "${pageContext.request.contextPath}/fanBoard/fanBoardIdolName",
			method: "GET",
			data: {idolNo},
			success(data){
				const {idolName} = data;
				$(".idolName").html(idolName);
			},
			error: console.log
		})
});

</script>
<div class="board-container">
  <div class="fb-idol">
  <h4><span class="idolName"></span> | 팬게시판</h4>
  </div>
  <!-- 글쓰기 버튼 -->
  <div class="enroll-btn">
  <button type="button" class="btn board-enroll-btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/fanBoard/fanBoardEnroll.do?idolNo=' + ${param.artistNo}">글쓰기</button>
    </div>
    <!-- 검색바 -->
    <div>
    <div class="search-img">
    <img src="${pageContext.request.contextPath}/resources/images/fanBoard/search.png" id="search-img" alt="검색이미지">
    </div>
    <input type="search" placeholder="검색" id="searchKeyword" class="form-control search-input col-sm-5 d-inline" autofocus>
    </input>
    </div>
  <!-- 공지사항 list 테이블 -->
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th scope="col" class="col-1">번호</th>
        <th scope="col" class="col-6">제목</th>
        <th scope="col" class="col-2">작성자</th>
        <th scope="col" class="col-2">날짜</th>
        <th scope="col" class="col-1">조회수</th>
      </tr>
    </thead>
    <tbody id="tBody">
<%--     <c:forEach items="${list}" var="board">
      <tr>
        <th scope="row">${board.fbNo}</th>
        <td class="title">${board.fbTitle}</td>
        <td>gg</td>
        <td>@mdo</td>
        <td>@mdo</td>
      </tr>
    </c:forEach>  --%>
  </table>
  <!-- 페이징 바 -->
  <div id="pagingBar">
  
<!-- ¿  </div>
  <div class="paging-bar">
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div> -->

<script>
$(() => {

	// keyup이벤트가 일어나면 알아서 autocomplete 함수 호출됨
	// 그때마다 사용자 입력값을 서버로 보내서 그것과 일치하는 게시글들을 가져오기
	$("#searchKeyword").autocomplete({
  		source: function(request, response){
 		  //console.log(request);
 		  //console.log(response);
 		  //response([{label:'a', value:'a'}, {label:'b', value:'b'}]);
 		  
 		  //사용자입력값전달 ajax요청 -> success함수안에서 response호출 
  	 	  $.ajax({
			url: "${pageContext.request.contextPath}/fanBoard/searchKeyword.do",
			data: {
				// searchTitle이라는 key값으로 request.term을 보냄
				searchKeyword: request.term
			},
			// success : function(data){
			// 객체 안 메소드의 경우 아래와 같이 사용 가능
			success(data){
				console.log(data);
				const {list} = data;
				// 배열을 하나 새로 만들기
				// map 이용 - 배열의 요소를 가져와서 다른 형식으로 변환 가능
				// board를 가져와서 board에 있는 title을 꺼내서 label과 value 지정
				// 우리는 board no값으로 페이지 이동하므로 no값을 함께 넣어줌
				const arr = 
				list.map(({fbNo, fbTitle}) => ({
					// console.log(board);
					label: fbTitle,
					value: fbTitle,
					fbNo
					}));
				console.log(arr);
				// response에 전달
				response(arr);
			},
			error(xhr, statusText, err){
				console.log(xhr, statusText, err);
			}
  	  	  });
		},
		// 클릭했을때, 해당게시글 상세페이지로 이동
		select: function(event, selected){
			// console.log("select : ", selected);
			// item이라는 속성값으로 아까만든 label과 value가 들어감
			// -> value를 얻고 싶다면 item.value로 찾아야 함
			
			// item속성의 no속성 가져오기
			const {item: {fbNo}} = selected;
			location.href = "${pageContext.request.contextPath}/fanBoard/fanBoardDetail.do?no=" + fbNo;
		},
		focus: function(event, focused){
		 return false;
		},
		// autofocus : true -> 처음것이 바로 선택됨
		// minLength : n -> 몇글자를 쳐야 검색이 시작될지
		autoFocus: true, 
		minLength: 2
  });
});
</script>

