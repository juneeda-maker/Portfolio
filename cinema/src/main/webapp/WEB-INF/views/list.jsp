<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns:th="http://www.thymeleaf.org">
 
<head>
    <title>Title</title>
</head>
<body>
    <h1>테스트입니다.</h1>
    <div id="display"></div>
    
</body>




<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 
<script>
/*
function resultHtml(data){
	var html = "<table border = '1'>";
	html += "<tr>";
	html += "<th>영화 이름</th>";
	html += "</tr>";

	$.each(data, function(key, value){
		html += "<tr align = 'center'>";
		html += "<td>" + value.movieNm + "</td>";
		html += "</tr>";
	
	});
	
	html += "</table>";
	$("#dataArea").empty();
	$("#dataArea").append(html);
}
*/

$( document ).ready(function() {
    $.ajax({
        url:'http://localhost:8080/home/list',
        type:'POST',
        data: {
            Name:'ajax',
            Age:'10'
        },
        dataType:'json',
        beforeSend:function(jqXHR) {
            console.log("ajax호출전");
        },
        success: function(data) {
            console.log("호출성공");
            resultHtml(data);
            //console.log(JSON.parse(data));
            //resultHtml(data);
            
            
          // for(var i = 0; i < data.boxOfficeResult.dailyBoxOfficeList.length; i++) {
            //	console.log(data.boxOfficeResult.dailyBoxOfficeList.length);
            //	$("#dataArea1").html(data.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
            	
            //	console.log(data.boxOfficeResult.dailyBoxOfficeList[i].movieNm);
            	
            	//$("#dataArea1").html(data.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
            	//$("#dataArea2").html(data.boxOfficeResult.dailyBoxOfficeList[1].movieNm); 
            	//$("#dataArea3").html(data.boxOfficeResult.dailyBoxOfficeList[2].movieNm);
            	//$("#dataArea4").html(data.boxOfficeResult.dailyBoxOfficeList[3].movieNm); 
            	//$("#dataArea5").html(data.boxOfficeResult.dailyBoxOfficeList[4].movieNm); 
            	//$("#dataArea6").html(data.boxOfficeResult.dailyBoxOfficeList[5].movieNm); 
            	//$("#dataArea7").html(data.boxOfficeResult.dailyBoxOfficeList[6].movieNm); 
            	//$("#dataArea8").html(data.boxOfficeResult.dailyBoxOfficeList[7].movieNm); 
            	//$("#dataArea9").html(data.boxOfficeResult.dailyBoxOfficeList[8].movieNm); 
            	//$("#dataArea10").html(data.boxOfficeResult.dailyBoxOfficeList[9].movieNm); 

            }
            
        
        
    });
});

function resultHtml(data)
{
	var html = "<table border = '1'>";
	html += "<tr>";
	html += "<th>영화 제목</th>";
	html += "</tr>";
	
	for(var i = 0; i < data.boxOfficeResult.dailyBoxOfficeList.length; i++){
		html += "<tr align = 'center'>";
		html += "<td>" + data.boxOfficeResult.dailyBoxOfficeList[i].movieNm + "</td>";
		html += "</tr>";
	}
	
	html += "</table>";
	$("#display").empty();
	$("#display").append(html);
	
	
}

</script>


</html>
 
 



