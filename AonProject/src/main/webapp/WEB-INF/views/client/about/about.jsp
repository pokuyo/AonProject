<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/about/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/about/about.css">
	
    <div class="about_body" id = "about_main">
    	<!-- <img id="bar" src="/resources/include/image/about/back.png" class="backImg"> -->
    	<div class="about_content">
    		<!-- concept -->
    		<div class="about_concept">
    			<div class="con_bar1">
    				<img id="bar" src="/resources/include/image/about/bar.png">
    			</div>
    			<div class="Name_concept">
    				<span class="concept_span" style="font-size:25px;">
    						B R A N D　 C O N C E P T
    				</span>
    			</div>
    			<div class="content_concept">
    				<span class="concept_content">
    						AON는 심풀, 미니멀, 컬러감이 있는 것들에서 영감을 <br />
							받으며, 시즌마다 재미있는 요소를 더한 위트있는 <br />
							컨템포러리 웨어를 제안합니다.
							<br />
							<br />
							일상생활, 일 그리고 패션에 대해 <br />
							자기만의 스타일을 가지고 있는 사람들과 함께 ,<br />
							오늘도 모든것을 판매합니다.
    				</span>
    			</div>
    		</div>
    		
    		<!-- slogan -->
    		<div class="about_slogan">
    			<div class="con_bar2">
    				<img id="bar" src="/resources/include/image/about/bar.png">
    			</div>
    			<div class="Name_slogan">
    				<span class="slogan_span" style="font-size:25px;">
    						B R A N D　 S L O G A N
    				</span>
    			</div>
   				<div class="content_slogan">
    				<span class="slogan_content">
    						WHATEVER YOU WANT  <br />
							AON에서는 당신이 원하는 무엇이든  <br />
							당신의 곁으로 다가가려 합니다.
    				</span>
    			</div>
    		</div>
    		
    		<!-- story -->
    		<div class="about_story">
    			<div class="con_bar3">
    				<img id="bar" src="/resources/include/image/about/bar.png">
    			</div>
    			<div class="Name_story">
    				<span class="story_span" style="font-size:25px;"> 
    						B R A N D　 S T O R Y
    				</span>
    				<div class="content_story">
	    				<span class="story_content">
	    						준비하지 못한채로 하루를 맞이하는 요즘,   <br />
								당신의 열정과 용기를 마음에 품은 당신을 위해  <br />
								AON은 그 마음을 드러낼 수 있는 의복을 만들고 싶었습니다.<br />
								<br /> 
								<br />
								베이직하지만 단순하지 않고, 특별하지만 별나지 않은 디자인으로<br />
								당신의 마음을 응원합니다.
	    				</span>
	    			</div>
    			</div>
    		</div>
    	</div>
    </div>
    <script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
    <script src="http://cdn.jsdelivr.net/mojs/latest/mo.min.js"></script>
    <script type="text/javascript">
    var first = new mojs.Shape({
        shape: 'circle',
        radius: {
            0: 'rand(120,160)'
        },
        stroke: 'cyan',
        strokeWidth: {
            0 : 0
        },
        fill: 'none',
        left: '50%',
        top: '50%',
        duration: 300
    });

    var seconds = [];
    for (var i = 0; i < 5; i++) {
        var second = new mojs.Shape({
            parent: first.el,
            shape: 'circle',
            radius: {
                0: 'rand(45,135)'
            },
            stroke: 'black',
            strokeWidth: {
                10 : 0
            },
            fill: 'none',
            left: '50%',
            top: '50%',
            x: 'rand(-350, 350)',
            y: 'rand(-350, 350)',
            duration: 300,
        });
        seconds.push(second);
    };
    
    function playPlay() {
    	first.generate().replay();
        for (var i = 0; i < seconds.length; i++) {
            seconds[i].generate().replay();
        };
    };
    
    setInterval("playPlay()", 1000);
    </script>