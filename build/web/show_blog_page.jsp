<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>


<%    int postId = Integer.parseInt(request.getParameter("post_id"));

    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 87%, 70% 100%, 32% 87%, 0 100%, 0 0);
            }

            .post-title{
                font-weight: 100;
                font-size: 30px;
            }

            .post-content{
                font-weight: 100;
                font-size: 20px;
            }

            .post-date{
                font-style: italic;
                font-weight: bold;
            }

            .post-user-info{
                font-size: 20px;
            }

            .row-user{
                border: 1px solid blue;
                padding-top: 15px;
            }

            body{
                background: url(img/bg.jfif);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        <!--facebook comment plugin-->
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v7.0"></script>
</head>
<body>
    <!--avoiding cache storage-->
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//works on HTTP 1.1

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
                    <a class="nav-link" href="profile.jsp"><span class="fa fa-bell-o"></span>Learn Code with Arpit <span class="sr-only">(current)</span></a>
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

    <!--main content of the  body-->
    <div class="container my-4">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header primary-background text-white">
                        <h4 class="text-center post-title"><%= p.getpTitle()%></h4>
                    </div>


                    <div class="card-body">
                        <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap" style=" max-height: 300px; max-width: available">

                        <div class="row row-user">
                            <div class="col-md-8">
                                <%
                                    UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                %>
                                <p class="post-user-info"><a href="#!"><%= ud.getUserByUserId(p.getUserId()).getName()%></a> has posted:</p>

                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>

                            </div>
                        </div>


                        <p class="post-content"><%= p.getpContent()%></p>
                        <br>
                        <br>
                        <div class="post-code">
                            <pre><%= p.getpCode()%></pre>
                        </div>
                    </div>


                    <div class="card-footer primary-background">
                        <%
                            LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
                        %>
                        <!--we will send post id and id of the user who is liking it currently-->
                        <a href="#!" onclick="doLike(<%= p.getPid()%>, <%= user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeOnPost(p.getPid())%></span></i></a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
                    </div>

                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:9494/TechBlog/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-numposts="5" data-width=""></div>
                    </div>

                </div>




            </div>


        </div>



    </div>




    <!--end of main content of body-->







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

</body>
</html>
