<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"> 
        <!-- Core theme JS-->
        
        <script src="/resources/js/scripts.js"></script>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Bare - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Core theme resources/css (includes Bootstrap)-->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
        <style>
        	.content{
        		margin: 100px;
        		align-content: space-around;
        	}
        	
        </style>
    </head>
    <body>
        <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  		<div class="container-fluid">
    	<a class="navbar-brand" href="/home">movienet</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      	<span class="navbar-toggler-icon"></span>
    	</button>

	    <div class="collapse navbar-collapse" id="navbarColor02">
	      <ul class="navbar-nav me-auto">
	        <li class="nav-item">
	          <a class="nav-link active" href="/home">home
	            <span class="visually-hidden">(current)</span>
	          </a>
        	</li>
        	<li class="nav-item">
	          <a class="nav-link" href="/community/community">????????????</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/customLogin">?????????</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/signup">????????????</a>
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
	      
	      <sec:authorize access="isAnonymous()">
	      	<a href="/customLogin">?????????</a>
	     </sec:authorize>
	     <sec:authorize access="isAuthenticated()">
	      	<a href="/customLogout">????????????</a>
	     </sec:authorize>
	      
	
	    </div>
	  </div>
	</nav>
	<!--  ?????? ??????  -->
	

	
	<div>
		<div  class="content">
			<img src=${image } width="150" height="150" align="left">${context }<p>
		</div> 
		<!-- ????????? -->
		<!-- ?????? -->
		<div class="content">
			<table>
				<tr><td class="fw-bold">${netizen_score }</td></tr>
				<tr><td class="fw-bold">${special_score }</td></tr>
			</table>
		</div>
		<!-- ?????? -->
		<div class="content">
			<table class="table table-striped">
				<tr>
					<th>review</th>
				</tr>
				<c:forEach var="review" items="${review}" varStatus="status">
				<tr>
						<td>review : <c:out value="${review}" /></td>
				</tr>
					</c:forEach>
			</table>
		</div>
	</div>
    </body>
</html>