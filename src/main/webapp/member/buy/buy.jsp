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
 <!-- 카카오 결제 -->
<script src="https://kapi.kakao.com/v1/payment/ready"></script>
<script src="https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#prepare-sample"></script>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#apibtn').click(function(){
		$.ajax({
			url:'kakaopay',
			dataType:'json',
			success:function(data){
				 // alert(resp.tid); //결제 고유 번호
				var box = resp.next_redirect_pc_url;
				//window.open(box); // 새창 열기
				location.href = box;
			},
			error:function(error){
				alert(error);
			}
		});
	});
});
let index = {
		init:function(){
	        $("#btn-kakaopay").on("click", ()=>{ // function(){}를 사용안하고 , ()=>{}를 사용하는 이유는 this를 바인딩하기 위해서
				this.kakaopay();
			});
		},

	  // 카카오페이 결제
		kakaopay:function(){
			
			$.ajax({
				url:"kakaopay",
				dataType:"json"
			}).done(function(resp){
				if(resp.status === 500){
					alert("카카오페이결제를 실패하였습니다.")
				} else{
					 // alert(resp.tid); //결제 고유 번호
					var box = resp.next_redirect_pc_url;
					//window.open(box); // 새창 열기
					location.href = box;
				}
			
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
			
		},
	}

	index.init();
</script>
<div class="container">
	
</div>
</body>
</html>