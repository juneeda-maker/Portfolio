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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"> 
        
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Core theme resources/css (includes Bootstrap)-->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	
	 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  		<div class="container-fluid">
    	<a class="navbar-brand" href="home">movienet</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      	<span class="navbar-toggler-icon"></span>
    	</button>

	    <div class="collapse navbar-collapse" id="navbarColor02">
	      <ul class="navbar-nav me-auto">
	        <li class="nav-item">
	          <a class="nav-link active" href="home">Home
	            <span class="visually-hidden">(current)</span>
	          </a>
        	</li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Features</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/community/community">커뮤니티</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="signup">회원가입</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="#">Action</a>
	            <a class="dropdown-item" href="#">Another action</a>
	            <a class="dropdown-item" href="#">Something else here</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">Separated link</a>
	          </div>
	        </li>
	      </ul>
	      
	    </div>
	  </div>
	</nav>	
	
	<p class="text-start">검색 결과 : <%=keyword %></p>
	
	
	<div id="result">
		
	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		var keyword = "<%=keyword%>";
		$.ajax({
			type: "GET",
			url: "/result", 
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
					
					var image = item[i].image;
					var subtitle = item[i].subtitle;
					var pubDate = item[i].pubDate;
					var director = item[i].director;
					var actor = item[i].actor;
					var userRating = item[i].userRating;
					var link = item[i].link;
					
					
					
					var link2 = JSON.stringify(link);
					
					$(document).on("click", ".btn", function(){
						var id_check = $(this).attr("id");
						alert(id_check);
						console.log(id_check);
					    $.ajax({
					    	type: 'GET',
					    	dataType: 'json',
							url : 'detail.do',
							data: {link : JSON.stringify(item[id_check].link)}, //여기부터 고쳐야한다 // id는 제대로 가져오나 가져온 id 값을 이용해 올바른 data 전달해야함 
							contentType: 'application/json',
							success: function(data) {
								console.log("data", data);
					            alert("통신성공");
					        },
					        error: function() {
					            console.log("fail");
					        }
						});
					});
					
					/* function send_link()
					{
						$.ajax({
							url : "/detail.do",
							type: "POST",
							data: JSON.stringify(link),
							dataType: "json",
							contentType: "application/json; charset:UTF-8",
							success: function(data) {
					            alert("통신성공");
					        },
					        error: function() {
					            alert("error");
					        }
						});
					} */
					
					
					html += '<tr>';
					html += '<td>' + '<button class = "btn" id =' + i + '>' + title + '</button>' + '</td>';
					html += '<td>' + '<img src=' + image + '>' + '</td>';
					html += '<td>' + subtitle + '</td>';
					html += '<td>' + pubDate + '</td>';
					html += '<td>' + director + '</td>';
					html += '<td>' + actor + '</td>';
					html += '<td>' + userRating + '</td>';
					html += '<td>' + link + '</td>';
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
	});
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>