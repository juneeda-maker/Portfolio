<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns:th="http://www.thymeleaf.org">
 
<head>
    <title>Title</title>
</head>
<body>
    <h1>테스트입니다.</h1>
    <div id="dataArea"></div>
</body>




<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 
<script>
$( document ).ready(function() {
    $.ajax({
        url:'http://localhost:8080/home/list',
        type:'POST',
        data: {
            Name:'ajax',
            Age:'10'
        },
        dataType:'text',
        beforeSend:function(jqXHR) {
            console.log("ajax호출전");
        },
        success: function(data) {
            console.log("호출성공");
            console.log(JSON.parse(data));
            
 
            $("#dataArea").html(data);
        },
        error:function(jqXHR) {
            console.log("실패입니다.");
        }
    });
});
</script>

</html>
 
 



