<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$("#fgDivision").change(function() {
		
		$.ajax({
			url : "/findFarmAddress1.do",
			type : "POST",
			header: {
				"dataType" : "json",
			},
			data : {
				"fgDivision" : $("#fgDivision").val()
			},
			success : function(result) {
				console.log("성공했음");
				console.log(result);
				$("#fgDetailDiv").empty();
				$("#fgLocation").empty();
				$("#fgName").empty();
				$("#fgAddress").empty();
				$("#fgDetailDiv").append("<option value='미선택'>선택하세요</option>");
				$.each(result, function(i,v) {
					 $("#fgDetailDiv").append("<option value='"+v+"'>"+v+"</option>");
	            });
			}
		});
	});
});

$(document).ready(function(){
	$("#fgDetailDiv").change(function() {
		
		$.ajax({
			url : "/findFarmAddress2.do",
			type : "POST",
			header: {
				"dataType" : "json",
			},
			data : {
				"fgDetailDiv" : $("#fgDetailDiv").val()
			},
			success : function(result) {
				console.log("성공했음");
				console.log(result);
				$("#fgLocation").empty();
				$("#fgAddress").empty();
				$("#fgName").empty();
				$("#fgLocation").append("<option value='미선택'>선택하세요</option>");
				$.each(result, function(i,v) {
					 $("#fgLocation").append("<option value='"+v+"'>"+v+"</option>");
	            });
			}
		});
	});
});

$(document).ready(function(){
	$("#fgLocation").change(function() {
		
		$.ajax({
			url : "/findFarmAddress3.do",
			type : "POST",
			header: {
				"dataType" : "json",
			},
			data : {
				"fgDivision" : $("#fgDivision").val(),
				"fgDetailDiv" : $("#fgDetailDiv").val(),
				"fgLocation" : $("#fgLocation").val()
			},
			success : function(result) {
				console.log("성공했음");
				console.log(result);
				$("#fgName").empty();
				$("#fgAddress").empty();
				$("#fgName").append("<option value='미선택'>선택하세요</option>");
				$.each(result, function(i,v) {
					 $("#fgName").append("<option value='"+v+"'>"+v+"</option>");
	            });
			}
		});
	});
});


$(document).ready(function(){
	$("#fgName").change(function() {
		
		$.ajax({
			url : "/findFarmAddress4.do",
			type : "POST",
			header: {
				"dataType" : "json",
			},
			data : {
				"fgDivision" : $("#fgDivision").val(),
				"fgDetailDiv" : $("#fgDetailDiv").val(),
				"fgLocation" : $("#fgLocation").val(),
				"fgName" : $("#fgName").val()
			},
			success : function(result) {
				console.log("성공했음");
				console.log(result);
				$("#fgAddress").empty();
				$("#openMap").empty();
				$("#fgAddress").append("주소:"+result.fgaddress+"<button id=\"openMap\">주소입력하기</button>");
				$("#openMap").click(function() {
					$("#pac-input").val(result.fgaddress);
					
					
					
				});
			}
		});
	});
});



</script>


<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width:80%;
        
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 500px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
    </style>



</head>


<body>
	<h1>농장 위치찾기</h1>

	<select name="fgDivision" id="fgDivision" style="width: 80px;"
		class="select">
		<option value="미선택">선택하세요</option>
		<c:forEach items="${LVL_FGDIVLIST}" var="fgdl">
			<option value="${fgdl}">${fgdl}</option>
		</c:forEach>
	</select> 
	
	<select name="fgDetailDiv" id="fgDetailDiv" style="width: 80px;">
	</select> 
	
	<select name="fgLocation" id="fgLocation" style="width: 80px;">
	</select> 
	
	<select name="fgName" id="fgName" style="width: 80px;">
	</select> 

<h1 id="fgAddress"></h1>

<div align="center">
    <input id="pac-input" class="controls" type="text" value="${LVL_FGDIVLIST}">
    <div id="map"></div>
    </div>

    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.541, lng: 126.986},
          zoom: 13
        });
        var input = /** @type {!HTMLInputElement} */(
            document.getElementById('pac-input'));

        var types = document.getElementById('type-selector');
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
          }));
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);
      }
    </script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcWoUFld3Rko3G3ZORgTT4ZOsTTVw4T8I&libraries=places&callback=initMap"
        async defer></script>
  </body>
</body>
</html>