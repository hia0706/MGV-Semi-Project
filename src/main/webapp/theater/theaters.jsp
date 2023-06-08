<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko" >
<head>
    
<title>
	영화 그 이상의 감동. MGV
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>

    .bi-heart-fill{
        font-size: 22px;
        line-height: 22px;
        color:crimson;
    }
    
      textarea {
    width: 38.3%;
    border: none;
    resize: none;
  }
	.theater_wrap{
	background-color: black;
	}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="극장"/>
</jsp:include>

<div class="container ">
	<div class="theater_wrap">
		<div class="sect-favorite">
			<table class="table">
				<tr>
					<td class="text-white align-middle">자주가는극장</td>
					<td>
						<ul class="list-group list-group-horizontal ">
						  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75" >
						  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">An item</a>
						  </li>
						  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75">A second item</li>
						  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75">A third item</li>
						  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75">A 4 item</li>
						  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75">A 5 item</li>
						</ul>
					</td>
					<td>
					<button type="button" class="btn btn-dark">자주가는 CGV 설정</button>
					</td>
				</tr>
			</table>			
		</div>
		<div class="sect-city " >
			<ul class="nav nav-tabs" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Home</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Profile</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Contact</button>
			  </li>
			</ul>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
			  	<ul class="list-group list-group-horizontal row row-cols-4 px-4">
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV강남</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CGV명동역 씨네라이브러리</a>
				  </li>
				  <li class="list-group-item bg-dark p-2 text-white bg-opacity-75 col-3" >
				  	<a href="nothing.jsp" style="text-decoration: none;" class="link-light">CINE de CHEF 용산아이파크몰</a>
				  </li>
				</ul>
			  </div>
			  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
			  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
			  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
			</div>
			</div>
		</div>
	</div>

<div class="container">
	<div>
		<div>
			<h4>극장
			<!-- 현재 극장이 즐겨찾기에 해당하는 극장이 아니면 색상 변경 -->
			<i class="bi bi-heart-fill text-muted"></i>
			</h4>
		</div>
		<div class="theater_detail text-center bg-dark p-2 text-white bg-opacity-75">
			<img alt="대학로" src="../images/theater1.jpg">
			<div>
				<textarea class="bg-dark p-2 text-white bg-opacity-75" rows="10" cols="30" disabled="disabled">2222222233333333334</textarea>
				<textarea class="bg-dark p-2 text-white bg-opacity-75" rows="10" cols="30" disabled="disabled"></textarea>
			</div>
		</div>
		<div class="mx-auto" style="width: 500px;">
			<div class="btn-group">
			  <a href="" class="btn btn-primary active" aria-current="page">위치안내</a>
			  <a href="" class="btn btn-primary">관람가격안내</a>
			  <a href="" class="btn btn-primary">무엇무엇안내</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>