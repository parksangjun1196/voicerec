<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Speech Detection</title>
  		<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=hAeh0XQZwO5CeTusAbw0h8wz6PZeKF3d9ZFlvO18"></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
  
    <style>
        /* Base HTML tag */
        html {
            font-size: 24px;
        }
        * {
		  font-family: 'Noto Sans KR', sans-serif;
		}
		    
        /* Main container */
        .scwrap {
            width: 90vw;
            height: 100vh;
            margin: 0 auto;
        }
    
        /* Header */
        .scheader {
            display: flex;
            border-bottom: 3px solid #ff174f;
            flex-wrap: wrap;
            padding: 5%;
        }
    
        .scheader > * {
            flex: 1;
        }
    
        /* Logo Box */
        .sclogobox {
            display: flex;
            padding: 2.7% 0 0 0;
            font-size: 3rem;
            justify-content: center;
            font-weight: 800;
            color: #350419;
        }
    
        .logoheart {
           	height: 60%;
        }
    
        img.logoheart {
            height: 30%;
        }
    
/*         .sclogo { */
/*             font-size: 48px; */
        }
    
        /* Menu Box */
        .scmenu {
            display: flex;
            list-style: none;
            justify-content: flex-end;
            flex-wrap: wrap;
        }
    
        .scmenu > * {
            width: 100%;
            display: flex;
            justify-content: center;
            font-size: 24px;
            padding: 2% 0;
        }
    
        /* Menu Icon */
        .menuicon {
            display: none;
        }
    
        /* Content */
        .sccontent {
            display: flex;
            flex-direction: column;
            flex-wrap: wrap;
            margin-top: 5%;
            background: -webkit-linear-gradient(344deg, #fdd7e8 33.3%, #f6b6cd 0 , #f6b6cd 68.6%, #fd86aa 0 );
            background: -moz-linear-gradient(0deg, red 50%, green 0);
            align-content: flex-start;
        }
    
        .scleftcontent {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #FFFFFF;
            border-radius: 40px;
            width: 100%;
            margin : 1%;
         
            padding-top: 8%;
        }
        .scrightcontent {
        	width:100%;
        	height: 488px;
        	background-color: #FFFFFF;
        	border-radius: 30px;
        	margin: 3%;
        	padding: 5%;
        	position: relative;
        
        }
        
        .scrightcontent > .findbox {
         	border: 3px solid #c407345c;;
         	padding: 0 2%;
         
        
       
        
        }
        .findinputbox {
        	width:100%;
        	height:100%;
        	border: 2px solid #f6b6cd;
    		font-size: 2rem;
  		    padding-left: 5%;
  		 
         }
         .rstinputbox {
        	width:100%;
        	height:100%;
        	border: 2px solid #f6b6cd;
    		font-size: 2rem;
  		    padding-left: 5%;
         }
        
    
        /* Button Answers */
        .botans {
            display: flex;
            justify-content: center;
            margin: 4% 0 4% 0;
            position: relative;
            overflow: hidden;
            width: 100%;
            animation: fadein 1.5s;
            
            
        }
    
        .botansbox {
            width: 90%;
        }
    
        .botansboxtext {
            width: 80%;
            position: absolute;
            left: 10%;
            top: 8%;
            padding-top: 8%;
          
/*             overflow: hidden; */
        }
    
        /* Bot Image */
       	.bot {
       		width : 100%;
       		display:flex;
       		justify-content: center;
       	
       	}
        .botimg {
     		
    		width: 70%;
    		animation: fadein 1.5s;
    		
      
        }
         .findbox {
            	height:111px;
            margin:3% 0;
            
            }
         .findicon{
         	display: flex;
         	align-items: center;
         }
         .findicon > span {
        	 font-size: 2rem;
        	 margin-left: 3%;
        	 font-weight: 800;
        	 color: #350419;
        	}
    
        /* Media queries */
    
        /* From 430px and above */
        @media screen and (min-width: 360px) {
            .scheader {
                flex-wrap: nowrap;
            }
            .sclogobox {
                width: auto;
            }
            .sccontent {
                flex-direction: row;
            }
            .scmenu > * {
                width: 130px;
                height: 20px;
            }
            .botimg {
              
            }
        }
   
        
        @keyframes fadein {
		    from {
		        opacity: 0;
		    }
		    to {
		        opacity: 1;
		    }
		}
        
        	.blurwrap {
				position: absolute;
				background-color: rgba(0, 0, 0, 0.24);
				width: 100vw;
				height: 190vh;
				display: flex;
				justify-content: center;
				padding-top: 35%;
				top: 0;
				left:0; 
				display: none; 
				    
			}
			.text_custom {
				display: none;
			}
			#btn_select {
				display: none;

			}
			.mapwrap {
				display: flex;
				flex-direction: column;
				width: 80%;
				height: 1330px;
				background-color: rgb(255, 255, 255);
				padding-top: 5%;
   				 padding-bottom: 10%;
				 font-size: 32px;
				

			}
			.rsttext {
				display: flex;
				justify-content: center;

				align-items: center;
				flex-direction: column;
				margin-bottom: 5%;

			}
			.rsttext > * {
				margin: 0;
			}
			#searchResult {
				list-style: none;
				padding-inline-start: 0;
				margin: 0 auto;
			}
			.map {
				display: flex;
  				justify-content: center;
				  height: 400px;
   				 width: 90%;
				 margin-bottom: 1%;
			}
			.result {
				display: flex;
				justify-content: center;
				overflow: scroll;
				margin-top: 5%;
			}
			.rst {
				font-size: 32px;

			}
			#searchResult > li > div {
				border: 10px solid #FF3C6B;
				margin-bottom: 5%;
				border-radius: 30px;
				height: 142px;
				display: flex;
				align-items: center;
				font-size: 32px;

			}
			.mapbox {
				display: flex;
				justify-content: center;
			}
			.divisionmap {
				position: absolute;
				top:0;
				left:0;
				width: 100%;
				height:580px;
				display: none;
				
			
			}
			.listening {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #00000091;
    color: white;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    font-size: 60px;
    display: none;
    font-weight: 800;
}
			
			
			
				.loader,
				.loader:before,
				.loader:after {
				  border-radius: 50%;
				  width: 2.5em;
				  height: 2.5em;
				  -webkit-animation-fill-mode: both;
				  animation-fill-mode: both;
				  -webkit-animation: load7 1.8s infinite ease-in-out;
				  animation: load7 1.8s infinite ease-in-out;
				}
				.loader {
				  color: #ffffff;
				  font-size: 10px;
				  margin: 12px auto;
				  position: relative;
				  text-indent: -9999em;
				  -webkit-transform: translateZ(0);
				  -ms-transform: translateZ(0);
				  transform: translateZ(0);
				  -webkit-animation-delay: -0.16s;
				  animation-delay: -0.16s;
				  zoom: 3;
				}
				.loader:before,
				.loader:after {
				  content: '';
				  position: absolute;
				  top: 0;
				}
				.loader:before {
				  left: -3.5em;
				  -webkit-animation-delay: -0.32s;
				  animation-delay: -0.32s;
				}
				.loader:after {
				  left: 3.5em;
				}
				@-webkit-keyframes load7 {
				  0%,
				  80%,
				  100% {
				    box-shadow: 0 2.5em 0 -1.3em;
				  }
				  40% {
				    box-shadow: 0 2.5em 0 0;
				  }
				}
				@keyframes load7 {
				  0%,
				  80%,
				  100% {
				    box-shadow: 0 2.5em 0 -1.3em;
				  }
				  40% {
				    box-shadow: 0 2.5em 0 0;
				  }
				}
				        
        
    </style>
</head>
<body>
	   <div class="scwrap">
	   
	   
        <div class="scheader">
            <div class="sclogobox">
                <img class= "logoheart" src="/voice/resources/logoheart.png">
                <div class="sclogo">서로이웃</div>
            </div>

        </div>
        <div class="sccontent">
	         <div class="scrightcontent">
	         	<div class="divisionsearch">
	         	  	<div class= "findicon"> <img  src="/voice/resources/paper-plane.png"><span>현재 위치</span></div>
		         	<div class="findbox"><input class="findinputbox" type="text" value ="" placeholder="현재 위치를 입력해주세요" ></div>
		         	<div class= "findicon"><img  src="/voice/resources/goal.png"><span>찾는 위치</span></div>
		         	<div class="findbox"> <input class="rstinputbox" type="text" value ="" placeholder="도착 위치를 입력해주세요" ></div>
	         	</div>
	         	<div class="divisionmap">
	         		<div class="shortcut">
			<!-- 190430 기존 지도를 모두 이미지 처리 위해 주석 처리 S -->
						<div id="new_map_wrap" class="new_map_wrap3">
							<div id="new_map_div"></div>
						</div>
						<div class="new_map_act_btn_wrap clear_box"></div>
						<p id="new_result"></p>
						<br />
					</div>
	         	</div>
	       
	         
	         
	         </div>
            <div class="scleftcontent">
                <div class="botans">
                    <img class="botansbox" src="/voice/resources/Rectangle48.png">
                    <div class="botansboxtext"> 
                    
                    </div>
                </div>
                <div class="bot">
                    <img class="botimg" src="/voice/resources/bot2.png">
                </div>
            </div>
           
        </div>
        <div class="blurwrap">
		<div class = "mapwrap">
			<div class="rsttext">
				<p>총 [<span class="rstcnt"></span>]건의 검색 결과가 있습니다.</p>
				<p>찾으시는 장소를 눌러주세요.</p>
			</div>
			<div class="mapbox">
				<div class = "map">
					<input type="text" class="text_custom" id="searchKeyword" name="searchKeyword" value="서울시">	
					<button id="btn_select">적용하기</button>
					<div id="map_div" class="map_wrap" style="float:left"></div>
				</div> 
			</div>
			<div class="result">
				<div style="width: 90%; float:left;">
					
					<div class="rst_wrap">
						<div class="rst mCustomScrollbar">
							<ul id="searchResult" name="searchResult">
								<li>검색결과</li>
							</ul>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
		

</div>

<div class="listening">
			<div>지금 듣고 있습니다.</div><br>
			<div>계속 말씀해 주세요.</div><br>
			<div class="loader">Loading...</div>
		
		</div>
    
    <script type="text/javascript">
	var map;
	var marker_s, marker_e, marker_p1, marker_p2;
	var totalMarkerArr = [];
	var drawInfoArr = [];
	var resultdrawArr = [];
	var prtendpoint;

	function initTmap2(startpoint, endpoint) {
		
		document.querySelector('.divisionsearch').style.display = "none";
		document.querySelector('.divisionmap').style.display = "block";

		var sx = Number(startpoint[0]);
		var sy = Number(startpoint[1]);
		var ex = Number(endpoint[0]);
		var ey = Number(endpoint[1]);
		console.log("sx : " + sx + "sy :" + sy + "ex :" + ex + "ey :" + ey)
		

		console.log(locationendval + "<< 존재함?")
		 printBotText(locationendval + "약도 인쇄를 원하시면 [ 인쇄 ] 메일로 받으실려면 [ 메일 ]이라고 말씀해주세요.", 1000, null);
// 1. 지도 띄우기
		map = new Tmapv2.Map("new_map_div", {
		center : new Tmapv2.LatLng(sx, sy),
			width : "100%",
			height : "100%",
			zoom : 17,
			zoomControl : true,
			scrollwheel : true
		});

		// 2. 시작, 도착 심볼찍기
		// 시작
		marker_s = new Tmapv2.Marker(
				{
					position : new Tmapv2.LatLng(sx,sy),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
					iconSize : new Tmapv2.Size(24, 38),
					map : map
				});

		// 도착
		marker_e = new Tmapv2.Marker(
				{
					position : new Tmapv2.LatLng(ex,ey),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
					iconSize : new Tmapv2.Size(24, 38),
					map : map
				});

		// 3. 경로탐색 API 사용요청
		var headers = {}; 
			headers["appKey"]="hAeh0XQZwO5CeTusAbw0h8wz6PZeKF3d9ZFlvO18";
	
			$.ajax({
					method : "POST",
					headers : headers,
					url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
					async : false,
					data : {
						"startX" : sy,
						"startY" : sx,
						"endX" : ey,
						"endY" : ex,
						"reqCoordType" : "WGS84GEO",
						"resCoordType" : "EPSG3857",
						"startName" : "출발지",
						"endName" : "도착지"
					},
					success : function(response) {
						var resultData = response.features;

						//결과 출력
						var tDistance = "총 거리 : "
								+ ((resultData[0].properties.totalDistance) / 1000)
										.toFixed(1) + "km,";
						var tTime = " 총 시간 : "
								+ ((resultData[0].properties.totalTime) / 60)
										.toFixed(0) + "분";

						$("#result").text(tDistance + tTime);
						
						//기존 그려진 라인 & 마커가 있다면 초기화
						if (resultdrawArr.length > 0) {
							for ( var i in resultdrawArr) {
								resultdrawArr[i]
										.setMap(null);
							}
							resultdrawArr = [];
						}
						
						drawInfoArr = [];

						for ( var i in resultData) { //for문 [S]
							var geometry = resultData[i].geometry;
							var properties = resultData[i].properties;
							var polyline_;


							if (geometry.type == "LineString") {
								for ( var j in geometry.coordinates) {
									// 경로들의 결과값(구간)들을 포인트 객체로 변환 
									var latlng = new Tmapv2.Point(
											geometry.coordinates[j][0],
											geometry.coordinates[j][1]);
									// 포인트 객체를 받아 좌표값으로 변환
									var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
											latlng);
									// 포인트객체의 정보로 좌표값 변환 객체로 저장
									var convertChange = new Tmapv2.LatLng(
											convertPoint._lat,
											convertPoint._lng);
									// 배열에 담기
									drawInfoArr.push(convertChange);
								}
							} else {
								var markerImg = "";
								var size;

								if (properties.pointType == "S") { //출발지 마커
									markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
									pType = "S";
									size = new Tmapv2.Size(24, 38);
								} else if (properties.pointType == "E") { //도착지 마커
									markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
									pType = "E";
									size = new Tmapv2.Size(24, 38);
								} else { //각 포인트 마커
									markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
									pType = "P";
									size = new Tmapv2.Size(8, 8);
								}

								// 경로들의 결과값들을 포인트 객체로 변환 
								var latlon = new Tmapv2.Point(
										geometry.coordinates[0],
										geometry.coordinates[1]);

								// 포인트 객체를 받아 좌표값으로 다시 변환
								var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
										latlon);

								var routeInfoObj = {
									markerImage : markerImg,
									lng : convertPoint._lng,
									lat : convertPoint._lat,
									pointType : pType
								};

								// Marker 추가
								marker_p = new Tmapv2.Marker(
										{
											position : new Tmapv2.LatLng(
													routeInfoObj.lat,
													routeInfoObj.lng),
											icon : routeInfoObj.markerImage,
											iconSize : size,
											map : map
										});
							}
						}//for문 [E]
						drawLine(drawInfoArr);
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				});

	}

	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
	function drawLine(arrPoint) {
		var polyline_;

		polyline_ = new Tmapv2.Polyline({
			path : arrPoint,
			strokeColor : "#DD0000",
			strokeWeight : 6,
			map : map
		});
		resultdrawArr.push(polyline_);
	}
</script>
	<script type="text/javascript">
			var map, marker;
			var markerArr = [], labelArr = [];
			var rstcnt = 0;
			function initTmap(texts) {
				document.querySelector('.blurwrap').style.display = "flex";
				// 1. 지도 띄우기
				map = new Tmapv2.Map("map_div", {
					center : new Tmapv2.LatLng(37.56520450, 126.98702028),
					width : "100%",
					height : "auto",
					zoom : 17,
					zoomControl : true,
					scrollwheel : true
				});
		
				// 2. POI 통합 검색 API 요청
				
						var searchKeyword = texts; // 검색 키워드
						var headers = {}; 
						headers["appKey"]="hAeh0XQZwO5CeTusAbw0h8wz6PZeKF3d9ZFlvO18";

						$.ajax({
							method : "GET", // 요청 방식
							headers : headers,
							url : "https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result", // url 주소
							async : false, // 동기설정
							data : { // 요청 데이터 정보
								"searchKeyword" : searchKeyword, // 검색 키워드
								"resCoordType" : "EPSG3857", // 요청 좌표계
								"reqCoordType" : "WGS84GEO", // 응답 좌표계
								"count" : 10 // 가져올 갯수
							},
							success : function(response) {
								var resultpoisData = response.searchPoiInfo.pois.poi;
		
								// 2. 기존 마커, 팝업 제거
								if (markerArr.length > 0) {
									for(var i in markerArr) {
										markerArr[i].setMap(null);
									}
									markerArr = [];
								}
								
								if (labelArr.length > 0) {
									for (var i in labelArr) {
										labelArr[i].setMap(null);
									}
									labelArr = [];
								}
		
								var innerHtml = ""; // Search Reulsts 결과값 노출 위한 변수
								//맵에 결과물 확인 하기 위한 LatLngBounds객체 생성
								var positionBounds = new Tmapv2.LatLngBounds(); 
		
								// 3. POI 마커 표시
								for (var k in resultpoisData) {
									// POI 마커 정보 저장
									var noorLat = Number(resultpoisData[k].noorLat);
									var noorLon = Number(resultpoisData[k].noorLon);
									var name = resultpoisData[k].name;
									rstcnt += 1;
									// POI 정보의 ID
									var id = resultpoisData[k].id;
		
									// 좌표 객체 생성
									var pointCng = new Tmapv2.Point(
											noorLon, noorLat);
									
									// EPSG3857좌표계를 WGS84GEO좌표계로 변환
									var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
											pointCng);
		
									var lat = projectionCng._lat;
									var lon = projectionCng._lng;
				
									// 좌표 설정
									var markerPosition = new Tmapv2.LatLng(
											lat, lon);
									
									var latlon = lat + "," + lon;
						
		
									// Marker 설정
									marker = new Tmapv2.Marker(
										{
											position : markerPosition, // 마커가 표시될 좌표
											//icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
											icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_"
													+ k
													+ ".png", // 아이콘 등록
											iconSize : new Tmapv2.Size(
													24, 38), // 아이콘 크기 설정
											title : name, // 마커 타이틀
											map : map // 마커가 등록될 지도 객체
										});
		
									// 결과창에 나타날 검색 결과 html
									innerHtml += "<li  onclick='rstClick()'>"+"<input type='hidden' value='"+latlon+"' />"
											+"<div><img src='http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_" + k + ".png' style='vertical-align:middle;'/><span>"
											+ name
											+ "</span></div></li>";
									
									// 마커들을 담을 배열에 마커 저장
									markerArr.push(marker);
									positionBounds.extend(markerPosition); // LatLngBounds의 객체 확장
								}
								console.log(rstcnt)
								$(".rstcnt").html(rstcnt);
								$("#searchResult").html(innerHtml); //searchResult 결과값 노출
								map.panToBounds(positionBounds); // 확장된 bounds의 중심으로 이동시키기
								map.zoomOut();
							},
							error : function(request, status, error) {
								console.log("code:"
										+ request.status + "\n"
										+ "message:"
										+ request.responseText
										+ "\n" + "error:" + error);
							}
						});
					
			}
		
			// 4. POI 상세 정보 API
			function poiDetail(poiId) {
				console.log(poiId);
				var headers = {}; 
				headers["appKey"]="hAeh0XQZwO5CeTusAbw0h8wz6PZeKF3d9ZFlvO18";

				$.ajax({
					method : "GET", // 요청 방식
					headers : headers,
					url : "https://apis.openapi.sk.com/tmap/pois/"
							+ poiId // 상세보기를 누른 아이템의 POI ID
							+ "?version=1&resCoordType=EPSG3857&format=json&callback=result",
					async : false, // 동기 설정
					success : function(response) {
						console.log(response);
			
						// 응답받은 POI 정보
						var detailInfo = response.poiDetailInfo;
						var name = detailInfo.name;
						var address = detailInfo.address;
			
						var noorLat = Number(detailInfo.frontLat);
						var noorLon = Number(detailInfo.frontLon);
			
						var pointCng = new Tmapv2.Point(noorLon, noorLat);
						var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
								pointCng);
			
						var lat = projectionCng._lat;
						var lon = projectionCng._lng;
			
						var labelPosition = new Tmapv2.LatLng(lat, lon);
			
						// 상세보기 클릭 시 지도에 표출할 popup창
						var content = "<div style=' border-radius:10px 10px 10px 10px;background-color:#2f4f4f; position: relative;"
								+ "line-height: 15px; padding: 5 5px 2px 4; right:65px;'>"
								+ "<div style='font-size: 11px; font-weight: bold ; line-height: 15px; color : white'>"
								+ "name : "
								+ name
								+ "</br>"
								+ "address : "
								+ address + "</div>" + "</div>";
					
						var labelInfo = new Tmapv2.Label({
							position : labelPosition,
							content : content,
							map : map
						});
						//popup 생성
			
						// popup들을 담을 배열에 팝업 저장
						labelArr.push(labelInfo);
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				});
			}
			
			
			function searchPOI(searchWord) {
				  var headers = {};
				  headers["appKey"] = "hAeh0XQZwO5CeTusAbw0h8wz6PZeKF3d9ZFlvO18";

				  $.ajax({
				    method: "GET",
				    headers: headers,
				    url: "https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result",
				    async: false,
				    data: {
				      "searchKeyword": searchWord,
				      "resCoordType": "EPSG3857",
				      "reqCoordType": "WGS84GEO",
				      "count": 10
				    },
				    success: function (response) {
				      var resultpoisData = response.searchPoiInfo.pois.poi;

				      if (resultpoisData.length > 0) {
				        var noorLat = Number(resultpoisData[0].noorLat);
				        var noorLon = Number(resultpoisData[0].noorLon);

				        var pointCng = new Tmapv2.Point(noorLon, noorLat);
				        var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(pointCng);

				        var lat = projectionCng._lat;
				        var lon = projectionCng._lng;

				        console.log("검색어: " + searchWord);
				        console.log("위도(lat): " + lat);
				        console.log("경도(lon): " + lon);
				        startpoint = [lat,lon];
				        console.log("thisisstartpoint arr : " + startpoint);
				      } else {
				        console.log("검색 결과를 찾을 수 없습니다.");
				      }
				    },
				    error: function (request, status, error) {
				      console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				    }
				  });
				}
</script>
<script>

	var locationval = "";
	var locationendval = "";	
	var startpoint;
	var endpoint;
	function rstClick() {
		  var liElement = event.target.closest('li');
		  
		  endpoint = liElement.querySelector('input').value.split(",");

		  var spanElement = liElement.querySelector('div > span');
		  var text = spanElement.textContent;
		  var extractedText = text.replace(/\[(.*?)\]/g, '($1)');
		  locationendval = text;

		  locprint("endpoint", locationendval);
		  document.querySelector('.blurwrap').style.display = "none";
		  
		  initTmap2(startpoint, endpoint);
		}
	
	//봇 메시지 출력 함수
	function printBotText(text, delay, callback) {
	    const element = document.querySelector('.botansboxtext');
	    element.textContent = ''; // Clear existing text
	
	    let i = 0;
	    const interval = setInterval(() => {
	        if (i < text.length) {
	        	console.log("printbottext test : " + text)
	      
	        	if(text[i] == "." || text[i] == "!") {
	        		
	        		const span = document.createElement('span');
		            span.textContent = text[i];
		            
		            span.style.fontSize = "1.8rem";
		            span.style.fontWeight = "800";
		            span.style.marginBottom = "10%";
		            
		            const br = document.createElement('br');
		            
		            element.appendChild(span);
		
		            element.appendChild(br);
		            i++;
	        	}
	        	else {
	        		const span = document.createElement('span');
		            span.textContent = text[i];
		            span.style.fontSize = "1.8rem";
		            span.style.fontWeight = "800";
		            span.style.marginBottom = "50%";
		            element.appendChild(span);
		            i++;
	        		
	        	}
	            
	        } else {
	            clearInterval(interval);
	            if (callback) setTimeout(callback, delay);
	        }
	        
	        
	    }, 50);
	}
	
	
	// 음성 인식 함수
	function record(phaseFunction) {
	    if (!('webkitSpeechRecognition' in window)) {

	        return;
	    }
	
	    document.querySelector(".listening").style.display = "flex";
	
	    const recognition = new webkitSpeechRecognition();
	    recognition.continuous = true;
	    let timeoutID;
	  
	    var rstcheck = "";
	    var transcript;
	
	    recognition.onstart = () => console.log('음성 인식이 시작되었습니다.');
	    
	    recognition.onresult = (event) => {
	        clearTimeout(timeoutID); // Cancel the timer when there's a result
	        transcript = event.results[event.results.length - 1][0].transcript;
	        console.log('음성 인식 결과:', transcript);
	        recognition.stop(); // Stop voice recognition
	        if (transcript == "" || transcript == null) {
	        	
/* 	        	phaseFunction("");  */
	        	return
	        }
	        else {
	        	rstcheck = transcript;
	            phaseFunction(transcript); // Call the appropriate phase function
	        }
	
	    };
	    
	    recognition.onerror = (event) => {
	    	console.error('음성 인식 에러:', event.error);
	  /*   	phaseFunction("");  */
	  		document.querySelector(".listening").style.display = "none";
	  		return;
	    	
	    }
	    recognition.onend = () =>{
	    	document.querySelector(".listening").style.display = "none";
	    	console.log('음성 인식이 종료되었습니다.');
	    	console.log(rstcheck)
	    	
	    	if (rstcheck == "" || rstcheck == null) {
	 			phaseFunction(""); 
	    		return
	    	}
	    
	    	
	    }
	    
	    recognition.start();
	}

	// API 호출 함수
	function callApi(texts, phaseflag ,callback) {
		
		
	    const xhr = new XMLHttpRequest();
	    
	    if (phaseflag == "phaseOne") {
	    	
	        const url = '/voice/api/v1/voiceinsert?texts=' + texts;
	        xhr.open('GET', url, true); 
	        xhr.send();
	        xhr.onload = () => {
	            if(xhr.status == 200) {
	                console.log(xhr.response);
	                callback(xhr.response);
	            } else {
	                console.log('false');
	            }
	        }
	    	
	    }
		    
	    else if (phaseflag == "phaseTwo") {
		    	
		        const url = '/voice/api/v1/voiceYN?texts=' + texts;
		        xhr.open('GET', url, true); 
		        xhr.send();
		        xhr.onload = () => {
		            if(xhr.status == 200) {
		                console.log(xhr.response);
		                callback(xhr.response);
		            } else {
		                console.log('false');
		            }
		        }
		    	
		    }
	    
	
	}

	// 각 phase에서 수행할 함수 정의
	const phaseFunctions = {
	    phaseOne: function(texts) {
	    	
	        if (!texts) {
	            printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseOne));
	            return;
	        }
	        callApi(texts, "phaseOne", (response) => {
	            if (!response) {
	                printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseOne));
	            } else {
	                const sendText = "말씀하신 주소가 [" + response + "]가 맞습니까? 맞으시면 \"예\" 틀리시면 \"아니오\"라고 말씀해주세요";
	                locationval = response;
	                printBotText(sendText, 1000, () => record(phaseFunctions.phaseYN));
	            }
	        });
	    },
	    phaseYN: function(texts) {
	        // Implement what you want to do with texts in phaseYN
	         if (!texts) {
	            printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseYN));
	            return;
	        }
	         callApi(texts, "phaseTwo", (response) => {
	             if (!response) {
	            	 onsole.log(response);
	                 printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseYN));
	             } else {

	            	 
	            	 if (response == "false") {
	            		 locationval = "";
	            		 printBotText("원하시는 장소를 말씀해 주세요!", 1000, () => record(phaseFunctions.phaseOne));
 
	            	 }
	            	 else {
	            		 
	  
	            		 searchPOI(locationval);
	            		
	            		 //시작위치에 insert 하는 함수
	            		 locprint("startpoint", locationval);
	            		 // 도착지 물어보는 함수
	            		 printBotText("원하시는 \"도착\" 장소를 말씀해 주세요!", 1000, () => record(phaseFunctions.phaseThree));
	            	 }
	           
	             }
	         });
	        
	        
	    },
		phaseThree: function(texts) {
		    	
		        if (!texts) {
		            printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseThree));
		            return;
		        }
		        callApi(texts, "phaseOne", (response) => {
		            if (!response) {
		                printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseThree));
		            } else {
		                const sendText = "말씀하신 주소가 [" + response + "]가 맞습니까? 맞으시면 \"예\" 틀리시면 \"아니오\"라고 말씀해주세요";
		                searchloc = response;
		                printBotText(sendText, 1000, () => record(phaseFunctions.phaseThreeYN));
		            }
		        });
		    },
		    
		    
		    phaseThreeYN: function(texts) {
		        // Implement what you want to do with texts in phaseYN
		         if (!texts) {
		            printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseThreeYN));
		            return;
		        }
		         callApi(texts, "phaseTwo", (response) => {
		             if (!response) {
		            	 onsole.log(response);
		                 printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseThreeYN));
		             } else {

		            	 
		            	 if (response == "false") {
		            		 locationendval = "";
		            		 printBotText("원하시는 \"도착\"장소를 말씀해 주세요!", 1000, () => record(phaseFunctions.phaseThree));
		            		 searchloc = "";
		            		 
		            	 }
		            	 else {
		            		
		            		 initTmap(searchloc);
		            	
		            	 }
		           
		             }
		         });
		        
		        
		    },
		    phaseFourYN: function(texts) {
		        // Implement what you want to do with texts in phaseYN
		         if (!texts) {
		            printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseFourYN));
		            return;
		        }
		         callApi(texts, "phaseTwo", (response) => {
		             if (!response) {
		            	 onsole.log(response);
		                 printBotText("죄송합니다. 다시 말씀해 주세요", 1000, () => record(phaseFunctions.phaseFourYN));
		             } else {

		            	 
		            	 if (response == "false") {
		            		 locationendval = "";
		            		 
		            		 printBotText("원하시는 \"도착\"장소를 말씀해 주세요!", 1000, () => record(phaseFunctions.phaseThree));
		            		 
		            		 
		            	 }
		            	 else {
		            		//phaseRst  -> 도착 결과 최 단거리 출력하ㄷ
		            		 initTmap2(startpoint,endpoint);
		            	
		            		 
		            	 }
		           
		             }
		         });
		        
		        
		    },
	};

	//location print func
	function locprint(flag, text) {
		
		if (flag == "startpoint") {
			const inputBox = document.querySelector(".findinputbox");
			inputBox.value = text;
		}
		else {
			
			const inputBox = document.querySelector(".rstinputbox");
			inputBox.value = text;
			
			
		}
		
	}
	
	function changeInputValue(newVal) {
	    const inputBox = document.querySelector(".findinputbox");
	    if (inputBox) {
	        inputBox.value = newVal;
	    } else {

	    }
	}
	
	
	window.onload = function() {
		var rstcnt = 0;
		var searchloc = "";
		var dfloc = "";
		//session address 값이 없을때 초기
		if (dfloc == "" || dfloc == null) {
			
		    const messages = [
		        { text: "안녕하세요! 원하시는 위치를 찾아드릴게요!", delay: 1000 },
		        { text: "그다음! 현재 계신 위치를 말씀해 주세요.", delay: 1000 },
		        { text: "고객님의 말씀을 듣고 있습니다. 계속 말씀해주세요.", delay: 1000 }
		    ];
		
		    let i = 0;
		    function processMessage() {
		        if (i >= messages.length) {
		            record(phaseFunctions.phaseOne);
		            return;
		        }
		        const { text, delay } = messages[i];
		        printBotText(text, delay, processMessage);
		        i++;
		    }
		    processMessage();
			
			
		}
		//session address 값이 있을때 여기로 검색 시작할까요 ? 예 아니오 func 필요 
		else {

		}
	};


</script>


</body>
</html>
