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
                    <form id="myformeditinvoice" novalidate>
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">รายละเอียดข้อมูล PackingList</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="container">
                            <div class="d-flex justify-content-center">
                                <div class="row mt-3 mx-auto ">
                                    <div class="col-sm-12 col-md-3">
                                        <input id="edit_user_create" name="edit_user_create" type="hidden">
                                        <input id="edit_invoiceid" name="edit_invoiceid" type="hidden">
                                        <input id="edit_datecreate" name="edit_datecreate" type="hidden">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICENO</span>
                                            <input type="text" class="form-control text-center" name="edit_invoiceno" id="edit_invoiceno" maxlength="10" required>
                                        </div> 
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICEDATE</span>
                                            <input type="date" class="form-control text-center" name="edit_invoicedate" id="edit_invoicedate" maxlength="10" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">SAVING NO</span>
                                            <input type="text" class="form-control text-center" name="edit_saveingno" id="edit_saveingno" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <label class="input-group-text" for="edit_customer">CUSTOMER</label>
                                            <select class="form-select text-center" id="edit_customer">
                                            </select>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="col-sm-12 col-md-12 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">SHIPPER</span>
                                            <input type="text" class="form-control text-center" name="edit_shipper" id="edit_shipper" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">FROM</span>
                                            <input type="text" class="form-control text-center" name="edit_from" id="edit_from" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">TO</span>
                                            <input type="text" class="form-control text-center" name="edit_to" id="edit_to" required>
                                        </div>
                                    </div>
                                    
                                    <hr>   
                                    
                                    <div class="col-sm-12 col-md-3 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                            <input type="text" class="form-control text-center" name="edit_po" id="edit_po" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Firstdigit</span>
                                            <input type="text" class="form-control text-center" name="edit_firstdigit" id="edit_firstdigit" maxlength="10">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Startbox</span>
                                            <input type="text" class="form-control text-center" name="edit_startbox" id="edit_startbox" maxlength="10" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Endbox</span>
                                            <input type="text" class="form-control text-center" name="edit_endbox" id="edit_endbox" maxlength="10">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">FINAL DESTINATION</span>
                                            <input type="text" class="form-control text-center" name="edit_final" id="edit_final" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Container no</span>
                                            <input type="text" class="form-control text-center" name="edit_containerno" id="edit_containerno" maxlength="25">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">MANUFACTURING DATE</span>
                                            <input type="text" class="form-control text-center" name="edit_mfg" id="edit_mfg" maxlength="25">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-12 ">
                                        <input type="hidden" class="form-control text-center" name="edit_id" id="edit_id" >
                                        <div class="col-sm-12 col-md-12 ">
                                            <div class="d-flex justify-content-center">
                                                <button type="button" class="btn btn-success btn-sm  " id="edit_addpo" onclick="addeditpo()" >เพิ่ม PO</button>
                                                <button type="button" class="btn btn-warning btn-sm  mx-3" id="edit_updatepo" onclick="updatepoedit()" disabled>เเก้ไข PO</button>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            
                            <div class="row mt-3 mx-auto mb-3">
                                <div class="col-sm-12 col-md-12">
                                    <table class="table table-sm  w-100 table-bordered" id="table_editinvoice">
                                        
                                    </table>
                                </div>
                            </div> 
                        </div>
                        
                        <div class="modal-footer">
                            <div class="me-auto">
                                <button type="button" class="btn btn-danger "  onclick="btdelinvoice()"  id="btn-delete">ลบ PackingList</button>
                            </div>
                            <button type="button" class="btn btn-dark"  onclick="btloadexcel()"  id="btn-loadpdf">PackingList Excel</button>
                            <button type="button" class="btn btn-dark"  onclick="btloadinvoice()"  id="btn-loadpdf">PackingList PDF</button>
                            <button type="button" class="btn btn-success "  onclick="btprintinvoice()"  id="btn-print">พิมพ์ PackingList</button>
                            <button type="button" class="btn btn-primary " onclick="bteditinvoice()"  id="btn-edit">แก้ไข PackingList</button>
                            <div class="vr"></div>
                            <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">ปิด</button>
                            
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
                            <h1 class="modal-title fs-5" id="exampleModalLabel">เพิ่มข้อมูล PackingList</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="container">
                            <div class="d-flex justify-content-center">
                                <div class="row mt-3 mx-auto ">
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICENO</span>
                                            <input type="text" class="form-control text-center" name="add_invoiceno" id="add_invoiceno" maxlength="10" required>
                                        </div> 
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICEDATE</span>
                                            <input type="date" class="form-control text-center" name="add_invoicedate" id="add_invoicedate" maxlength="10" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">SAVEING NO</span>
                                            <input type="text" class="form-control text-center" name="add_saveingno" id="add_saveingno" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <label class="input-group-text" for="add_customer">CUSTOMER</label>
                                            <select class="form-select text-center" id="add_customer">
                                                
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-12 col-md-12">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">SHIP PER</span>
                                            <input type="text" class="form-control text-center" name="add_shipper" id="add_shipper" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">FROM</span>
                                            <input type="text" class="form-control text-center" name="add_from" id="add_from" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">TO</span>
                                            <input type="text" class="form-control text-center" name="add_to" id="add_to" required>
                                        </div>
                                    </div>
                                    
                                    <hr>
                                    
                                    <div class="col-sm-12 col-md-3 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                            <input type="text" class="form-control text-center" name="add_po" id="add_po" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Firstdigit</span>
                                            <input type="text" class="form-control text-center" name="add_firstdigit" id="add_firstdigit" maxlength="3">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Startbox</span>
                                            <input type="number" class="form-control text-center" name="add_startbox" id="add_startbox" maxlength="10" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Endbox</span>
                                            <input type="number" class="form-control text-center" name="add_endbox" id="add_endbox" maxlength="10" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">FINAL DESTINTION</span>
                                            <input type="text" class="form-control text-center" name="add_final" id="add_final" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Container no</span>
                                            <input type="text" class="form-control text-center" name="add_containerno" id="add_containerno" maxlength="25" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">MANUFACTURING DATE</span>
                                            <input type="text" class="form-control text-center" name="add_mfg" id="add_mfg" maxlength="25">
                                        </div>
                                    </div>
                                    <input type="hidden" class="form-control text-center" name="add_id" id="add_id" >
                                    <div class="col-sm-12 col-md-12 ">
                                        <div class="d-flex justify-content-center">
                                            <button type="button" class="btn btn-success btn-sm  " id="add_addpo" onclick="addpo()" >เพิ่ม PO</button>
                                            <button type="button" class="btn btn-warning btn-sm  mx-3" id="add_updatepo" onclick="updatepoadd()" disabled>เเก้ไข PO</button>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            
                            <div class="row mt-3 mx-auto mb-3">
                                <div class="col-sm-12 col-md-12">
                                    <table class="table table-sm w-100 table-bordered" id="table_addinvoice">
                                    </table>
                                </div>
                            </div> 
                        </div>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ปิด</button>
                            <button type="button" class="btn btn-primary"  onclick="btsaveinvoice()" >บันทึก</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
        <div class="container mt-4 ">
            <div class="text-center h1">
                ข้อมูล PackingList
            </div>
            <div class="card shadow-lg mt-3">
                <div class="card-header">ค้นหาข้อมูล PackingList</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-3">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">INVOICENO</span>
                                <input type="text" class="form-control text-center" name="search_invoiceno" id="search_invoiceno" required>
                            </div> 
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">INVOICEDATE</span>
                                <input type="date" class="form-control text-center" name="search_invoicedate" id="search_invoicedate" required>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">วันที่สร้าง PackingList</span>
                                <input type="date" class="form-control text-center" name="search_saveingno" id="search_datestart" required>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                <input type="date" class="form-control text-center" name="search_saveingno" id="search_dateend" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <button type="button" class="btn btn-primary btn-sm w-100" onclick="gettableinvoice()">ค้นหา</button>
                        </div>
                    </div>
                    
                </div>
            </div>
            
            <div class="card shadow-lg mt-3">
                <div class="card-header">เเสดงข้อมูล PackingList</div>
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
            
           
            /*
            $( "#myformaddinvoice" ).on( "submit", function( event ) {
       
                if (this.checkValidity() === false) {
                    $("#myformaddinvoice").addClass('was-validated');
                } else {
                    addInvoice();
                }
                event.preventDefault();
                
            });
             */
            function btloadexcel(){
                var idinvoice = $("#edit_invoiceid").val().toUpperCase().trim()
                
                $.ajax({
                    type:"POST",
                    url:"Excel",
                    data:{
                        type:"ExcelExport",
                        id:idinvoice
                    },
                    success:function(msg){
                        console.log(msg)
                    }
                })
                
                console.log(idinvoice)
                
            }
           
            function btloadinvoice(){
                 
                var url = "report/packinglistpdf.jsp?id="+$("#edit_invoiceid").val();
                window.open(url)
                
            }
            
            function btprintinvoice(){
                 
                var url = "report/packinglist.jsp?id="+$("#edit_invoiceid").val();
                window.open(url)
                
            }
           
            function gettableinvoice(){
                $("#table_invoice").DataTable({
                    serverSide: true,
                    
                    ajax: {
                        type:"post",
                        url:"Invoice",
                        data:{
                            type:"gettableinvoice",
                            search_invoiceno:$("#search_invoiceno").val(),
                            search_invoicedate:$("#search_invoicedate").val(),
                            search_datestart:$("#search_datestart").val(),
                            search_dateend: $("#search_dateend").val()
                        },
                        dataSrc:function(json){
                            var arr = [];
                            var data = JSON.parse(json.data);
                          
                            $.each(data,function(k,v){
                                console.log(v)
                                var containerno = ""
                                if(v.containerno){
                                    containerno = v.containerno
                                }else{
                                    containerno = ""
                                }
        
                                var result = {
                                    
                                    customer:v.customer,
                                    invoiceid : v.invoiceid.toUpperCase().trim(),
                                    invoiceno : v.invoiceno.toUpperCase().trim(),
                                    invoicedate :  v.invoicedate.toUpperCase().trim(),
                                    date_create : v.date_create.toUpperCase().trim(),
                                    date_modified: v.date_modified.toUpperCase().trim(),
                                    user_create:v.user_create,
                                    user_edit:v.user_edit,
                                    btn_edit : '<button class="btn btn-warning btn-sm text-end" type="button" onclick="viewInvoice('+v.invoiceid.toUpperCase().trim()+')" id="bt_edit">ดูรายละเอียด</button>'
                                   
                                }
                                
                                arr.push(result);
                             
                            })
                            return arr
                        }
                    },
                    columns: [
                       
                        {
                            title : 'invoiceno',
                            data : 'invoiceno'
                        },
                        {
                            title:'invoicedate',
                            data : 'invoicedate' 
                        },
                        {
                            title:'customer',
                            data : 'customer' 
                        },
                       
                        {
                            title:'user_create',
                            data : 'user_create' 
                        },
                        {
                            title:'date_create',
                            data : 'date_create' 
                        },
                        {
                            title:'user_edit',
                            data : 'user_edit' 
                        },
                        {
                            title:'date_modified',
                            data : 'date_modified' 
                        },
                        {
                            title:'view',
                            data : 'btn_edit' 
                        },
                                      
                        
                    ],
                    
                    
                    bDestroy: true
                  
                          
                });
            }
         
            
            /********************************************* DEL Invoice************************************************/
            
            function btdelinvoice(){
                Swal.fire({
                    title: 'คุณต้องการลบใช่หรือไม่',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: 'ไม่',
                    confirmButtonText: 'ใช่'
                }).then((result) => {
                    if (result.isConfirmed) {
                        delinvoice()
                    }
                })
            }
            
            function delinvoice(){
                var idinvoice = $("#edit_invoiceid").val().toUpperCase().trim()
           
                $.ajax({
                    type:"POST",
                    url:"Invoice",
                    data:{
                        type:"delinvoice",
                        id:idinvoice
                    },
                    success:function(msg){
                        if(msg == "true"){
                            Swal.fire({
                                title:'ลบ',
                                icon:'success',
                                text:'ลบสำเร็จ'
                            })
                        }else{
                            Swal.fire({
                                title:'ลบ',
                                icon:'error',
                                text:'ลบไม่สำเร็จ'
                            })
                        } 
                        
                        $('#modal_viewinvoice').modal('hide')
                        gettableinvoice()
                    }
                })
                

    
            }



            /********************************************* DEL Invoice************************************************/

         
            /********************************************* EDIT Invoice************************************************/
            
            
            function updatepoedit(){
                if ($('#edit_po').val() && $('#edit_firstdigit').val() && $('#edit_startbox').val() && $('#edit_endbox').val() ) {
                   
                    var po = $('#edit_po').val().toUpperCase().trim()
                    var startbox = $('#edit_firstdigit').val().toUpperCase().trim() + $('#edit_startbox').val().toUpperCase().trim()
                    var endbox = $('#edit_firstdigit').val().toUpperCase().trim() + $('#edit_endbox').val().toUpperCase().trim()
                    
                    $.ajax({
                        type: 'post',
                        url: 'PackingList',
                        data: {
                            type: "checkqty",
                            po: $('#edit_po').val().toUpperCase().trim(),
                            firstdigit: $('#edit_firstdigit').val().toUpperCase().trim(),
                            startbox: $('#edit_startbox').val().toUpperCase().trim(),
                            endbox: $('#edit_endbox').val().toUpperCase().trim()
                        },
                        success: function (msg) {
                            var js = JSON.parse(msg)

                            if (js.status == "false") {
                                Swal.fire({
                                    title: "บันทึก",
                                    icon: "error",
                                    html: "บันทึกไม่สำเร็จ : PO "+ po+ " "+startbox +" - "+endbox +"<br>มีกล่องที่ยิงไม่ครบ คือ" + js.boxno
                                })
                            } else if (js.status == "true") {
                                var uid = $('#edit_po').val().toUpperCase().trim()+$('#edit_firstdigit').val().toUpperCase().trim()+$('#edit_endbox').val().toUpperCase().trim()
                                var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="deleditpo(\'' + uid + '\')">ลบ</button>';
                                var btedit = '<button type="button" class="btn btn-warning btn-sm" onclick="editgetpobyid(\'' + uid + '\')">เลือก</button>';

                                var containerno = ""
            
                                if($('#edit_containerno').val()){
                                    containerno = $('#edit_containerno').val()
                                }else{
                                    containerno = "";
                                }
           
                                var objpo = {
                                    id:uid,
                                    po: $('#edit_po').val().toUpperCase().trim(),
                                    firstdigit: $('#edit_firstdigit').val().toUpperCase().trim(),
                                    startbox: $('#edit_startbox').val().toUpperCase().trim(),
                                    endbox: $('#edit_endbox').val().toUpperCase().trim(),
                                    containerno: containerno,
                                    mfg:$("#edit_mfg").val(),
                                    btedit:btedit,
                                    btdel: btndel
                                }

                                const result = listpo.find((em) => {
                                    let chk = null;

                                    if ($('#edit_po').val().toUpperCase().trim() == em.po && $('#edit_firstdigit').val().toUpperCase().trim() == em.firstdigit && $('#edit_startbox').val().toUpperCase().trim() == em.startbox && $('#edit_endbox').val().toUpperCase().trim() == em.endbox && $('#edit_containerno').val().toUpperCase().trim() == em.containerno && $('#edit_mfg').val().toUpperCase().trim() == em.mfg) {
                                        chk = true;
                                    } else {
                                        chk = false;
                                    }

                                    return chk
                                });

            
                                if (!result) {
                                    
                                    var uid = $("#edit_id").val()
                                    for (var i = 0; i < listpo.length; i++) {
                                        if (listpo[i].id == uid) {
                                            console.log(listpo[i])
                                            listpo[i].po = $("#edit_po").val()
                                            listpo[i].firstdigit = $("#edit_firstdigit").val()
                                            listpo[i].startbox = $("#edit_startbox").val()
                                            listpo[i].endbox = $("#edit_endbox").val()
                                            listpo[i].containerno = $("#edit_containerno").val()
                                            listpo[i].mfg = $("#edit_mfg").val()
                                            listpo[i].id = uid
                        
                                            gettbeditpo()
                        
                                            Swal.fire({
                                                title:'เเก้ไข PO',
                                                icon:'success',
                                                text:'เเก้ไข PO สำเร็จ'
                                            })
                        
                                            break;
                        
                                        }
                    
                                    } 
                                
                                    gettbeditpo()
                                } else {
                                    Swal.fire({
                                        title: "บันทึก",
                                        icon: "error",
                                        text: "บันทึกไม่สำเร็จ : มีข้อมูลอยู่เเล้ว"
                                    })
                                }
                            } 
                            
                            
                            $("#edit_id").val('')
                            $("#edit_mfg").val('')
                            $("#edit_po").val('')
                            $("#edit_firstdigit").val('')
                            $("#edit_startbox").val('')
                            $("#edit_endbox").val('')
                            $("#edit_containerno").val('')
                        }
                    }); 
                }else {
                    Swal.fire({
                        title: "บันทึก",
                        icon: "error",
                        text: "บันทึกไม่สำเร็จ : กรุณากรอกข้อมูลให้ครบ"
                    })
                }
            
                $("#edit_updatepo").attr("disabled",true)
        
                
                    
            }

            function addeditpo() {
                if ($('#edit_po').val() && $('#edit_firstdigit').val() && $('#edit_startbox').val() && $('#edit_endbox').val() ) {
                   
                    var po = $('#edit_po').val().toUpperCase().trim()
                    var startbox = $('#edit_firstdigit').val().toUpperCase().trim() + $('#edit_startbox').val().toUpperCase().trim()
                    var endbox = $('#edit_firstdigit').val().toUpperCase().trim() + $('#edit_endbox').val().toUpperCase().trim()
                    
                    $.ajax({
                        type: 'post',
                        url: 'PackingList',
                        data: {
                            type: "checkqty",
                            po: $('#edit_po').val().toUpperCase().trim(),
                            firstdigit: $('#edit_firstdigit').val().toUpperCase().trim(),
                            startbox: $('#edit_startbox').val().toUpperCase().trim(),
                            endbox: $('#edit_endbox').val().toUpperCase().trim()
                        },
                        success: function (msg) {
                            var js = JSON.parse(msg)

                            if (js.status == "false") {
                                Swal.fire({
                                    title: "บันทึก",
                                    icon: "error",
                                    html: "บันทึกไม่สำเร็จ : PO "+ po+ " "+startbox +" - "+endbox +"<br>มีกล่องที่ยิงไม่ครบ คือ" + js.boxno
                                })
                            } else if (js.status == "true") {
                                var uid = $('#edit_po').val().toUpperCase().trim()+$('#edit_firstdigit').val().toUpperCase().trim()+$('#edit_endbox').val().toUpperCase().trim()
                                var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="deleditpo(\'' + uid + '\')">ลบ</button>';
                                var btedit = '<button type="button" class="btn btn-warning btn-sm" onclick="editgetpobyid(\'' + uid + '\')">เลือก</button>';

                                var containerno = ""
            
                                if($('#edit_containerno').val()){
                                    containerno = $('#edit_containerno').val()
                                }else{
                                    containerno = "";
                                }
           
                                var objpo = {
                                    id:uid,
                                    po: $('#edit_po').val().toUpperCase().trim(),
                                    firstdigit: $('#edit_firstdigit').val().toUpperCase().trim(),
                                    startbox: $('#edit_startbox').val().toUpperCase().trim(),
                                    endbox: $('#edit_endbox').val().toUpperCase().trim(),
                                    containerno: containerno,
                                    mfg:$("#edit_mfg").val(),
                                    btedit:btedit,
                                    btdel: btndel
                                }

                                const result = listpo.find((em) => {
                                    let chk = null;

                                    if ($('#edit_po').val().toUpperCase().trim() == em.po && $('#edit_firstdigit').val().toUpperCase().trim() == em.firstdigit && $('#edit_startbox').val().toUpperCase().trim() == em.startbox && $('#edit_endbox').val().toUpperCase().trim() == em.endbox) {
                                        chk = true;
                                    } else {
                                        chk = false;
                                    }

                                    return chk
                                });

            
                                if (!result) {
                                    listpo.push(objpo)
                                    gettbeditpo()
                                } else {
                                    Swal.fire({
                                        title: "บันทึก",
                                        icon: "error",
                                        text: "บันทึกไม่สำเร็จ : มีข้อมูลอยู่เเล้ว"
                                    })
                                }
                            } 
                            
                            
                            $("#edit_id").val('')
                            $("#edit_mfg").val('')
                            $("#edit_po").val('')
                            $("#edit_firstdigit").val('')
                            $("#edit_startbox").val('')
                            $("#edit_endbox").val('')
                            $("#edit_containerno").val('')
                        }
                    }); 
                }else {
                    Swal.fire({
                        title: "บันทึก",
                        icon: "error",
                        text: "บันทึกไม่สำเร็จ : กรุณากรอกข้อมูลให้ครบ"
                    })
                }

                
            }
            

            function bteditinvoice(){
                $("#myformeditinvoice").addClass('was-validated');
                if(listpo.length != 0 && $("#edit_invoiceno").val().toUpperCase().trim() && $("#edit_invoicedate").val().toUpperCase().trim() && $("#edit_saveingno").val().toUpperCase().trim() && $("#edit_shipper").val().toUpperCase().trim() && $("#edit_from").val().toUpperCase().trim() && $("#edit_to").val().toUpperCase().trim()){
                    updateInvoice()
                   
                }else{
                    Swal.fire({
                        title:'ผิดพลาด',
                        icon:'error',
                        text:'กรุณากรอกข้อมูลให้ครบ'
                    })
                }
            }
            
            function updateInvoice(){
                
                console.log('SHIP : ' + listpo)
               
                $.ajax({
                    type:"POST",
                    url:"Invoice",
                    data:{
                        type:"updateinvoice",
                        user_create:$("#edit_user_create").val(),
                        invoiceno:$("#edit_invoiceno").val().toUpperCase().trim(),
                        invoicedate:$("#edit_invoicedate").val().toUpperCase().trim(),
                        saveingno:$("#edit_saveingno").val().toUpperCase().trim(),
                        datecreate:$("#edit_datecreate").val().toUpperCase().trim(),
                        id : $("#edit_invoiceid").val().toUpperCase().trim(),
                        customer :$("#edit_customer").val(),
                        shipper:$("#edit_shipper").val(),
                        from:$("#edit_from").val(),
                        to:$("#edit_to").val(),
                        finald:$("#edit_final").val(),
                        po:JSON.stringify(listpo)
                    },
                    success:function(msg){
                        if(msg == "true"){
                            Swal.fire({
                                title:'บันทึก',
                                icon:'success',
                                text:'บันทึกสำเร็จ'
                            })
                        }else if(msg == "falseiv"){
                            Swal.fire({
                                title:'บันทึก',
                                icon:'error',
                                text:'บันทึกไม่สำเร็จ : เลขที่ INVOICE นี้มีอยู่เเล้ว'
                            })
                        }else{
                            Swal.fire({
                                title:'บันทึก',
                                icon:'error',
                                text:'บันทึกไม่สำเร็จ'
                            })
                        }
                     
                        listpo.length = 0
                        gettbpo()
                        $('#modal_viewinvoice').modal('hide')
                        gettableinvoice()
                    }
                })
        
            }
            
            function editgetpobyid(uid){
                $("#edit_updatepo").attr("disabled",false)
                
                for (var i = 0; i < listpo.length; i++) {
                    if (listpo[i].id == uid) {
                        $("#edit_po").val(listpo[i].po)
                        $("#edit_firstdigit").val(listpo[i].firstdigit)
                        $("#edit_startbox").val(listpo[i].startbox)
                        $("#edit_endbox").val(listpo[i].endbox)
                        $("#edit_containerno").val(listpo[i].containerno)
                        $("#edit_mfg").val(listpo[i].mfg)
                        $("#edit_id").val(listpo[i].id)
                    
                        break;
                        //i--; // Decrement i to recheck the current index after the splice
                    }
                }  
                
            }


            function viewInvoice(id){
                $('#modal_viewinvoice').modal('show')
                $("#myformeditinvoice").removeClass('was-validated');
                $("#edit_updatepo").attr("disabled",true)
                 
                $.ajax({
                    type:'post',
                    url:'Invoice',
                    data:{
                        type:'viewinvoice',
                        invoiceid:id
                    },
                    success:function(msg){
                        var js = JSON.parse(msg)
                        console.log(js)
                        var jsdecode = JSON.parse(js.data)
           
                        $("#edit_user_create").val(js.user_create)
                        $("#edit_invoiceid").val(js.invoiceid.toUpperCase().trim())
                        $("#edit_invoiceno").val(js.invoiceno.toUpperCase().trim())
                        $("#edit_invoicedate").val(js.invoicedate.toUpperCase().trim())
                        $("#edit_saveingno").val(js.saveingno.toUpperCase().trim())
                        $("#edit_datecreate").val(js.datecreate.toUpperCase().trim())
                        $("#edit_customer").html(js.customer.toUpperCase().trim())
                        
                        $("#edit_shipper").val(js.shipper)
                        $("#edit_from").val(js.shipfrom)
                        $("#edit_to").val(js.shipto)
                        
                        $("#edit_final").val(js.finald)
                     
                        
                        listpo.length = 0
                       
                        $.each(jsdecode,function(k,v){
                            var uid = v.po.toUpperCase().trim()+v.firstdigit.toUpperCase().trim()+v.startbox.toUpperCase().trim()+v.endbox.toUpperCase().trim()
                            
                            var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="deleditpo(\'' + uid + '\')">ลบ</button>';
                            var btedit = '<button type="button" class="btn btn-warning btn-sm" onclick="editgetpobyid(\'' + uid + '\')">เลือก</button>';
                           
                            var containerno = ""
                            if(v.containerno){
                                containerno = v.containerno
                            }else{
                                containerno = ""
                            }
                            
                            var mfg = "";
                            if(v.mfg){
                                mfg = v.mfg
                            }else{
                                mfg = ""
                            }
                            
                            
                            
                            var objpo = {
                                id:uid,
                                po:v.po.toUpperCase().trim(),
                                firstdigit:v.firstdigit.toUpperCase().trim(),
                                startbox:v.startbox.toUpperCase().trim(),
                                endbox:v.endbox.toUpperCase().trim(),
                                containerno:containerno,
                                mfg:mfg,
                                btdel:btndel,
                                btedit:btedit
                            }
        
                            listpo.push(objpo);
                            uid++
                        })
                        
                        gettbeditpo()
                       
                        
    
                        $("#edit_id").val('')
                        $("#edit_po").val('')
                        $("#edit_firstdigit").val('')
                        $("#edit_startbox").val('')
                        $("#edit_endbox").val('')
                        $("#edit_containerno").val('')
                        $("#edit_mfg").val('')
    
    
                    }
                })
                
            }
            

            function deleditpo(uid){
                for (var i = 0; i < listpo.length; i++) {
                    console.log(listpo[i].id )
                    if (listpo[i].id == uid) {
                        listpo.splice(i, 1);
                        gettbeditpo() 
                        break;
                        //i--; // Decrement i to recheck the current index after the splice
                    }
                }
               
            }

            function gettbeditpo(){
                console.log(listpo)
                $("#table_editinvoice").DataTable({
                    destroy: true,
                    order: [[ 0, 'asc' ], [ 1, 'asc' ], [ 2, 'asc' ]],
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
                            title: 'MFG',
                            data: "mfg"
                        },
                        { 
                            title: 'Edit',
                            data: "btedit"
                        },
                        { 
                            title: 'Del',
                            data: "btdel"
                        },
                    ]
                }) 
            }


    
            /********************************************* END EDIT Invoice ************************************************/
    
    
   
            /********************************************* ADD Invoice ************************************************/
            
            
    
            function updatepoadd(){
                
                if ($('#add_po').val() && $('#add_firstdigit').val() && $('#add_startbox').val() && $('#add_endbox').val() ) {
                    
                    var po = $('#add_po').val().toUpperCase().trim()
                    var startbox = $('#add_firstdigit').val().toUpperCase().trim() + $('#add_startbox').val().toUpperCase().trim()
                    var endbox = $('#add_firstdigit').val().toUpperCase().trim() + $('#add_endbox').val().toUpperCase().trim()
                    
                    $.ajax({
                        type: 'post',
                        url: 'PackingList',
                        data: {
                            type: "checkqty",
                            po: $('#add_po').val().toUpperCase().trim(),
                            firstdigit: $('#add_firstdigit').val().toUpperCase().trim(),
                            startbox: $('#add_startbox').val().toUpperCase().trim(),
                            endbox: $('#add_endbox').val().toUpperCase().trim()
                        },
                        success: function (msg) {
                           
                            var js = JSON.parse(msg)

                            if (js.status == "false") {
                                Swal.fire({
                                    title: "บันทึก",
                                    icon: "error",
                                    text: "บันทึกไม่สำเร็จ : PO "+ po+ " "+startbox +" - "+endbox +"มีกล่องที่ยิงไม่ครบ คือ" + js.boxno
                                })
                            } else if (js.status == "true") {
                                
                
                                const result = listpo.find((em) => {
                                    let chk = null; 
                    
                                    if($('#add_po').val().toUpperCase().trim() == em.po && $('#add_firstdigit').val().toUpperCase().trim() == em. firstdigit && $('#add_startbox').val().toUpperCase().trim() == em.startbox && $('#add_endbox').val().toUpperCase().trim() == em.endbox && $('#add_containerno').val().toUpperCase().trim() == em.containerno && $('#add_mfg').val().toUpperCase().trim() == em.mfg){
                                        chk = true;
                                    }else{
                                        chk = false;
                                    }
            
                                    return chk
                                });
                
                                if(!result){
                                    for (var i = 0; i < listpo.length; i++) {
                                       
                                        if (listpo[i].id == $("#add_id").val()) {
                        
                                            listpo[i].containerno = $("#add_containerno").val() 
                                            listpo[i].endbox = $("#add_endbox").val() 
                                            listpo[i].firstdigit = $("#add_firstdigit").val() 
                                            listpo[i].mfg = $("#add_mfg").val() 
                                            listpo[i].po = $("#add_po").val() 
                                            listpo[i].startbox = $("#add_startbox").val() 
                                            gettbpo()
                                            break;
                                            
                                            Swal.fire({
                                                title:"บันทึก",
                                                icon:"success",
                                                text:"บันทึกสำเร็จ"
                                            })
                        
                                        }
                                    }
                                    
                                    gettbpo()
                                }else{
                                    Swal.fire({
                                        title:"บันทึก",
                                        icon:"error",
                                        text:"บันทึกไม่สำเร็จ : มีข้อมูลอยู่เเล้ว"
                                    })
                                }
                                    
                                $("#add_id").val('')
                                $("#add_po").val('')
                                $("#add_firstdigit").val('')
                                $("#add_startbox").val('')
                                $("#add_endbox").val('')
                                $("#add_containerno").val('')
                                $("#add_mfg").val('')
            
                            }
                        }
                    });
                }else{
                    Swal.fire({
                        title:"บันทึก",
                        icon:"error",
                        text:"บันทึกไม่สำเร็จ : กรุณากรอกข้อมูลให้ครบ"
                    })
            
                }
            
                $("#add_updatepo").attr("disabled",true)
                
            }
    
            function btsaveinvoice(){
               
                $("#myformaddinvoice").addClass('was-validated');
                if(listpo.length != 0 && $("#add_invoiceno").val() && $("#add_invoicedate").val() && $("#add_saveingno").val() && $("#add_shipper").val()  && $("#add_from").val()  && $("#add_to").val() ){
                    addInvoice()
                }else{
                    Swal.fire({
                        title:'ผิดพลาด',
                        icon:'error',
                        text:'กรุณากรอกข้อมูลให้ครบ'
                    })
                }
            }
    
            function btninvoice(){
                listpo.length = 0
                $("#add_updatepo").attr("disabled",true)
                $('#modal_addinvoice').modal('show')
                gettbpo()
                $("#myformaddinvoice").removeClass('was-validated');
                $("#myformaddinvoice input").val("");
                
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:{
                        type:"getlistcustomer"
                    },
                    success:function(msg){
                        $("#add_customer").empty();
                        $("#add_customer").html(msg);
                       
                    }
                })
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
                        customer:$("#add_customer").val(),
                        shipper:$("#add_shipper").val(),
                        from:$("#add_from").val(),
                        to:$("#add_to").val(),
                        addfinal:$("#add_final").val(),
                        po:JSON.stringify(listpo)
                    },
                    success:function(msg){
                        if(msg == "true"){
                            Swal.fire({
                                title:'บันทึก',
                                icon:'success',
                                text:'บันทึกสำเร็จ'
                            })
                        }else if(msg == "falseiv"){
                            Swal.fire({
                                title:'บันทึก',
                                icon:'error',
                                text:'บันทึกไม่สำเร็จ : เลขที่ INVOICE นี้มีอยู่เเล้ว'
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
                        gettableinvoice()
                        
                    }
                })
        
            }
    
            function delpo(uid){
                for (var i = 0; i < listpo.length; i++) {
                    console.log(listpo[i].po)
                    if (listpo[i].id == uid) {
                        listpo.splice(i, 1);
                        gettbpo()  
                        break;
                        //i--; // Decrement i to recheck the current index after the splice
                    }
                }
            }
    
    
            function getpobyid(uid){
                $("#add_updatepo").attr("disabled",false)
               
                
                for (var i = 0; i < listpo.length; i++) {
                  
                    if (listpo[i].id == uid) {
                    
                        $("#add_po").val(listpo[i].po)
                        $("#add_firstdigit").val(listpo[i].firstdigit)
                        $("#add_startbox").val(listpo[i].startbox)
                        $("#add_endbox").val(listpo[i].endbox)
                        $("#add_containerno").val(listpo[i].containerno)
                        $("#add_mfg").val(listpo[i].mfg)
                        $("#add_id").val(listpo[i].id)
                        gettbpo()
                        break;
                        //i--; // Decrement i to recheck the current index after the splice
                    }
                }
                
            }
    
            function addpo(){
               
                if ($('#add_po').val() && $('#add_firstdigit').val() && $('#add_startbox').val() && $('#add_endbox').val() ) {
                    
                    var po = $('#add_po').val().toUpperCase().trim()
                    var startbox = $('#add_firstdigit').val().toUpperCase().trim() + $('#add_startbox').val().toUpperCase().trim()
                    var endbox = $('#add_firstdigit').val().toUpperCase().trim() + $('#add_endbox').val().toUpperCase().trim()
                    
                    $.ajax({
                        type: 'post',
                        url: 'PackingList',
                        data: {
                            type: "checkqty",
                            po: $('#add_po').val().toUpperCase().trim(),
                            firstdigit: $('#add_firstdigit').val().toUpperCase().trim(),
                            startbox: $('#add_startbox').val().toUpperCase().trim(),
                            endbox: $('#add_endbox').val().toUpperCase().trim()
                        },
                        success: function (msg) {
                           
                            var js = JSON.parse(msg)

                            if (js.status == "false") {
                                Swal.fire({
                                    title: "บันทึก",
                                    icon: "error",
                                    text: "บันทึกไม่สำเร็จ : PO "+ po+ " "+startbox +" - "+endbox +"มีกล่องที่ยิงไม่ครบ คือ" + js.boxno
                                })
                            } else if (js.status == "true") {
                                console.log(msg)
                                var uid = $('#add_po').val().toUpperCase().trim()+$('#add_firstdigit').val().toUpperCase().trim()+$('#add_endbox').val().toUpperCase().trim()
                                var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="delpo(\'' + uid + '\')">ลบ</button>';
                                var btnedit = '<button type="button" class="btn btn-warning btn-sm" onclick="getpobyid(\'' + uid + '\')">เลือก</button>';
                                
                                var containerno = ""
                                if(!$('#add_containerno').val()){
                                    containerno = ""
                                }else{
                                    containerno = $('#add_containerno').val()
                                }
                                
                               
                                var objpo = {
                                    id:uid,
                                    po:$('#add_po').val().toUpperCase().trim(),
                                    firstdigit:$('#add_firstdigit').val().toUpperCase().trim(),
                                    startbox:$('#add_startbox').val().toUpperCase().trim(),
                                    endbox:$('#add_endbox').val().toUpperCase().trim(),
                                    containerno:containerno,
                                    mfg:$("#add_mfg").val(),
                                    btdel:btndel,
                                    btnedit:btnedit
                                }
                
                                const result = listpo.find((em) => {
                                    let chk = null; 
                    
                                    if($('#add_po').val().toUpperCase().trim() == em.po && $('#add_firstdigit').val().toUpperCase().trim() == em. firstdigit && $('#add_startbox').val().toUpperCase().trim() == em.startbox && $('#add_endbox').val().toUpperCase().trim() == em.endbox){
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
                                    
                                $("#add_id").val('')
                                $("#add_po").val('')
                                $("#add_firstdigit").val('')
                                $("#add_startbox").val('')
                                $("#add_endbox").val('')
                                $("#add_containerno").val('')
                                $("#add_mfg").val('')
            
                            }
                        }
                    });
                }else{
                    Swal.fire({
                        title:"บันทึก",
                        icon:"error",
                        text:"บันทึกไม่สำเร็จ : กรุณากรอกข้อมูลให้ครบ"
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
                            title: 'MFG',
                            data: "mfg"
                        },
                        { 
                            title: 'Edit',
                            data: "btnedit"
                        },
                        { 
                            title: 'Del',
                            data: "btdel"
                        },
                    ]
                }) 
            }
            
            /********************************************* END ADD Invoice ************************************************/
            
            $(document).ready(function(){
                gettableinvoice()
                
       
            })
        </script>
    </body>
</html>
