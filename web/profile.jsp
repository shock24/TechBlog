<!--https://github.com/LearnCodeWithDurgesh/TechBlog/blob/master/build/web/profile.jsp-->
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>


        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 87%, 70% 100%, 32% 87%, 0 100%, 0 0);
            }
            
            body{
                background: url(img/bg.jfif);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>


        <!--avoiding cache storage-->
        <%            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//works on HTTP 1.1

            response.setHeader("Pragma", "no-cache");//For HTTP 1.0

            response.setHeader("Expires", "0");//For proxy servers
        %>

        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href=""><span class="fa fa-asterisk"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-bell-o"></span>Learn Code with Arpit <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span>Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span>Contacts</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-edit"></span>Post</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-address-book-o fa fa-drivers-license-o"></span><%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-address-book-o fa fa-user-circle-o"></span>Logout</a>
                    </li>

                </ul>

            </div>
        </nav>

        <!--end of navbar-->


        <!--profile update message-->
        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {%>

        <div class="alert <%= msg.getCssClass()%>" role="alert">
            <%= msg.getContent()%>
        </div>

        <% session.removeAttribute("msg");
            }

        %>


        <!--main body of the page-->
        <main>
            <div class="container">
                <!--dividing page into two parts or 4:8 ratio-->
                <div class="row mt-4">
                    <!--first column-->
                    <div class="col-md-4">
                        <!--will show list of categories here-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">All posts</a>
                            <%                                PostDao post = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> allCategories = post.getAllCategories();
                                for (Category cc : allCategories) {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a>

                            <%
                                }
                            %>
                        </div>

                    </div>


                    <!--second column-->
                    <div class="col-md-8" id="post-container">
                        <!--will show posts here-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3>Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">


                        </div>

                    </div>
                </div>



            </div>
        </main>




        <!--end of main body of the page-->

        <!--profile modal-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" style="max-height: 150px; max-width: 200px; border-radius: 50%;" class="img-fluid">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--details-->
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About:</th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%= user.getDateTime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display: none">
                                <h3 class="mt-3">Please Edit Carefully</h3>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data"><!--"enctype" because we are sending image(or audio/video) too -->
                                    <table class="table">
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><input type='email' class='form-control' name='user_email' value='<%= user.getEmail()%>'></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Name:</th>
                                            <td><input type='text' class='form-control' name='user_name' value='<%= user.getName()%>'></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Password:</th>
                                            <td><input type='password' class='form-control' name='user_password' value='<%= user.getPassword()%>'></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About:</th>
                                            <td>   
                                                <textarea rows='4' class='form-control' name='user_about'><%= user.getAbout()%></textarea>
                                            </td> 
                                        </tr>
                                        <tr>
                                            <th scope="row">New Profile Pic:</th>
                                            <td>   
                                                <input type='file' class='form-control' name='image'>
                                            </td> 
                                        </tr>
                                    </table>

                                    <button type='submit'class='btn btn-outline-primary text-center'>Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->


        <!--add post modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">
                        <form action="AddPostServlet" method="POST" id="add-post-form">

                            <div class="form-group">
                                <select class="form-control"  name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> categories = postd.getAllCategories();
                                        for (Category c : categories) {
                                    %> 
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height: 200px"></textarea>
                            </div>

                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter your program(if any)" style="height: 200px"></textarea>
                            </div>

                            <div class="form-control">
                                <label style="font-weight: bold">Select your pic</label>
                                <br>
                                <input type="file" name="pic">
                            </div>
                            <br>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary" id="post-button">Post</button>
                            </div>



                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of add post modal-->


        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>


        <!--register data script-->
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-button').click(function () {
                                        if (editStatus == false)
                                        {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else
                                        {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                        }
                                    });
                                });
        </script>

        <!--now save post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Saved Successfully", "success")
                                        .then((value) => {
                                            window.location = "profile.jsp"
                                        });
                                ;
                            } else
                            {
                                swal("Error", "Oops! something went wrong", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
//                            //error..
                            swal("Error", "Oops! something went wrong", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

        <!--loading posts-->
        <script>
            function getPosts(catId, temp) {
                
                $("#post-container").hide()
                $("#loader").show();
                $(".c-link").removeClass('active')
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass("active")
                    }
                })
            }


            $(document).ready(function (e) {
                let allPostRef=$(".c-link")[0]
                getPosts(0, allPostRef);
            });


        </script>


    </body>
</html>
