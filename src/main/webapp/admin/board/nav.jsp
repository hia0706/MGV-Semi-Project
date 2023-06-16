<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<div class="container mt-3" style="float: left">

  <div class="row" >
  	<div class="col-3">
    	 <div class="card">
         	<div class="card-header text-center" >게시판관리</div>
    		
            	<div class="list-group">
				  <a href="home.jsp" class="list-group-item list-group-item-action">게시판 홈</a>
		          <div class="accordion" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        영화 게시판 관리
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div >

				        <a href="movie/list.jsp" class="list-group-item list-group-item-action ">일반 게시판 관리</a>
				        <a href="movie/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="movie/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>

				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        극장 게시판 관리
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div >
				       	<a href="theater/list.jsp" class="list-group-item list-group-item-action">일반 게시판 관리</a> 
				        <a href="theater/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a>
				        <a href="theater/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        스토어 게시판 관리
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div >
				       	<a href="store/list.jsp" class="list-group-item list-group-item-action">일반 게시판 관리</a>
				        <a href="store/reportlist.jsp" class="list-group-item list-group-item-action">신고 게시판 관리</a> 
				        <a href="store/deletelist.jsp" class="list-group-item list-group-item-action">삭제 게시판 관리</a> 
				      </div>
				    </div>
				  </div>
				</div>
				</div>
				        
				        
				        
  		</div>
    </div>
	</div>

</div>
</body>
</html>