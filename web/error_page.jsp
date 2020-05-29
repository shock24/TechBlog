<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! something went wrong</title>
        
         <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 87%, 70% 100%, 32% 87%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid" height="100">
            <h6 class="display-4">Sorry! something went wrong...</h6>
            <%= exception %>
            <a href="index.jsp" class="primary-background btn-lg text-white mt-3">Home</a>
            
        </div>
    </body>
</html>
