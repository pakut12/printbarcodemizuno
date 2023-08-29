<%-- 
    Document   : index
    Created on : 25 ม.ค. 2566, 14:11:18
    Author     : pakutsing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@ include file="share/header.jsp" %>
    </head>
    <body>
        
        <%@ include file="share/navbar.jsp" %>
        
        <div class="modal fade" id="modal_editinvoice" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">เเก้ไขข้อมูลที่อยู่ลูกค้า</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="myformeditaddress">
                        <div class="container mt-3">
                            <input type="hidden" class="form-control text-center" name="edit_address_id" id="edit_address_id" readonly>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">ลูกค้า</span>
                                <input type="text" class="form-control text-center" name="edit_address_customer" id="edit_address_customer" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">สถานที่ส่ง</span>
                                <input type="text" class="form-control text-center" name="edit_address_deliveredto" id="edit_address_deliveredto" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">ที่อยู่ 1</span>
                                <input type="text" class="form-control text-center" name="edit_address_address1" id="edit_address_address1" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">ที่อยู่ 2</span>
                                <input type="text" class="form-control text-center" name="edit_address_address2" id="edit_address_address2" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">ที่อยู่ 3</span>
                                <input type="text" class="form-control text-center" name="edit_address_address3" id="edit_address_address3" required>
                            </div>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">ที่อยู่ 4</span>
                                <input type="text" class="form-control text-center" name="edit_address_address4" id="edit_address_address4" required>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ปิด</button>
                        <button type="button" class="btn btn-primary" id="address_save" onclick="update_address()" >บันทึก</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="modal_addinvoice" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <form id="myformaddinvoice" novalidate>
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">เพิ่มข้อมูล Invoice</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="container">
                            <div class="d-flex justify-content-center">
                                <div class="row mt-3 mx-auto ">
                                    <div class="col-sm-12 col-md-12">
                                        
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICENO</span>
                                            <input type="text" class="form-control text-center" name="add_invoiceno" id="add_invoiceno" required>
                                        </div> 
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICEDATE</span>
                                            <input type="date" class="form-control text-center" name="add_invoicedate" id="add_invoicedate" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">SAVEING NO</span>
                                            <input type="text" class="form-control text-center" name="add_saveingno" id="add_saveingno" required>
                                        </div>
                                        
                                    </div>
                                    <hr>
                                    <div class="col-sm-12 col-md-12 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                            <input type="text" class="form-control text-center" name="add_po" id="add_po" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Firstdigit</span>
                                            <input type="text" class="form-control text-center" name="add_firstdigit" id="add_firstdigit" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Startbox</span>
                                            <input type="text" class="form-control text-center" name="add_startbox" id="add_startbox" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Endbox</span>
                                            <input type="text" class="form-control text-center" name="add_endbox" id="add_endbox" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Container no</span>
                                            <input type="text" class="form-control text-center" name="add_containerno" id="add_containerno" required>
                                        </div>
                                        <button type="button" class="btn btn-success btn-sm w-100" id="add_addpo" onclick="addpo()" >เพิ่ม PO</button>
                                    </div>
                                </div> 
                            </div>
                            
                            
                            
                            <div class="row mt-3 mx-auto mb-3">
                                <div class="col-sm-12 col-md-12">
                                    
                                    <table class="table table-sm " id="table_addinvoice">
                                        
                                    </table>
                                    
                                </div>
                            </div> 
                            
                        </div>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ปิด</button>
                            <button type="submit" class="btn btn-primary" id="address_save" >บันทึก</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
        <div class="container mt-5 ">
            
            <div class="card shadow-lg mt-3">
                <div class="card-header">เเสดงข้อมูล INVOICE</div>
                <div class="card-body">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-sm btn-success" id="addinvoice" onclick="$('#modal_addinvoice').modal('show')">เพิ่มข้อมูล</button>
                    </div>
                    <table class="table table-sm" id="table_invoice">
                        
                    </table>
                </div>
            </div>
        </div>
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
           
            const listpo = [];
          
            $( "#myformaddinvoice" ).on( "submit", function( event ) {
              
                if (this.checkValidity() === false) {
                  
                    $("#myformaddinvoice").addClass('was-validated');
                } else {
                    event.preventDefault();
                    addInvoice();
                }
            });
           
            
    
    
    
            /********************************************* ADDPO ************************************************/
            function addInvoice(){
               
                
                $.ajax({
                    type:"POST",
                    url:"Invoice",
                    data:{
                        type:"addinvoice",
                        invoiceno:$("#add_invoiceno").val(),
                        invoicedate:$("#add_invoicedate").val(),
                        saveingno:$("#add_saveingno").val(),
                        po:JSON.stringify(listpo)
                    },
                    success:function(msg){
                        if(msg == "true"){
                            Swal.fire({
                                title:'บันทึก',
                                icon:'success',
                                text:'บันทึกสำเร็จ'
                            })
                        }else{
                            Swal.fire({
                                title:'บันทึก',
                                icon:'error',
                                text:'บันทึกไม่สำเร็จ'
                            })
                        }
                        $('#modal_addinvoice').modal('hide')
                        $('#myformaddinvoice input').val('')
                        listpo.length = 0
                        gettbpo()
                    }
                })
        
        
            }
    
            function delpo(po){
                for (var i = 0; i < listpo.length; i++) {
                    console.log(listpo[i].po)
                    if (listpo[i].po == po) {
                        listpo.splice(i, 1);
                        console.log(listpo)
                        gettbpo()
                                    
                        break;
                        //i--; // Decrement i to recheck the current index after the splice
                    }
                }
            }
    
            function addpo(){
                var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="delpo(\'' + $('#add_po').val() + '\')">ลบ</button>';
               
                
                var objpo = {
                    po:$('#add_po').val(),
                    firstdigit:$('#add_firstdigit').val(),
                    startbox:$('#add_startbox').val(),
                    endbox:$('#add_endbox').val(),
                    containerno:$('#add_containerno').val(),
                    btdel:btndel
                }
                
                const result = listpo.find((em) => {
                    let chk = null; 
                    
                    if($('#add_po').val() == em.po && $('#add_firstdigit').val() == em. firstdigit && $('#add_startbox').val() == em.startbox && $('#add_endbox').val() == em.endbox){
                        chk = true;
                    }else{
                        chk = false;
                    }
            
                    return chk
                });
                
                if(!result){
                    listpo.push(objpo)
                   
                    gettbpo()
                }else{
                    Swal.fire({
                        title:"บันทึก",
                        icon:"error",
                        text:"บันทึกไม่สำเร็จ : มีข้อมูลอยู่เเล้ว"
                    })
                }
                
            }
            
           
            function gettbpo(){
                $("#table_addinvoice").DataTable({
                    destroy: true,
                    data:listpo,
                    columns: [
                        { 
                            title: 'PO',
                            data: "po"
                        },
                        { 
                            title: 'Firstdigit',
                            data: "firstdigit"
                        },
                        { 
                            title: 'Startbox',
                            data: "startbox"
                        },
                        { 
                            title: 'Endbox',
                            data: "endbox"
                        },
                        { 
                            title: 'Container No',
                            data: "containerno"
                        },
                        { 
                            title: 'Del',
                            data: "btdel"
                        },
                    ]
                }) 
            }
            /********************************************* END ADDPO ************************************************/
            
            
            
            
            $(document).ready(function(){
               
                
            })
        </script>
    </body>
</html>
