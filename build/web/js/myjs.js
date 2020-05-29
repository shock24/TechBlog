function doLike(pid, uid)
{
    console.log(pid + "," + uid)
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    }

    $.ajax({
        url: "LikeServlet",
        data: d,
       success: function (data, textStatus, jqXHR) {
            console.log(data);
            //console.log("hi1");
            if (data.trim() == 'true')
            {
//                console.log("hi");
//                console.log(".like-counter"+pid);
//                console.log("hi2");
                let c = $(".like-counter"+pid).html();
                c++;
                $('.like-counter'+pid).html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("error")
        }
    })
}