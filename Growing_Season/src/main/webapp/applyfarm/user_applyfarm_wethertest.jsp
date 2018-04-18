<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<link rel="stylesheet" href="/css/Nwagon.css" type="text/css">
<style>
.meta-post {
	font-size:20px;
	padding:0;
	margin:0;
	text-align:left;
	background-color:#ffffff;
	
}.meta-post div{
	text-align:left;
	padding:1%;
	margin:1%;	
	
}.shadow {
	-webkit-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	-moz-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	padding: 3%;
	border: rgba(0, 0, 0, 0.2);
	background-color:#ffffff;
}.border{	
	text-align:center;
}

</style>
	 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>날씨</h2>
            </div>
          </div>
          <div class="span8">            
          </div>
        </div>
      </div>
    </section>
<section id="content">
      <div class="container">
        <div class="row">

          <div class="span2">
			
            <aside class="left-sidebar">
			<h4>Accordion</h4>
                        <div class="accordion" id="accordion2">
                  <div class="accordion-group">
                    <div class="accordion-heading">
                      <a class="accordion-toggle active" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
								<i class="icon-minus"></i> 내위치 </a>
                    </div>
                    <div id="collapseOne" class="accordion-body collapse in">
                      <div class="accordion-inner">내위치
                      </div>
                    </div>
                  </div>
                  <div class="accordion-group">
                    <div class="accordion-heading">
                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
								<i class="icon-plus"></i>텃밭 </a>
                    </div>
                    <div id="collapseTwo" class="accordion-body collapse">
                      <div class="accordion-inner">텃밭1
                      </div>
                      <div class="accordion-inner">텃밭2
                      </div>
                      <div class="accordion-inner">텃밭3
                      </div>
                    </div>
                  </div>
                  <div class="accordion-group">
                    <div class="accordion-heading">
                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
								<i class="icon-plus"></i> 농장 </a>
                    </div>
                    <div id="collapseThree" class="accordion-body collapse">
                      <div class="accordion-inner">농장1
                      </div>
                      <div class="accordion-inner">농장2
                      </div>
                      <div class="accordion-inner">농장33
                      </div>
                    </div>
                  </div>
                </div>


            </aside>
          </div>
		<div class="row">
		   
			<div class="span9">
			
			<article>
				<div class="post-image">
					<div class="post-heading">
						<h3>날씨정보</h3>
					</div>
						<!--  <img src="/images/sms.jpg" alt="" />-->
				</div>
			 </article>
			</div>
		<div class="span9 shadow">
          <div class="span9 weather">
           
   
          </div>
          <div class="span9" style="float:right">
           	<div id="chart7" style="overflow:auto"></div>
            </div>
         </div>
    	</div>
        </div>

        
       </div>
    </section>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2df129d5c1a6d664029148b1657caaa3&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7fc9c44a5ac37faf4a780ad23f42331"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/locale/ko.js"></script>
<script type="text/javascript" src=/js/Nwagon.js/></script>
<script type="text/javascript" src=/js/Nwagon_no_vml.js/></script>
<script>

 $(window).load(function(){
	 	
	 	var appkey="46b61ee5117a80b49cf7a80f1647fe28"
		var geocoder = new daum.maps.services.Geocoder();
	 	
	 	var name=[];
	 	
	 	var values=[];
		geocoder.addressSearch("${FARM_INFO.fgaddress}", function(result, status){
			if (status === daum.maps.services.Status.OK) {
				console.log(result[0].y);
				console.log(result[0].x);
		        var lat = result[0].y;
		        var lon = result[0].x;
		        var count = 0;
		    	$.ajax({
		    		url:"http://api.openweathermap.org/data/2.5/forecast?lat="+lat+"&lon="+lon+"&units=metric&lang=kr&appid="+appkey,
		    		dataType:"json",
		    		type:"get",
		    		success:function(res){
		    			console.log(res);
		    			$.each(res.list, function(i,v){
		    				var unix = v.dt;
		    				var time = moment.unix(unix).format('M월DD일 H');
		    				
		    				var timeArray = time.split(' ');
		    				
		    				if(timeArray[1]=='12'){
		    					if(count<4){
		    						console.log(timeArray[1]);
			    					var icon =v.weather[0].icon;
			    					var condition = v.weather[0].description;
			    					var value=[];
				    				name.push(timeArray[0]+timeArray[1]+"시");
			    					value.push(v.main.temp);
			    					values.push(value);
			    							    					
			    					var weather = '<div class="span2 border">';
			    					weather += '<div class="post-image">';
			    					weather += '<div class="post-heading">';
			    					weather += '<h4>'+timeArray[0]+'</h4></div>'
			    					weather	+= "<img src='/images/"+icon+".png'></div>";
			    					weather += '<div class="meta-post" style="background-color:#f7f7f7">';
			    					weather += '<div class="span2">기온 : '+v.main.temp+'도</div>';
			    					weather += '<div class="span2">날씨 : '+condition+'</div>';
			    					weather += '</div></div>';
			    					$(".weather").append(weather);
					    	        //$(".pricing-content ul").append("<li><span>"+timeArray[0]+"의 "+timeArray[1]+"시 날씨입니다 기온 : "+v.main.temp+"도/ 날씨는 "+condition+"<img src='http://openweathermap.org/img/w/"+icon+".png'></span></li>");
					    	        count++;
		    					}
		    				
				    	        
		    				}else{
		    					
		    					var value=[];
			    				name.push('');
		    					value.push(v.main.temp);
		    					values.push(value);
		    					
		    				}
		    			});
		    			
		    			var options = {
		    					'legend':{
		    						names:name
		    							},
		    					'dataset':{
		    						title:'Playing time per day', 
		    						values: values,
		    						colorset: ['#0000FF'],
		    						fields:["온도"]
		    					},
		    					'chartDiv' : 'chart7',
		    					'chartType' : 'line',
		    					'leftOffsetValue': 40,
		    					'bottomOffsetValue': 60,
		    					'chartSize' : {width:870, height:400},
		    					'minValue' : -20,
		    					'maxValue' : 40,
		    					'increment' : 10
		    				};

		    				Nwagon.chart(options);
		    		}
		    	});
		   
			}
		});

 });

 
 </script>
 
 <script>

	</script>	
 