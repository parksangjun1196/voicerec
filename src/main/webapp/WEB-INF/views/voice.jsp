<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Speech Detection</title>
</head>
<body>

  <div class="words" contenteditable>
  </div>
  
  <form>
  	<input type="button" onclick="recordstart">
  	<input type="button" onclick="recordstopsend">
  </form>

<script>
  window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

  let recognition = new SpeechRecognition();
  recognition.interimResults = false;
  recognition.lang = 'ko-KR';

  let makeNewTextContent = function() {
    p = document.createElement('p');
    document.querySelector('.words').appendChild(p);
  };

  let p = null;

  recognition.start();
  
  
  recognition.onstart = function() {
    makeNewTextContent(); // 음성 인식 시작시마다 새로운 문단을 추가한다.
  };
  recognition.onend = function() {
    recognition.start();
  };
  
  

  recognition.onresult = function(e) {
    let texts = Array.from(e.results)
            .map(results => results[0].transcript).join("");

    texts.replace(/느낌표|강조|뿅/gi, '❗️');

    p.textContent = texts;
    console.log(texts);
  };
</script>


  <style>
    html {
      font-size: 10px;
    }

    body {
    
      font-family: 'helvetica neue';
      font-weight: 200;
      font-size: 20px;
    }

    .words {
      max-width: 500px;
      margin: 50px auto;
   
      border-radius: 5px;
      box-shadow: 10px 10px 0 rgba(0,0,0,0.1);
      padding: 1rem 2rem 1rem 5rem;
     /*  background: -webkit-gradient(linear, 0 0, 0 100%, from(#d9eaf3), color-stop(4%, #fff)) 0 4px; */
      background-size: 100% 3rem;
      position: relative;
      line-height: 3rem;
    }

    p {
      margin: 0 0 3rem;
    }

    .words:before {
      content: '';
      position: absolute;
      width: 4px;
      top: 0;
      left: 30px;
      bottom: 0;
      border: 1px solid;
      border-color: transparent #efe4e4;
    }
  </style>

</body>
</html>
