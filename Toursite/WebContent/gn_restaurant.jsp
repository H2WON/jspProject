<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
  <style type="text/css">
  	.icon{
  		width:15px;
  		height: 15px;
  	}
  	table{
  		color:white;
  	}
  	.ltable {
			border-top : 1px solid white;
			border-collapse: collapse;
		}
	.lt {
			border-bottom: 1px solid white;
			padding : 10px;
			color:white;
	}
  </style>
  <script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>
  <script type="text/javascript">
  function gangnam(){
    var locations = [
      ['철든놈', 37.499619, 127.029594],
      ['완소',37.518855,127.024630],
      ['딸부자네불백 <br> 강남역점', 37.502524, 127.027562, 100],
      ['미미네', 37.512738,127.051208],
      ['미트프레쉬', 37.501947,127.026744],
      ['루킹래징 본점', 37.500829,127.051163]
    ];
    
    var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: new google.maps.LatLng(37.517199,127.041245),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow(
    	{
    		 maxWidth: markerMaxWidth
    	}
    );

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
        title: locations[i][0]
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  }
  </script>
</head> 
<body onload="gangnam()">
<center/>
<h1>Restaurant</h1>
<table class='ltable'>
	<tr>
		<td class='lt'>
			<b>완소</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울 강남구 강남대로152길 68 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 21:30 - 04:00 <br>
			<img src="imgs/pork.png" class="icon">&nbsp; 자료없음 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;단체석<br>
		</td>
		<td rowspan="3" class='lt'>
			<div id="map" style="width: 500px; height: 600px; color:black;"></div>
		</td>
		<td class='lt'>
			<b>미트프레쉬</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울특별시 강남구 역삼1동 813-18 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 11:00 ~ 23:00 <br>
			<img src="imgs/pork.png" class="icon">&nbsp;파인애플 빙수 ----- 12,500원 <br>
			&nbsp;&emsp;망고 코코넛 빙수 ---- 11,000원<br>
			&nbsp;&emsp;타로타로볼 빙수 ----- 7,800원 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;단체석<br>
		</td>
	</tr>
	<tr>
		<td class='lt'>
			<b>딸부자네불백 강남역점</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울 강남구 강남대로158길 21<br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 00:00 - 24:00 <br>
			&nbsp;&emsp;일요일 00:00 - 21:00 <br>
			<img src="imgs/pork.png" class="icon">&nbsp;소불백 --- 9,000원<br>
			&nbsp;&emsp;딸불백 --- 8,000원<br>
			&nbsp;&emsp;낙지 ----- 8,000원 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;단체석<br>
		</td>
		<td class='lt'>
			<b>미미네</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울 강남구 봉은사로 471 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 11:30 - 21:30<br>
			<img src="imgs/pork.png" class="icon">&nbsp;국물떡볶이 ----- 3,500원<br>
			&nbsp;&emsp;모둠튀김 ------- 9,500원<br>
			&nbsp;&emsp;반조리떡볶이 --- 10,000원 <br>
			&nbsp;&emsp;새우튀김1마리 --- 2,300원 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;주차, 남/녀 화장실 구분<br>
		</td>
	</tr>
	<tr>
		<td class='lt'>
			<b>철든놈</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울 강남구 강남대로94길 28 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;주말 12:30 - 23:00<br>
			&nbsp;&emsp;평일 17:00 - 23:00 <br>
			<img src="imgs/pork.png" class="icon">&nbsp;대표이베리코 흑돼지 목살 --- 9,800원<br>
			&nbsp;&emsp;프리미엄 1+ 한돈 삼겹살 --- 9,800원<br>
			&nbsp;&emsp;스모킹 삼겹살 -------------- 6,800원 <br>
			&nbsp;&emsp;마늘 삼겹살 ---------------- 6,800원 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;단체석, 예약, 무선 인터넷, 남/녀 화장실 구분<br>
			
		</td>
		<td class='lt'>
			<b>루킹래징 본점</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울특별시 강남구 대치동 907-14 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 08:00~23:00<br>
			<img src="imgs/pork.png" class="icon">&nbsp;에스프레소 --------- 3,000원<br>
			&nbsp;&emsp;편안한 휴식 세트 --- 6,000원<br>
			&nbsp;&emsp;즐거운 대화 세트 --- 9,000원 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;아담한가게, 테라스<br>
		</td>
	</tr>
</table>
&nbsp;<p>
&nbsp;<p>
</body>
</html>