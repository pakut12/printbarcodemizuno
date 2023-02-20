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
        <div class="modal fade" id="modal_edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">เเก้ไข</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="myformedit">
                        <div class="modal-body">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">รหัสลูกค้า</span>
                                <input type="text" class="form-control text-center"  id="edit_customer_id" disabled required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">รหัสลูกค้า</span>
                                <input type="text" class="form-control text-center"  id="edit_customer_no"  required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">รหัสบาร์โค้ด</span>
                                <input type="number" class="form-control text-center" id="edit_customer_barcode" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">Color</span>
                                <input type="text" class="form-control text-center"  id="edit_customer_color" maxlength="2" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">Size</span>
                                <input type="text" class="form-control text-center" id="edit_customer_size" maxlength="3" required>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ปิด</button>
                        <button type="button" class="btn btn-primary" id="edit_save" onclick="update_customer()">บันทึก</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="card shadow-lg">
                <h5 class="card-header">คีย์ข้อมูลลูกค้า</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="card shadow-lg">
                                <h5 class="card-header">เพิ่มข้อมูล</h5>
                                <div class="card-body">
                                    <form id="myform">
                                        <div class="row justify-content-center">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">รหัสลูกค้า</span>
                                                    <input type="text" class="form-control" name="customer_no" id="customer_no" required>
                                                </div>
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">รหัสบาร์โค้ด</span>
                                                    <input type="number" class="form-control" name="customer_barcode" id="customer_barcode" required>
                                                </div>
                                                
                                            </div>
                                            <div class="col-sm-12 col-md-6">
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">Color</span>
                                                    <input type="text" class="form-control" name="customer_no" id="customer_color" maxlength="2" required>
                                                </div>
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">Size</span>
                                                    <input type="text" class="form-control" name="customer_barcode" id="customer_size" maxlength="3" required>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </form>
                                    <div class="row text-center">
                                        <div class="col-sm-12 col-md-12 ">
                                            <button type="button" class="btn btn-outline-primary btn-sm " onclick="senddata()">บันทึกข้อมูล</button>
                                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="inputclean()">เครียร์ข้อมูล</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="card shadow-lg">
                                <h5 class="card-header">อัพโหลดข้อมูล</h5>
                                <div class="card-body">
                                    <form id="myformupload">
                                        <div class="row justify-content-end mb-3">
                                            <button type="button" class="btn btn-outline-success btn-sm w-25 " >โหลดไฟล์ Master</button>
                                        </div>
                                        <div class="row justify-content-center mb-3">
                                            <div class="col-sm-12 col-md-8">
                                                <input type="file" class="form-control form-control-sm" name="customer_file" id="customer_file" required>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row text-center">
                                        <div class="col-sm-12 col-md-12 ">
                                            <button type="button" class="btn btn-outline-primary btn-sm " onclick="senddata()">บันทึกข้อมูล</button>
                                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="inputclean()">เครียร์ข้อมูล</button>
                                        </div>
                                    </div>
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
            function edit_customer(id){
                $.ajax({
                    type:'post',
                    url:'Customer',
                    data:{
                        type:"GetCustomerByID",
                        customer_id:id
                    },
                    success:function(msg){
                        var js = JSON.parse(msg);
                        $("#modal_edit").modal('show');
                        $("#edit_customer_id").val(js.customer_id);
                        $("#edit_customer_no").val(js.customer_no);
                        $("#edit_customer_barcode").val(js.customer_barcode);
                        $("#edit_customer_color").val(js.customer_color);
                        $("#edit_customer_size").val(js.customer_size);
                        
                    }
                })
            }
    
            function inputclean(){
                $("#customer_no").val("")
                $("#customer_barcode").val("")
                $("#customer_color").val("")
                $("#customer_size").val("")
            }

            function update_customer(){
                $.ajax({
                    type:'post',
                    url:'Customer',
                    data:{
                        type:"update_customer",
                        customer_id:$("#edit_customer_id").val(),
                        customer_no:$("#edit_customer_no").val(),
                        customer_barcode:$("#edit_customer_barcode").val(),
                        customer_color:$("#edit_customer_color").val(),
                        customer_size:$("#edit_customer_size").val()
                    },
                    success:function(msg){
                    
                        var js = JSON.parse(msg);
                        if(js.status == 'true'){
                            Swal.fire({
                                title:"บันทึก",
                                icon:"success",
                                text:"บันทึกสำเร็จ"
                            })
                        }else if(js.status == 'false'){
                            Swal.fire({
                                title:"บันทึก",
                                icon:"error",
                                text:"บันทึกไม่สำเร็จ"
                            })
                        }
                        gettable();
                        setTimeout(function(){
                            $("#modal_edit").modal('hide');
                        },1000);
                        
                    }
                })
            }
           
            
            function del_customer(id){
                Swal.fire({
                    title: 'คุณต้องการลบใช่หรือไม่',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'ใช่',
                    cancelButtonText: 'ไม่ใช่'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            type:'post',
                            url:'Customer',
                            data:{
                                type:"del_customer",
                                customer_id:id
                            },
                            success:function(msg){
                                var js = JSON.parse(msg);
                                if(js.status == 'true'){
                                    Swal.fire({
                                        title:"ลบ",
                                        icon:"success",
                                        text:"ลบสำเร็จ"
                                    })
                                }else if(js.status == 'false'){
                                    Swal.fire({
                                        title:"ลบ",
                                        icon:"error",
                                        text:"ลบไม่สำเร็จ"
                                    })
                                }
                                gettable();
                            }
                        })
                    }
                })
               
            }
    
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
                $("#myform").addClass("was-validated");
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
                            var js = JSON.parse(msg);
                            if(js.status == 'true'){
                                Swal.fire({
                                    title:"เพิ่มข้อมูล",
                                    icon:"success",
                                    text:"เพิ่มข้อมูลสำเร็จ"
                                })
                            }else if(js.status == 'false'){
                                Swal.fire({
                                    title:"เพิ่มข้อมูล",
                                    icon:"succcess",
                                    text:"เพิ่มข้อมูลไม่สำเร็จ"
                                })
                            }
                            gettable();
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