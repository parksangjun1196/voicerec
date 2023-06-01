

	var locationval = "";
	var locationendval = "";
	
	var startpoint;
	var endpoint;
	
	
	//출발값 받을때 startpoint에 좌표값 저장
	//출발값 받아서poi 좌표 받아주는 함수 추가로 필요함
	//도착값 받을땐 input vlaue 안에 저장
	//같은함수 쓰는데 어캐구분함? if != startpint -> ?
	function rstClick() {
		  var liElement = event.target.closest('li');
		  
		  endpoint = liElement.querySelector('input').value.split(",");
			
	
		  console.log(startpoint + " thisis strt end " + endpoint);
		  
		  
		  
		  
		  
			console.log(startpoint[0]);
			console.log(startpoint[1]);
			console.log(endpoint[0]);
			console.log(endpoint[1]);

		  
		  var spanElement = liElement.querySelector('div > span');
		  var text = spanElement.textContent;
		  var extractedText = text.replace(/\[(.*?)\]/g, '($1)');
		  console.log(extractedText);

		  locprint("endpoint", locationendval);
		  document.querySelector('.blurwrap').style.display = "none";
		  
		  initNewMap(startpoint, endpoint);
		  
		  // 이거다음에 뿌려주는 함수 넣어주기 
		}
	
	//봇 메시지 출력 함수
	function printBotText(text, delay, callback) {
	    const element = document.querySelector('.botansboxtext');
	    element.textContent = ''; // Clear existing text
	
	    let i = 0;
	    const interval = setInterval(() => {
	        if (i < text.length) {
	            const span = document.createElement('span');
	            span.textContent = text[i];
	            element.appendChild(span);
	            i++;
	        } else {
	            clearInterval(interval);
	            if (callback) setTimeout(callback, delay);
	        }
	    }, 50);
	}
	
	
	// 음성 인식 함수
	function record(phaseFunction) {
	    if (!('webkitSpeechRecognition' in window)) {
	        console.log('음성 인식 API를 지원하지 않는 브라우저입니다.');
	        return;
	    }
	
	    const recognition = new webkitSpeechRecognition();
	    recognition.continuous = true;
	    let timeoutID;
	
	    recognition.onstart = () => console.log('음성 인식이 시작되었습니다.');
	    
	    recognition.onresult = (event) => {
	        clearTimeout(timeoutID); // Cancel the timer when there's a result
	        const transcript = event.results[event.results.length - 1][0].transcript;
	        console.log('음성 인식 결과:', transcript);
	        recognition.stop(); // Stop voice recognition
	        phaseFunction(transcript); // Call the appropriate phase function
	    };
	    
	    recognition.onerror = (event) => console.error('음성 인식 에러:', event.error);
	    recognition.onend = () => console.log('음성 인식이 종료되었습니다.');
	    
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
	            	 console.log(response);
	            	 
	            	 if (response == "false") {
	            		 locationval = "";
	            		 printBotText("원하시는 장소를 말씀해 주세요!", 1000, () => record(phaseFunctions.phaseOne));
 
	            	 }
	            	 else {
	            		 
	            		 console.log("thisiswhatiwant :" + response);
	            		 searchPOI(response);
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
		            	 console.log(response);
		            	 
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
		            	 console.log(response);
		            	 
		            	 if (response == "false") {
		            		 locationendval = "";
		            		 
		            		 printBotText("원하시는 \"도착\"장소를 말씀해 주세요!", 1000, () => record(phaseFunctions.phaseThree));
		            		 
		            		 
		            	 }
		            	 else {
		            		//phaseRst  -> 도착 결과 최 단거리 출력하ㄷ
		            		 
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
	        console.error("No element with class 'findinputbox' found");
	    }
	}
	
	
	window.onload = function() {
		var rstcnt = 0;
		var searchloc = "";
/* 		initTmap(searchloc); */
		
		var testloc = "";
		
		//session address 값이 없을때 초기
		if (testloc == "" || testloc == null) {
			
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

