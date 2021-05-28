<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>     
<%
		String keyword = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"> 
        
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>검색 결과 : 
		<%=keyword %>
	</h1>
	<button type="button" onclick="find()">결과보기</button>
	<div id="result">
		
	</div>
	
	<script>
	function find(){
		var keyword = "<%=keyword%>";
		$.ajax({
			type: "GET",
			url: "/result.do", 
			data: {keyword : keyword},
			dataType: "json",
			contentType: "application/json; charset:UTF-8",
			error: function(error){
				console.log("error");
			},
			success: function(data){
				$("#result").empty();
				console.log("success");
				console.log(data);
				
				var html = "";
				var item = data.items;
				
				html += '<table class = "table"><thead><tr><th scope="col">영화 제목</th></tr></thead>';
				html += '<tbody>';
				
				
				for(var i in item){
					
					var title = item[i].title;
					var link = item[i].link;
					var image = item[i].image;
					var subtitle = item[i].subtitle;
					var pubDate = item[i].pubDate;
					var director = item[i].director;
					var actor = item[i].actor;
					var userRating = item[i].userRating;
					
					html += '<tr>';
					html += '<td>';
					html += title
					html +=  '</td>';
					html += '<td>' + link + '</td>';
					html += '<td>' + '<img src=' + image + '>' + '</td>';
					html += '<td>' + subtitle + '</td>';
					html += '<td>' + pubDate + '</td>';
					html += '<td>' + director + '</td>';
					html += '<td>' + actor + '</td>';
					html += '<td>' + userRating + '</td>';
					html += '</tr>';
					
					title = "";
					link = "";
					image = "";
					subtitle = "";
					pubDate = "";
					director = "";
					actor = "";
					serRating = "";
				}
				
				html += '</tbody></table>';
				$("#result").append(html);
			}
		});
	}
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>