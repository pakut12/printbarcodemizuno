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
        
        <div class="modal fade" id="modal_viewinvoice" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <form id="myformaddinvoice" novalidate>
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">เเก้ไขข้อมูล Invoice</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="container">
                            <div class="d-flex justify-content-center">
                                <div class="row mt-3 mx-auto ">
                                    <div class="col-sm-12 col-md-12">
                                        
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICENO</span>
                                            <input type="text" class="form-control text-center" name="edit_invoiceno" id="edit_invoiceno" required>
                                        </div> 
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICEDATE</span>
                                            <input type="date" class="form-control text-center" name="edit_invoicedate" id="edit_invoicedate" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">SAVEING NO</span>
                                            <input type="text" class="form-control text-center" name="edit_saveingno" id="edit_saveingno" required>
                                        </div>
                                        
                                    </div>
                                    <hr>
                                    <div class="col-sm-12 col-md-12 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                            <input type="text" class="form-control text-center" name="edit_po" id="edit_po" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Firstdigit</span>
                                            <input type="text" class="form-control text-center" name="edit_firstdigit" id="edit_firstdigit" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Startbox</span>
                                            <input type="text" class="form-control text-center" name="edit_startbox" id="edit_startbox" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Endbox</span>
                                            <input type="text" class="form-control text-center" name="edit_endbox" id="edit_endbox" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Container no</span>
                                            <input type="text" class="form-control text-center" name="edit_containerno" id="edit_containerno" required>
                                        </div>
                                        <button type="button" class="btn btn-success btn-sm w-100" id="edit_addpo" onclick="addpoedit()" >เพิ่ม PO</button>
                                    </div>
                                </div> 
                            </div>
                            
                            <div class="row mt-3 mx-auto mb-3">
                                <div class="col-sm-12 col-md-12">
                                    
                                    <table class="table table-sm  w-100" id="table_editinvoice">
                                        
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
                                    
                                    <table class="table table-sm w-100" id="table_addinvoice">
                                        
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
                    <div class="d-flex justify-content-end mb-3">
                        <button class="btn btn-sm btn-success" id="addinvoice" onclick="btninvoice()">เพิ่มข้อมูล</button>
                    </div>
                    <table class="table table-sm w-100 text-center table-bordered" id="table_invoice">
                        
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
                    addInvoice();
                }
                event.preventDefault();
            });
           
            function gettableinvoice(){
                $("#table_invoice").DataTable({
                    serverSide: true,
                    ajax: {
                        type:"post",
                        url:"Invoice",
                        data:{
                            type:"gettableinvoice" 
                        },
                        dataSrc:function(json){
                            var arr = [];
                            var data = JSON.parse(json.data);
                            
                            $.each(data,function(k,v){
                                
                                var txtgroup = '<div class="container"><div class="d-flex justify-content-between">'
                                txtgroup    += '<div class="">'
                                txtgroup    += 'Invoiceno : '+v.invoiceno+'<br>'
                                txtgroup    += 'Invoicedate : '+v.invoicedate+'<br>'
                                txtgroup    += 'Saveingno : '+v.saveingno+'<br>'
                                txtgroup    += 'Invoice Create : '+v.date_create+'</div>'
                                txtgroup  += '<button class="btn btn-warning btn-sm text-end" type="button" onclick="viewInvoice('+v.invoiceid+')" id="bt_edit">ดูรายละเอียด</button>'
                                txtgroup  += '</div></div>'
                                
                                var result = {
                                    textgroup : txtgroup,
                                    invoiceid : v.invoiceid,
                                    invoiceno : v.invoiceno,
                                    invoicedate :  v.invoicedate,
                                    saveingno :  v.saveingno,
                                    po :  v.po,
                                    firstdigit :  v.firstdigit,
                                    startbox :  v.startbox,
                                    endbox :  v.endbox,
                                    containerno :  v.containerno,
                                    date_create : v.date_create,
                                    btn_edit : '<button class="btn btn-warning btn-sm" type="button" onclick="edit_customer('+v.invoiceid+')" id="bt_edit">เเก้ไข</button>',
                                    btn_del : '<button class="btn btn-danger btn-sm" type="button" onclick="del_customer('+v.invoiceid+')" id="bt_del">ลบ</button>'
                                }
                                arr.push(result);
                             
                            })
                            return arr
                        }
                    },
                    columns: [
                       
                        {
                            title : 'po',
                            data : 'po'
                        },
                        {
                            title:'firstdigit',
                            data : 'firstdigit' 
                        },
                        {
                            title:'startbox',
                            data : 'startbox' 
                        },
                        {
                            title:'endbox',
                            data : 'endbox' 
                        },
                        {
                            title:'containerno',
                            data : 'containerno' 
                        },
                                      
                        
                    ],
                    rowGroup: {
                        dataSrc: 'textgroup'
                    },
                    bDestroy: true
                  
                          
                });
            }
            
         
            /********************************************* EDIT PO ************************************************/
            function viewInvoice(id){
                $('#modal_viewinvoice').modal('show')
                
                $.ajax({
                    type:'post',
                    url:'Invoice',
                    data:{
                        type:'viewinvoice',
                        invoiceid:id
                    },
                    success:function(msg){
                        var js = JSON.parse(msg)
                        var jsdecode = JSON.parse(js.data)
           
                        $("#edit_invoiceno").val(js.invoiceno)
                        $("#edit_invoicedate").val(js.invoicedate)
                        $("#edit_saveingno").val(js.saveingno)
                       
                        listpo.length = 0
                        $.each(jsdecode,function(k,v){
                            
                            var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="delpo(\'' + v.po + '\')">ลบ</button>';
           
                            var objpo = {
                                po:v.po,
                                firstdigit:v.firstdigit,
                                startbox:v.startbox,
                                endbox:v.endbox,
                                containerno:v.containerno,
                                btdel:btndel
                            }
                           
                            listpo.push(objpo);
        
                        })
                        gettbeditpo()
                        console.log(listpo)
                        
                    }
                })
                
            }
           

            function gettbeditpo(){
                $("#table_editinvoice").DataTable({
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


            
            /********************************************* EDIT PO ************************************************/
    
   
            /********************************************* ADDPO ************************************************/
            
            function btninvoice(){
                listpo.length = 0
                $('#modal_addinvoice').modal('show')
                gettbpo()
            }
            
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
         
                $("#add_po").val('')
                $("#add_firstdigit").val('')
                $("#add_startbox").val('')
                $("#add_endbox").val('')
                $("#add_containerno").val('')
        
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
                gettableinvoice()
                
            })
        </script>
    </body>
</html>
