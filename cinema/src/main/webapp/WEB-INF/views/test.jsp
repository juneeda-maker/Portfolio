<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form action="result">
		<input class="form-control" name="keyword" onKeyUp="find()"
			id="keyword" placeholder="영화 제목" value="" style="width: 300px">
		<button type="submit" class="btn btn-outline-primary" onclick="find()">검색</button>
	</form>
	
	
	<div id="result2"></div>
	
	<script>
		function find(){
			var keyword = $('#keyword').val();
			$.ajax({
				type: "GET",
				url: "/search.do", 
				data: {keyword : keyword},
				dataType: "json",
				contentType: "application/json; charset:UTF-8",
				error: function(error){
					console.log("error");
				},
				success: function(data){
					$("#result2").empty();
					console.log("success");
					console.log(data);
					
					var html = "";
					var item = data.items;
					
					html += '<table class = "table"><thead><tr><th scope="col">영화 제목</th></tr></thead>';
					html += '<tbody>';
					
					
					for(var i in item){
						
						var title = item[i].title;
						
						html += '<tr>';
						html += '<td>';
						html += title;
						html +=  '</td>';
						html += '</tr>';
						
						
						$('#keyword').empty();
						title = "";
					}
					
					html += '</tbody></table>';
					$("#result2").append(html);
				}
			});
		}
		
		
		
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>