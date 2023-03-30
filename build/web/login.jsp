<%-- 
    Document   : login
    Created on : 28 มี.ค. 2566, 15:17:59
    Author     : pakutsing
--%>

<%@page contentType="text/html" pageEncoding="TIS-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@ include file="share/header.jsp" %>
        
    </head>
    <body>
        <form action="User" method="post">
            <div class="container mt-5">
                <div class="row">
                    <img src="img/mizunoicon.png" style="height: 100px;width: 400px;" class="mx-auto mb-4">
                    <div class="text-center h1">โปรเเกรมพิมพ์บาร์โค้ด TSG</div>
                    <div class="col-12 col-md-6 mx-auto">
                        <div class="card mt-5 shadow">
                            <div class="card-header">
                                Login
                            </div>
                            <div class="card-body">
                                <input type="hidden" id="type" name="type" value="login">
                                <div class="input-group input-group-sm mb-3 ">
                                    <span class="input-group-text" id="txt_user">Username</span>
                                    <input type="text" class="form-control text-center"  id="txt_user" name="txt_user"  required>
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="txt_pass">Password</span>
                                    <input type="password" class="form-control text-center"  id="txt_pass" name="txt_pass"  required>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-sm btn-primary" type="submit">เข้าสู่ระบบ</button>
                                    <button class="btn btn-sm btn-danger ms-1" type="reset">ล้างข้อมูล</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form> 
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        
    </body>
</html>
