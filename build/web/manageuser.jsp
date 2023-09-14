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
        <!-- Modal -->
        <div class="modal fade" id="modal_edituser" tabindex="-1" aria-labelledby="modal_adduser" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">เเก้ไขข้อมูลผู้ใช้</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formedituser">
                            <div class="container">
                                <div class="text-center">
                                    <input type="hidden" id="edit_id" name="edit_id" value="">
                                    <div class="mb-3">
                                        <label for="add_user" class="form-label">User</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_user" name="edit_user" >
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_pass" class="form-label">Pass</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_pass" name="edit_pass">
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_status" class="form-label">Status</label>
                                        <select class="form-select form-select-sm text-center" id="edit_status" name="edit_status">
                                            <option value="1">Admin</option>
                                            <option value="2">User</option>
                                            <option value="3">Packing</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_firstname" class="form-label">Firstname</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_firstname" name="edit_firstname">
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_lirstname" class="form-label">Lastname</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_lastname" name="edit_lastname" >
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="updateuser()">Save</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="modal_adduser" tabindex="-1" aria-labelledby="modal_adduser" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">เพิ่มข้อมูลผู้ใช้</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formadduser">
                            <div class="container">
                                <div class="text-center">
                                    <div class="mb-3">
                                        <label for="add_user" class="form-label">User</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_user" name="add_user" >
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_pass" class="form-label">Pass</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_pass" name="add_pass">
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_status" class="form-label">Status</label>
                                        <select class="form-select form-select-sm text-center" id="add_status" name="add_status">
                                            <option value="1">Admin</option>
                                            <option value="2">User</option>
                                            <option value="3">Packing</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_firstname" class="form-label">Firstname</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_firstname" name="add_firstname">
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_lirstname" class="form-label">Lastname</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_lastname" name="add_lastname" >
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="adduser()">Save</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container mt-5">
            <div class="card shadow-lg">
                <div class="card-header">จัดการข้อมูลผู้ใช้</div>
                <div class="card-body">
                    <div class="text-center h2">จัดการข้อมูลผู้ใช้</div>
                    <div class="row">
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-sm btn-success" id="adduser" >เพิ่มข้อมูลผู้ใช้</button>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div id="tableuser">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            function edit_user(id){
                $("#modal_edituser").modal('show')
                $.ajax({
                    type:"post",
                    url:"User",
                    data:{
                        type:"getuserbyid",
                        user_id:id
                    },
                    success:function(msg){
                        var js = JSON.parse(msg)
                        $("#edit_id").val(js.user_id);
                        $("#edit_user").val(js.user_user);
                        $("#edit_pass").val(js.user_pass);
                        $("#edit_status").val(js.user_status);
                        $("#edit_firstname").val(js.user_firstname);
                        $("#edit_lastname").val(js.user_lastname);
                        
                    }
                })
            }
    
            function updateuser(){
                var form = $("#formedituser").serialize();
                form += "&type=edituserbyid";
                
                $.ajax({
                    type:"post",
                    url:"User",
                    data:form,
                    success:function(msg){
                        if(msg == "true"){
                            Swal.fire({
                                title:"เเก้ไข",
                                icon:"success",
                                text:"เเก้ไขสำเร็จ"
                            })
                        }else if(msg == "false"){
                            Swal.fire({
                                title:"เเก้ไข",
                                icon:"error",
                                text:"เเก้ไขไม่สำเร็จ"
                            })
                        }
                        gettableuser()
                        $("#modal_edituser").modal('hide')  
                    }
                })  

            }

            function del_user(id){
            
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
                            type:"post",
                            url:"User",
                            data:{
                                type:"deluser",
                                user_id:id
                            },
                            success:function(msg){
                                if(msg == "true"){
                                    Swal.fire({
                                        title:"ลบ",
                                        icon:"success",
                                        text:"ลบสำเร็จ"
                                    })
                                }else if(msg == "false"){
                                    Swal.fire({
                                        title:"ลบ",
                                        icon:"error",
                                        text:"ลบไม่สำเร็จ"
                                    })
                                }
                                gettableuser()
                       
                          
                            }
                        })  
                    }
                })
        
        
                
            }
            
            function adduser(){
                var form = $("#formadduser").serialize();
                form += "&type=adduser";
                
                $.ajax({
                    type:"post",
                    url:"User",
                    data:form,
                    success:function(msg){
                       
                        if(msg == "true"){
                            Swal.fire({
                                title:"บันทึก",
                                icon:"success",
                                text:"บันทึกสำเร็จ"
                            })
                        }else if(msg == "false"){
                            Swal.fire({
                                title:"บันทึก",
                                icon:"error",
                                text:"บันทึกไม่สำเร็จ"
                            })
                        }
                        gettableuser()
                      
                        $("#modal_adduser").modal('hide')  
                    }
                })
                
            }
                            
            function gettableuser(){
                $.ajax({
                    type:"post",
                    url:"User",
                    data:{
                        type:"gettableuser"
                    },
                    success:function(msg){
                        $("#tableuser").html(msg)
                        $("#mytableuser").DataTable();
                    }
                })
            }
            
            $(document).ready(function() {
                gettableuser()
                
                $("#adduser").click(function(){
                    $("#formadduser")[0].reset()
                    $("#modal_adduser").modal('show')  
                })
                
            });
        </script>
    </body>
</html>