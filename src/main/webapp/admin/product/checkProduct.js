/**
 * 
 */
function check() {
	let name = document.getElementById("product-name");
	let price = document.getElementById("product-price");
	let stock = document.getElementById("product-stock");
	let soldout = document.getElementById("product-soldout");
	let composition = document.getElementById("product-composition");
	
	if (name.value === '') {
		alert('상품의 이름을 입력하세요.');
		name.focus();
		return false;
	}
	
	if (price.value === '') {
		alert('상품의 가격을 입력하세요.');
		price.focus();
		return false;
	}
	
	if (stock.value === '') {
		alert('상품의 재고를 입력하세요.');
		stock.focus();
		return false;
	}
	
	if (soldout.value.search("Y") && soldout.value.search("N") || soldout.value.length > 1) {
  
      alert("'Y' 또는 'N'으로 입력하세요.");
      soldout.focus();
      return false;
	}
	
	if (composition.value == '') {
		alert('상품 구성을 넣어주세요.');
		composition.focus();
		return false;
	}
	return true;
}














