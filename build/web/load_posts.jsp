<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div class="row">
<%
    
    User uuu=(User)session.getAttribute("currentUser");
    //Thread.sleep(1000);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    List<Post> posts=null;
    int cid=Integer.parseInt(request.getParameter("cid"));
    
    if(cid==0)
    {
       posts = d.getAllPosts();
    }
    else
    {
        posts= d.getPostByCatId(cid);
    }
    
    if(posts.size()==0)
    {
        out.println("<h3 class='display-3 text-center'>No post in this category</h3>");
        return;
    }
    for (Post p : posts) {
%>
<div class="col-md-6 mt-2">
    <div class="card">
        
        <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap" style=" max-height: available; max-width: available">
        <div class="card-body">
            
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent()%></p>
            <!--code is shown always in pre tag-->
        </div>
            <div class="card-footer text-center primary-background">
                
                <%
                    LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
                %>
                <a href="#!" onclick="doLike(<%= p.getPid() %>, <%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter<%= p.getPid() %>"><%= ldao.countLikeOnPost(p.getPid()) %></span></i></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
            </div>
        
        
        
        
    </div>
</div>

<%
    }


%>

</div>