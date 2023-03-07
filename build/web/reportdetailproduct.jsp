<%-- 
    Document   : keydatatobox
    Created on : 16 ก.พ. 2566, 10:31:11
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
        <%@ include file="share/navbar.jsp" %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            ค้นหา
                        </div>
                        <div class="card-body">
                            <form action="Report" method="post">
                                <input type="hidden" value="getreportproductdetails" id="type" name="type">
                                <div class="row">
                                    <div class="col-sm-12 col-md-4 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">รหัสสินค้า</span>
                                            <input type="text" class="form-control text-center"  name="customer_product" id="customer_product">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4  mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">รหัสลูกค้า</span>
                                            <input type="text" class="form-control text-center"  name="customer_no" id="customer_no" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4  mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">พาเลท</span>
                                            <input type="text" class="form-control text-center"  name="pallet" id="pallet">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                            <input type="text" class="form-control text-center" name="firstdigit" id="firstdigit" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">เบอร์กล่อง</span>
                                            <input type="number" class="form-control text-center" name="start" id="start" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                            <input type="number" class="form-control text-center" name="end" id="end" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="d-flex justify-content-center justify-content-md-start mt-3 mt-md-0">
                                            <button type="submit" class="btn btn-outline-primary btn-sm ">ค้นหา</button>
                                            <button type="button" class="btn btn-outline-danger btn-sm ms-2 " onclick="">ยกเลิกข้อมูล</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow-lg mt-3">
                <div class="card-header">เเสดงข้อมูล</div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-sm-12 col-md-12 text-end">
                            <button class="btn btn-md  btn-outline-primary" id="printbarcode">พิมพ์</button>
                        </div>
                    </div>
                    <div id="mytable">
                        
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            function getdate(){
                var customer_no = $("#customer_no").val();
                var customer_product = $("#customer_product").val();
                var pallet = $("#pallet").val();
                var start = $("#start").val();
                var end = $("#end").val();
                var firstdigit = $("#firstdigit").val();
          
                
                $.ajax({
                    type:'post',
                    url:'Report',
                    data:{
                        type:"getreportproductdetails",
                        customer_no:customer_no,
                        customer_product:customer_product,
                        pallet:pallet,
                        start:start,
                        end:end,
                        firstdigit:firstdigit
                    },
                    success:function(msg){
                        console.log(msg)
                        
                    }
                })
            } 
            
            $(document).ready(function () {
                
            });
        </script>
    </body>
</html>