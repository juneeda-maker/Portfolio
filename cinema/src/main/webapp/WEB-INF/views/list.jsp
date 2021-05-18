<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns:th="http://www.thymeleaf.org">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
 
<head>
		<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Core theme resources/css (includes Bootstrap)-->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
    <title>Title</title>
</head>
<body>
    <div id="display"></div>
</body>

 
<script>
$(document).ready(function() {
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
 
 



