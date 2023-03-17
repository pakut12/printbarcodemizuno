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
        <div class="modal fade" id="modal_editcustomeraddress" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">���䢢����ŷ�������١���</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="myformeditaddress">
                        <div class="container mt-3">
                            <input type="hidden" class="form-control text-center" name="edit_address_id" id="edit_address_id" readonly>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">�١���</span>
                                <input type="text" class="form-control text-center" name="edit_address_customer" id="edit_address_customer" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">ʶҹ�����</span>
                                <input type="text" class="form-control text-center" name="edit_address_deliveredto" id="edit_address_deliveredto" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">������� 1</span>
                                <input type="text" class="form-control text-center" name="edit_address_address1" id="edit_address_address1" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">������� 2</span>
                                <input type="text" class="form-control text-center" name="edit_address_address2" id="edit_address_address2" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">������� 3</span>
                                <input type="text" class="form-control text-center" name="edit_address_address3" id="edit_address_address3" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">������� 4</span>
                                <input type="text" class="form-control text-center" name="edit_address_address4" id="edit_address_address4" required>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�Դ</button>
                        <button type="button" class="btn btn-primary" id="address_save" onclick="update_address()" >�ѹ�֡</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal_addcustomeraddress" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">���������ŷ�������١���</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="myformaddress">
                        <div class="container mt-3">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">�١���</span>
                                <input type="text" class="form-control text-center" name="address_customer" id="address_customer" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">ʶҹ�����</span>
                                <input type="text" class="form-control text-center" name="address_deliveredto" id="address_deliveredto" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">������� 1</span>
                                <input type="text" class="form-control text-center" name="address_address1" id="address_address1" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">������� 2</span>
                                <input type="text" class="form-control text-center" name="address_address2" id="address_address2" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">������� 3</span>
                                <input type="text" class="form-control text-center" name="address_address3" id="address_address3" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">������� 4</span>
                                <input type="text" class="form-control text-center" name="address_address4" id="address_address4" required>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�Դ</button>
                        <button type="button" class="btn btn-primary" id="address_save" onclick="adddataaddress()" >�ѹ�֡</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="card shadow-lg">
                <div class="card-header">�Ѵ��â������١���</div>
                <div class="card-body">
                    <div class="row">
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-sm btn-success" id="adddataaddress">���������ŷ�������١���</button>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div id="tableaddress">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            function update_address(){
                var form = $("#myformeditaddress").serialize();
                form += '&type=updateaddressid';
                   
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:form,
                    success:function(msg){
                        if(msg == 'true'){
                            Swal.fire({
                                title:"����",
                                icon:"success",
                                text:"���������"
                            })
                        }else if(msg == 'false'){
                            Swal.fire({
                                title:"����",
                                icon:"error",
                                text:"������������"
                            })
                        }
                        gettableaddress()
                        $("#modal_editcustomeraddress").modal('hide')
                    }
                })
                 
                 
            }
            
            function del_address(id){
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:{
                        type:"deladdressid",
                        address_id:id
                    },
                    success:function(msg){
                        if(msg == 'true'){
                            Swal.fire({
                                title:"ź",
                                icon:"success",
                                text:"ź�����"
                            })
                        }else if(msg == 'false'){
                            Swal.fire({
                                title:"ź",
                                icon:"error",
                                text:"ź��������"
                            })
                        }
                        gettableaddress()
                    }
                })
            }
            
            function edit_address(id){
                $("#modal_editcustomeraddress").modal('show');
                
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:{
                        type:"getaddressid",
                        address_id:id
                    },
                    success:function(msg){
                        var dejson = JSON.parse(msg)
                        $("#edit_address_id").val(dejson.address_id)
                        $("#edit_address_customer").val(dejson.address_customer)
                        $("#edit_address_deliveredto").val(dejson.address_deliveredto)
                        $("#edit_address_address1").val(dejson.address_address1)
                        $("#edit_address_address2").val(dejson.address_address2)
                        $("#edit_address_address3").val(dejson.address_address3)
                        $("#edit_address_address4").val(dejson.address_address4)
                    }
                })
            }
            
            function gettableaddress(){
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:{
                        type:"gettablearddress"
                    },
                    success:function(msg){
                        $("#tableaddress").html(msg)
                        
                        var groupColumn = 1;
                        var table = $('#mytableaddress').DataTable({
                           
                            scrollX:        true,
                            scrollCollapse: true
                           
                        });
                        new $.fn.dataTable.FixedColumns( table, {
                            rightColumns: 2,
                            leftColumns: 3
                        } );
                        // Order by the grouping
                        
                        
                    }
                })
            }
            
            function adddataaddress(){
                var form = $("#myformaddress").serialize();
                form += '&type=adddataaddress';
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:form,
                    success:function(msg){
                        if(msg == 'true'){
                            Swal.fire({
                                title:"����������",
                                icon:"success",
                                text:"���������"
                            })
                        }else if(msg == 'false'){
                            Swal.fire({
                                title:"����������",
                                icon:"error",
                                text:"������������"
                            })
                        }
                        $("#myformaddress :input").val("")
                        $("#modal_addcustomeraddress").modal('hide')
                        gettableaddress()
                    }
                })
            }
            
            $(document).ready(function() {
                gettableaddress()
                $("#adddataaddress").click(function(){
                    $("#modal_addcustomeraddress").modal('show')
                })
            });
        </script>
    </body>
</html>