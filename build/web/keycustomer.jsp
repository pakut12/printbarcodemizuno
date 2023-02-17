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
    <div class="card shadow-lg">
        <h5 class="card-header">คีย์ข้อมูลลูกค้า</h5>
        <div class="card-body">
            <div class="card shadow-lg">
                <h5 class="card-header">ข้อมูล</h5>
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-sm-12 col-md-5 ">
                            <form id="myform">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">รหัสลูกค้า</span>
                                <input type="text" class="form-control" name="customer_no" id="customer_no">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">รหัสบาร์โค้ด</span>
                                <input type="text" class="form-control" name="customer_barcode" id="customer_barcode">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">Color</span>
                                <input type="text" class="form-control" name="customer_color" id="customer_color" maxlength="2">
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">Size</span>
                                <input type="text" class="form-control" name="customer_size" id="customer_size" maxlength="3">
                            </div>
                            <!-- <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">จำนวนตัว</span>
                                <input type="number" class="form-control" name="customer_quantity" id="customer_quantity" >
                            </div>-->
                        </div>
                        </form>
                    </div>
                    <div class="row text-center">
                        <div class="col-sm-12 col-md-12 ">
                            <button type="button" class="btn btn-outline-primary btn-sm " onclick="senddata()">บันทึกข้อมูล</button>
                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.reload()">เครียร์ข้อมูล</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow-lg mt-3">
                <h5 class="card-header">เเสดงข้อมูล</h5>
                <div class="card-body">
                    <div id="table_customer">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <%@ include file="share/footer.jsp" %>
</footer>
<script>
    function gettable(){
        $.ajax({
            type:'post',
            url:'Customer',
            data:{
                type:"GetTableCustomer"
            },
            success:function(msg){
                $("#table_customer").html(msg);
                $("#mytable").DataTable();
            }
        })
    }
    
    function senddata(){
        var customer_no = $("#customer_no").val()
        var customer_barcode = $("#customer_barcode").val()
        var customer_color = $("#customer_color").val()
        var customer_size = $("#customer_size").val()
        //var customer_quantity = $("#customer_quantity").val()
        
        if(customer_no &&customer_barcode && customer_color && customer_size ){
            
            $.ajax({
                type:'post',
                url:'Customer',
                data:{
                    type:"addCustomer",
                    customer_no:customer_no,
                    customer_barcode:customer_barcode,
                    customer_color:customer_color,
                    customer_size:customer_size
                },
                success:function(msg){
                    console.log(msg)
                }
            })
        }else{
            Swal.fire({
                icon: 'error',
                title: 'ผิดพลาด',
                text: 'กรุณากรอกข้อมูลให้ถูกต้อง'
            })
            
        }
    }
    
    $(document).ready(function () {
        gettable();
    });
    
</script>
</body>
</html>