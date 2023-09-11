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
        <div class="modal fade" id="modal_editship" tabindex="-1" aria-labelledby="modal_addship" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">เเก้ไขข้อมูล SHIP</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formedit">
                            <div class="container">
                                <div class="text-center">
                                    <div class="mb-3">
                                        <label for="edit_shipper" class="form-label">SHIP PER</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_shipper" name="edit_shipper" >
                                    </div>
                                    <div class="mb-3">
                                        <label for="edit_from" class="form-label">FROM</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_from" name="edit_from">
                                    </div>
                                    <div class="mb-3">
                                        <label for="edit_to" class="form-label">TO</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_to" name="edit_to">
                                    </div>
                                    
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="updateship()">Save</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="modal_addship" tabindex="-1" aria-labelledby="modal_addship" aria-hidden="true">
            <form id="formadd" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">เพิ่มข้อมูล SHIP</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="text-center">
                                    <div class="mb-3">
                                        <label for="add_shipper" class="form-label">SHIP PER</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_shipper" name="add_shipper" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_from" class="form-label">FROM</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_from" name="add_from" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="add_to" class="form-label">TO</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_to" name="add_to" required>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Save</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        
        <div class="container mt-5">
            <div class="card shadow-lg">
                <div class="card-header">จัดการข้อมูล SHIP </div>
                <div class="card-body">
                    <div class="text-center h2">จัดการข้อมูล SHIP </div>
                    <div class="row">
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-sm btn-success" id="addship" onclick="btaddship()">เพิ่มข้อมูล SHIP </button>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div id="tableship">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            /******************************* ADD SHIP ***************************/
            
                                
            function btaddship(){
                $('form #formadd').val('')
                $('#modal_addship').modal('show');
            }                      
           
            function addship(){
                $("#formadd").submit(function (event) {
                    var formadd = {
                        type:"addship",
                        shipper:$("#add_shipper").val(),
                        from:$("#add_from").val(),
                        to:$("#add_to").val()
                    }
                    $.ajax({
                        type:"post",
                        url:"Ship",
                        data:formadd ,
                        success:function(msg){
                            if(msg == 'true'){
                                Swal.fire({
                                    icon:'success',
                                    title:'บันทึก',
                                    text:'บันทึกสำเร็จ'
                                })
                            }else if(msg == 'false'){
                                Swal.fire({
                                    icon:'success',
                                    title:'บันทึก',
                                    text:'บันทึกไม่สำเร็จ'
                                })
                            }
                        }
                        
                    })
                    
                    
                    event.preventDefault();
                });
            }
    
            /******************************* END ADD SHIP ***********************/


            $(document).ready(function() {
                addship()
                
            });
        </script>
    </body>
</html>