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
<div class="layer-wrap" style="position:static; top:auto; left:auto;">
    <div class="popwrap" style="width:633px;">
        <h1>자주 가는 CGV 설정</h1>
        <div class="pop-contents fav-cgv">
        <!-- Contents Addon -->
            <div class="sect-cgv-control">
                <h2 class="hidden">자주가는 지역 및 영화관 선택</h2>
                <p>영화관을 선택하여 등록해주세요. <strong>최대 5개까지</strong> 등록하실 수 있습니다.</p>
                <p>
                    <select id="select_region" name="" title="자주가는 지역선택">                        
                    </select>
                    <select id="select_theater" name="" title="자주가는 CGV선택">                        
                    </select> 
                    <button id="btn_add_favorite_theater" type="button" class="round inblack on"><span>자주가는 CGV 추가</span></button>
                </p>
            </div>
            <div class="sect-favorite-control">
                <h2><strong>진현국님</strong>이 자주 가는 CGV</h2>
                <div class="theater-choice">
                    <ul>
                        <li>
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater"></div>
                                    <button type="button" class="btn-close"></button>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater"></div>
                                    <button type="button" class="btn-close"></button>
                                </div>
                            </div>
                        </li>
                        <li class="none">
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater"></div>
                                    <button type="button" class="btn-close"></button>
                                </div>
                            </div>
                        </li>
                        <li class="none first-child">
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater"></div>
                                    <button type="button" class="btn-close"></button>
                                </div>
                            </div>
                        </li>
                        <li class="none">
                            <div class="box-polaroid">
                                <div class="box-inner">
                                    <div class="theater"></div>
                                    <button type="button" class="btn-close"></button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            

			<div class="set-btn fix-width">
                <button type="button" id="btnCancel" class="round gray"><span>취소</span></button>
                <button type="submit" id="btnSave" class="round inred"><span>등록하기</span></button> 
            </div>

        <!-- //Contents Addon -->
        </div>
        <button id="btn_close" type="button" class="btn-close">자주 가는 CGV 설정 팝업 닫기</button>
    </div>
</div>
<!-- //자주 가는 CGV 설정 POPUP -->
</body>
</html>