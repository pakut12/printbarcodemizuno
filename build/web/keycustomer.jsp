<%-- 
    Document   : keydatatobox
    Created on : 16 �.�. 2566, 10:31:11
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
                        <h1 class="modal-title fs-5" id="exampleModalLabel">����</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="myformedit">
                        <div class="modal-body">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">�����١���</span>
                                <input type="text" class="form-control text-center"  id="edit_customer_id" disabled required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">�����١���</span>
                                <input type="text" class="form-control text-center"  id="edit_customer_no"  required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">���ʺ�����</span>
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
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">Description</span>
                                <input type="text" class="form-control text-center" id="edit_customer_description" required>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�Դ</button>
                        <button type="button" class="btn btn-primary" id="edit_save" onclick="update_customer()">�ѹ�֡</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="card shadow-lg">
                <div class="card-header">����������١���</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="card shadow-lg">
                                <div class="card-header">����������</div>
                                <div class="card-body">
                                    <form id="myform">
                                        <div class="row justify-content-center">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">�����١���</span>
                                                    <input type="text" class="form-control text-center" name="customer_no" id="customer_no" required>
                                                </div>
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">���ʺ�����</span>
                                                    <input type="number" class="form-control text-center" name="customer_barcode" id="customer_barcode" required>
                                                </div>
                                                
                                            </div>
                                            <div class="col-sm-12 col-md-6">
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">Color</span>
                                                    <input type="text" class="form-control text-center" name="customer_color" id="customer_color" maxlength="2" required>
                                                </div>
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">Size</span>
                                                    <input type="text" class="form-control text-center" name="customer_barcode" id="customer_size" maxlength="3" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <div class="input-group input-group-sm mb-3">
                                                    <span class="input-group-text" id="inputGroup-sizing-sm">Description</span>
                                                    <input type="text" class="form-control text-center" name="customer_description" id="customer_description" required>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row text-center">
                                        <div class="col-sm-12 col-md-12 ">
                                            <button type="button" class="btn btn-outline-primary btn-sm " onclick="senddata()">�ѹ�֡������</button>
                                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="inputclean()">�����������</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="card shadow-lg">
                                <div class="card-header">�Ѿ��Ŵ������</div>
                                <div class="card-body">
                                    <form id="myformupload">
                                        <div class="row text-end mb-1">
                                            <a href="attachfile/download_master/master.xls"><button type="button" class="btn btn-outline-success btn-sm w-25 " >��Ŵ��� Master</button></a>
                                        </div>
                                        <div class="row justify-content-center mb-3">
                                            <div class="col-sm-12 col-md-8">
                                                <label for="customer_file">File : </label>
                                                <input type="file" class="form-control form-control-sm text-center" name="customer_file" id="customer_file" required>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row text-center">
                                        <div class="col-sm-12 col-md-12 ">
                                            <button type="button" class="btn btn-outline-primary btn-sm " onclick="uploadfile()">�Ѿ��Ŵ������</button>
                                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="inputclean()">�����������</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card shadow-lg mt-3">
                        <div class="card-header">��ʴ�������</div>
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
                        $("#edit_customer_description").val(js.customer_description);
                    }
                })
            }
    
            function inputclean(){
                $("#customer_no").val("")
                $("#customer_barcode").val("")
                $("#customer_color").val("")
                $("#customer_size").val("")
                $("#customer_description").val("")
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
                        customer_size:$("#edit_customer_size").val(),
                        customer_description:$("#edit_customer_description").val()
                    },
                    success:function(msg){
                    
                        var js = JSON.parse(msg);
                        if(js.status == 'true'){
                            Swal.fire({
                                title:"�ѹ�֡",
                                icon:"success",
                                text:"�ѹ�֡�����"
                            })
                        }else if(js.status == 'false'){
                            Swal.fire({
                                title:"�ѹ�֡",
                                icon:"error",
                                text:"�ѹ�֡��������"
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
                    title: '�س��ͧ���ź���������',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '��',
                    cancelButtonText: '�����'
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
                                        title:"ź",
                                        icon:"success",
                                        text:"ź�����"
                                    })
                                }else if(js.status == 'false'){
                                    Swal.fire({
                                        title:"ź",
                                        icon:"error",
                                        text:"ź��������"
                                    })
                                }
                                gettable();
                            }
                        })
                    }
                })
            }
            
            function uploadfile(){
                
                var file = document.getElementById('customer_file').files[0];
                //$("#form_oreder").addClass("was-validated");
                if(file){
                    var formdata = new FormData(); 
                    formdata.append('uploadfile', file);
                    $.ajax({
                        type: "POST",
                        encType: "multipart/form-data",
                        url: "UploadFiles",
                        cache: false,
                        processData: false,
                        contentType: false,
                        data: formdata,
                        success: function(data){
                            var js = JSON.parse(data);
                            if(js.status == 'true'){
                                Swal.fire({
                                    title:"�Ѿ��Ŵ",
                                    icon:"success",
                                    text:"�Ѿ��Ŵ�����"
                                })
                            }else if(js.status == 'false'){
                                Swal.fire({
                                    title:"�Ѿ��Ŵ",
                                    icon:"error",
                                    text:"�Ѿ��Ŵ��������"
                                })
                            }
                            gettable();
                        },
                        error: function(msg){
                            console.log(msg);
                        }
                    });
                }else{
                    Swal.fire({
                        title:"�Դ��Ҵ",
                        text:"��سҡ�͡���������١��ͧ",
                        icon:"error"
                    })
                }
                
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
                var customer_description = $("#customer_description").val()
                $("#myform").addClass("was-validated");
                if(customer_no &&customer_barcode && customer_color && customer_size && customer_description ){
                    
                    $.ajax({
                        type:'post',
                        url:'Customer',
                        data:{
                            type:"addCustomer",
                            customer_no:customer_no,
                            customer_barcode:customer_barcode,
                            customer_color:customer_color,
                            customer_size:customer_size,
                            customer_description:customer_description
                        },
                        success:function(msg){
                            var js = JSON.parse(msg);
                            if(js.status == 'true'){
                                Swal.fire({
                                    title:"����������",
                                    icon:"success",
                                    text:"���������������"
                                })
                            }else if(js.status == 'false'){
                                Swal.fire({
                                    title:"����������",
                                    icon:"succcess",
                                    text:"������������������"
                                })
                            }
                            gettable();
                        }
                    })
                }else{
                    Swal.fire({
                        icon: 'error',
                        title: '�Դ��Ҵ',
                        text: '��سҡ�͡���������١��ͧ'
                    })
                }
            }
    
            $(document).ready(function () {
                gettable();
             
            });
    
        </script>
    </body>
</html>