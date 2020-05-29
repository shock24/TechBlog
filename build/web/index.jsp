<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>


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

        <!-- navbar(using include directive of jsp)-->
        <%@include file="normal_navbar.jsp" %>


        <!--Extra information modal-->
        <!-- Java Modal -->
        <div class="modal fade" id="extra-info-java" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Java</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div clss="container">

                            Java is one of the most popular and widely used programming language.

                            <p>1. Java has been one of the most popular programming language for many years.</p>
                            <p>2. Java is Object Oriented. However it is not considered as pure object oriented as it provides support for primitive data types (like int, char, etc)</p>
                            <p>3. The Java codes are first compiled into byte code (machine independent code). Then the byte code is run on Java Virtual Machine (JVM) regardless of the underlying architecture.</p>
                            <p>4. Java syntax is similar to C/C++. But Java does not provide low level programming functionalities like pointers. Also, Java codes are always written in the form of classes and objects.</p>
                            <p>5. Java is used in all kind of applications like Mobile Applications (Android is Java based), desktop applications, web applications, client server applications, enterprise applications and many more.</p>
                            <p>6. When compared with C++, Java codes are generally more maintainable because Java does not allow many things which may lead bad/inefficient programming if used incorrectly. For example, non-primitives are always references in Java. So we cannot pass large objects (like we can do in C++) to functions, we always pass references in Java. One more example, since there are no pointers, bad memory access is also not possible.</p>
                            <p>7. When compared with Python, Java kind of fits between C++ and Python. The programs written in Java typically run faster than corresponding Python programs and slower than C++. Like C++, Java does static type checking, but Python does not.</p>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of java modal-->


        <!-- Python Modal -->
        <div class="modal fade" id="extra-info-python" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Python</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div clss="container">
                            <p>Python is currently the most widely used multi-purpose, high-level programming language.</p>
                            <p>Python allows programming in Object-Oriented and Procedural paradigms.</p>
                            <p>Python programs generally are smaller than other programming languages like Java. Programmers have to type relatively less and indentation requirement of the language, makes them readable all the time.</p>
                            <p>Python language is being used by almost all tech-giant companies like – Google, Amazon, Facebook, Instagram, Dropbox, Uber… etc.</p>
                            <p>The biggest strength of Python is huge collection of standard library which can be used for the following –<br>
                                1. Machine Learning<br>
                                2. GUI Applications (like Kivy, Tkinter, PyQt etc. )<br>
                                3. Web frameworks like Django (used by YouTube, Instagram, Dropbox)<br>
                                4. Image processing (like OpenCV, Pillow)<br>
                                5. Web scraping (like Scrapy, BeautifulSoup, Selenium)<br>
                                6. Test frameworks<br>
                                7. Multimedia<br>
                                8. Scientific computing<br>
                                9. Text processing and many more..<br>
                            </p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of python modal-->


        <!-- C++ Modal -->
        <div class="modal fade" id="extra-info-cpp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">C++</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div clss="container">
                            <p>C++ is a general-purpose programming language and widely used nowadays for competitive programming. It has imperative, object-oriented and generic programming features.</p>
                            <p>C++ runs on lots of platform like Windows, Linux, Unix, Mac, etc. Before we start programming with C++. We will need an environment to be set-up on our local computer to compile and run our C++ programs successfully. If you do not want to set up a local environment you can also use online IDEs for compiling your program.</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of C++ modal-->


        <!-- SQL Modal -->
        <div class="modal fade" id="extra-info-sql" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">SQL</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div clss="container">
                            <p>Structured Query Language is a standard Database language which is used to create, maintain and retrieve the relational database. Following are some interesting facts about SQL:-</p>
                            <br>1. SQL is case insensitive. But it is a recommended practice to use keywords (like SELECT, UPDATE, CREATE, etc) in capital letters and use user defined things (liked table name, column name, etc) in small letters.
                            <br>2. We can write comments in SQL using “–” (double hyphen) at the beginning of any line.
                            <br>3. SQL is the programming language for relational databases (explained below) like MySQL, Oracle, Sybase, SQL Server, Postgre, etc. Other non-relational databases (also called NoSQL) databases like MongoDB, DynamoDB, etc do not use SQL
                            <br>4. Although there is an ISO standard for SQL, most of the implementations slightly vary in syntax. So we may encounter queries that work in SQL Server but do not work in MySQL.
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of SQL modal-->


        <!-- C Modal -->
        <div class="modal fade" id="extra-info-c" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">C</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div clss="container">
                            <p>First of all “C” is a programming language. Now what is Programming language? Programming language can be compared to the normal human languages that we use to communicate with each other. Computer is a non-living machine and so obviously is does not understand normal human languages. That’s why such programming languages were developed. Now the twist in the story is, computers does not understand these programming languages either. What these machines can understand is just binary language - The language of Zeros-and-Ones. So when we write any piece of code, compile it, a series of different steps get performed on the computer and the code you written is systematically converted into “Machine Language” - Which a computer can understand.</p>

                            <p>So in short, programming language is just a tool to convey our instructions and commands to the computer.</p>

                            <p>Now another question might be, “Why we developed separate languages for computers, can’t we use our own daily used language?” Well, the answer to this is obviously “No”. Because the single sentence or a word of the language that we use has many different meanings. Just for an example, The word “Foot” has two different meanings, though basically they are same. One is lowest part of the lag below ankle. And another one is often used as a unit to measure distance (in FPS system). But the programming language that has been developed so far, are made extraordinarily precise that only one meaning is there for every code.</p>

                            <p>So that was all about “Programming”. Now programming in “C” just means, you are supposed to use C-Language to write codes and instruct the machine to perform specific tasks. When you say “You are programming something in C” that simply means “You are writing something in C-Language to instruct your computer to perform something”. Now your file on which you are writing this C-Language code is called source file, and generally it has “.c” as extension. When you compile it, a file with “.o” or sometimes “.obj” file is created on (generally) the same location where your “.c” file is saved. That is called the “Object file”. When you run your C program, at the same location, a “.exe” (on Windows OS) is created. Which is called “Executable” file. The file that actually runs is the one having “.exe” extension. After you see “.exe” file, you can independently run that file (by double clicking).</p>

                            <p>And this all process where an object file and then an executable files are created, can be said as your C language code was getting converted into something that a computer can understand. (Actually, this is not just a two step process. There are many other files also created when this process is on. But I don't think it would be necessary mentioning here for now).</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of C modal-->

        <!-- HTML Modal -->
        <div class="modal fade" id="extra-info-html" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">HTML</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div clss="container">
                            <p>
                                HTML stands for Hyper Text Markup Language. It is used to design web pages using markup language. HTML is the combination of Hypertext and Markup language. Hypertext defines the link between the web pages. Markup language is used to define the text document within tag which defines the structure of web pages. This language is used to annotate (make notes for the computer) text so that a machine can understand it and manipulate text accordingly. Most of markup (e.g. HTML) languages are human readable. Language uses tags to define what manipulation has to be done on the text.
                                HTML is a markup language which is used by the browser to manipulate text, images and other content to display it in required format. HTML was created by Tim Berners-Lee in 1991. The first ever version of HTML was HTML 1.0 but the first standard version was HTML 2.0 which was published in 1999.
                            </p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of HTML modal-->


        <!--end of extra information modal-->

        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background  text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to Tech Blog</h3>
                    <p>Welcome to technical blog, world of technology.A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
                    <p>Thousands of different programming languages have been created, and more are being created every year. Many programming languages are written in an imperative form (i.e., as a sequence of operations to perform) while other languages use the declarative form (i.e. the desired result is specified, not how to achieve it).</p>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start! Its Free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
                </div>
            </div>
        </div>

        <!--cards-->
        <div class="container">
            <!-- row1 -->
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.</p>
                            <a href="#!" class="btn primary-background text-white" data-toggle="modal" data-target="#extra-info-java">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Python is a general-purpose interpreted, interactive, object-oriented, and high-level programming language. It supports functional and structured programming methods as well as OOP.</p>
                            <a href="#" class="btn primary-background text-white" data-toggle="modal" data-target="#extra-info-python">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">C++ Programming</h5>
                            <p class="card-text">C++ is an object-oriented (OO) programming language that can be very efficient. It was the first very widely used OOPs language. C++ was very important in the 90s and early 2000s.</p>
                            <a href="#" class="btn primary-background text-white" data-toggle="modal" data-target="#extra-info-cpp">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <!--row2-->
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">SQL</h5>
                            <p class="card-text">SQL is a language to operate databases; it includes database creation, deletion, fetching rows, modifying rows, etc. SQL is an ANSI (American National Standards Institute) standard language, but there are many different versions of the SQL language.</p>
                            <a href="#" class="btn primary-background text-white" data-toggle="modal" data-target="#extra-info-sql">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">C Programming</h5>
                            <p class="card-text">C is a Programming language. It is a middle level language i.e it is a language which works between the machine language and high level languages. It was developed by Dennis Ritchie. You might have heard about the Unix/Linux, basically the foundations of this OS are written in C and Assembly language</p>
                            <a href="#" class="btn primary-background text-white" data-toggle="modal" data-target="#extra-info-c">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">HTML</h5>
                            <p class="card-text">HTML, which stands for HyperText Mark-Up Language, is the language for describing structured documents as well as the language used to create web pages in the Internet.The language is based on an existing, international formatting standard SGML, Standard Generalized Mark-Up Language, which is used for text processing</p>
                            <a href="#" class="btn primary-background text-white" data-toggle="modal" data-target="#extra-info-html">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
