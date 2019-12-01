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
      ['봉은사', 37.515443, 127.057448, 100],
      ['신사동 가로수길',37.520572, 127.022932, 100],
      ['선정릉', 37.508708, 127.049084, 100],
      ['코엑스 아쿠아리움', 37.510200,127.058582, 100],
      ['도산공원', 37.524465, 127.035326, 100],
      ['한국자수박물관', 37.515369, 127.033310, 100]
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
<h1>Map</h1>
<table class='ltable'>
	<tr>
		<td class='lt'>
			<b>도산공원</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울특별시 강남구 신사동 도산대로45길 20 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 00:00 - 24:00 <br>
			<img src="imgs/won.png" class="icon">&nbsp;무료 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;주차, 남/녀 화장실 구분<br>
		</td>
		<td rowspan="3" class='lt'>
			<div id="map" style="width: 500px; height: 600px; color:black;"></div>
		</td>
		<td class='lt'>
			<b>봉은사</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울특별시 강남구 봉은사로 531 봉은사 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 00:00 - 24:00 <br>
			<img src="imgs/won.png" class="icon">&nbsp;무료 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;주차,예약, 남/녀 화장실 구분<br>
		</td>
	</tr>
	<tr>
		<td class='lt'>
			<b>가로수길</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울특별시 강남구 신사동 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 00:00 - 24:00 <br>
			<img src="imgs/won.png" class="icon">&nbsp;무료 <br>
		</td>
		<td class='lt'>
			<b>코엑스 아쿠아리움</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울 강남구 영동대로 513 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;평일 10:00 - 20:00일~금 (입장마감 : 19시)<br>
			&emsp;토요일 10:00 - 21:00(입장마감 : 20시) <br>
			&emsp;일요일 10:00 - 20:00(입장마감 : 19시)<br>
			<img src="imgs/won.png" class="icon">&nbsp;성인/청소년 (만13세 이상)---28,000원<br>
			&emsp;어린이 (36개월 이상~만12세)---24,000원 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;주차, 남/녀 화장실 구분<br>
		</td>
	</tr>
	<tr>
		<td class='lt'>
			<b>한국자수박물관</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울특별시 강남구 논현로132길 34 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;평일 10:00~16:00 <br>
			<img src="imgs/won.png" class="icon">&nbsp;무료 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;주차, 남/녀 화장실 구분<br>
		</td>
		<td class='lt'>
			<b>선정릉</b><p>
			<img src="imgs/placeholder.png" class="icon">&nbsp;서울특별시 강남구 삼성동 선릉로100길 1 <br>
			<img src="imgs/clock.png" class="icon">&nbsp;매일 06:00~21:00<br>
			&emsp;매주 월요일 휴무 <br>
			<img src="imgs/won.png" class="icon">&nbsp;무료 <br>
			<img src="imgs/houses.png" class="icon">&nbsp;주차, 남/녀 화장실 구분<br>
		</td>
	</tr>
</table>
&nbsp;<p>
&nbsp;<p>
</body>
</html>