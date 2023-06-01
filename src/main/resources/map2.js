
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
										console.log(lat + "test : / " + lon);
									// 좌표 설정
									var markerPosition = new Tmapv2.LatLng(
											lat, lon);
									
									var latlon = lat + "," + lon;
									console.log("latlon : " + latlon);
		
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
				        startpoint = [lat, lon];
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
