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
                            <h1 class="modal-title fs-5" id="exampleModalLabel">เเก้ไขข้อมูล Invoice</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="container">
                            <div class="d-flex justify-content-center">
                                <div class="row mt-3 mx-auto ">
                                    <div class="col-sm-12 col-md-12">
                                        <input id="edit_invoiceid" name="edit_invoiceid" type="hidden">
                                        <input id="edit_datecreate" name="edit_datecreate" type="hidden">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICENO</span>
                                            <input type="text" class="form-control text-center" name="edit_invoiceno" id="edit_invoiceno" maxlength="10" required>
                                        </div> 
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICEDATE</span>
                                            <input type="date" class="form-control text-center" name="edit_invoicedate" id="edit_invoicedate" maxlength="10" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">SAVEING NO</span>
                                            <input type="text" class="form-control text-center" name="edit_saveingno" id="edit_saveingno" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <label class="input-group-text" for="edit_customer">CUSTOMER</label>
                                            <select class="form-select text-center" id="edit_customer">
                                                
                                            </select>
                                        </div>
                                        
                                    </div>
                                    <hr>
                                    <div class="col-sm-12 col-md-12 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                            <input type="text" class="form-control text-center" name="edit_po" id="edit_po" maxlength="10">
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Firstdigit</span>
                                            <input type="text" class="form-control text-center" name="edit_firstdigit" id="edit_firstdigit" maxlength="10">
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Startbox</span>
                                            <input type="text" class="form-control text-center" name="edit_startbox" id="edit_startbox" maxlength="10" >
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Endbox</span>
                                            <input type="text" class="form-control text-center" name="edit_endbox" id="edit_endbox" maxlength="10">
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Container no</span>
                                            <input type="text" class="form-control text-center" name="edit_containerno" id="edit_containerno" maxlength="15">
                                        </div>
                                        <button type="button" class="btn btn-success btn-sm w-100" id="edit_addpo" onclick="addeditpo()" >เพิ่ม PO</button>
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
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ปิด</button>
                            <button type="button" class="btn btn-danger" onclick="btdelinvoice()" >ลบ INVOICE</button>
                            <button type="button" class="btn btn-success" onclick="btprintinvoice()" >พิมพ์ INVOICE</button>
                            <button type="button" class="btn btn-primary" onclick="bteditinvoice()" >เเก้ไข INVOICE</button>
                            
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
                                            <input type="text" class="form-control text-center" name="add_invoiceno" id="add_invoiceno" maxlength="10" required>
                                        </div> 
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">INVOICEDATE</span>
                                            <input type="date" class="form-control text-center" name="add_invoicedate" id="add_invoicedate" maxlength="10" required>
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">SAVEING NO</span>
                                            <input type="text" class="form-control text-center" name="add_saveingno" id="add_saveingno" required>
                                        </div>
                                        
                                        <div class="input-group input-group-sm mb-3">
                                            <label class="input-group-text" for="add_customer">CUSTOMER</label>
                                            <select class="form-select text-center" id="add_customer">
                                                
                                            </select>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="col-sm-12 col-md-12 ">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                            <input type="text" class="form-control text-center" name="add_po" id="add_po" maxlength="10" >
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Firstdigit</span>
                                            <input type="text" class="form-control text-center" name="add_firstdigit" id="add_firstdigit" maxlength="10">
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Startbox</span>
                                            <input type="number" class="form-control text-center" name="add_startbox" id="add_startbox" maxlength="10" >
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Endbox</span>
                                            <input type="number" class="form-control text-center" name="add_endbox" id="add_endbox" maxlength="10" >
                                        </div>
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Container no</span>
                                            <input type="text" class="form-control text-center" name="add_containerno" id="add_containerno" maxlength="15" >
                                        </div>
                                        <button type="button" class="btn btn-success btn-sm w-100" id="add_addpo" onclick="addpo()" >เพิ่ม PO</button>
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
        
        
        <div class="container mt-5 ">
            <div class="card shadow-lg mt-3">
                <div class="card-header">ค้นหาข้อมูล INVOICE</div>
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
                                <span class="input-group-text" id="inputGroup-sizing-sm">วันที่</span>
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
                            console.log(data);
                            $.each(data,function(k,v){
                                
                                var txtgroup = '<div class="container"><div class="d-flex justify-content-between">'
                                txtgroup    += '<div class="">'
                                txtgroup    += 'Invoiceno : '+v.invoiceno.toUpperCase()+'<br>'
                                txtgroup    += 'Invoicedate : '+v.invoicedate.toUpperCase()+'<br>'
                                txtgroup    += 'Saveingno : '+v.saveingno.toUpperCase()+'<br>'
                                txtgroup    += 'Invoice Create : '+v.date_create.toUpperCase()+'</div>'
                                
                                txtgroup  += '<button class="btn btn-warning btn-sm text-end" type="button" onclick="viewInvoice('+v.invoiceid.toUpperCase()+')" id="bt_edit">ดูรายละเอียด</button>'
                                
                                txtgroup  += '</div></div>'
                                
                                var result = {
                                    textgroup : txtgroup,
                                    invoiceid : v.invoiceid.toUpperCase(),
                                    invoiceno : v.invoiceno.toUpperCase(),
                                    invoicedate :  v.invoicedate.toUpperCase(),
                                    saveingno :  v.saveingno.toUpperCase(),
                                    po :  v.po.toUpperCase(),
                                    firstdigit :  v.firstdigit.toUpperCase(),
                                    startbox :  v.startbox.toUpperCase(),
                                    endbox :  v.endbox.toUpperCase(),
                                    containerno :  v.containerno.toUpperCase(),
                                    date_create : v.date_create.toUpperCase(),
                                    btn_edit : '<button class="btn btn-warning btn-sm" type="button" onclick="edit_customer('+v.invoiceid.toUpperCase()+')" id="bt_edit">เเก้ไข</button>',
                                    btn_del : '<button class="btn btn-danger btn-sm" type="button" onclick="del_customer('+v.invoiceid.toUpperCase()+')" id="bt_del">ลบ</button>'
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
                    searching: false,
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
                var idinvoice = $("#edit_invoiceid").val().toUpperCase()
           
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
            
            function addeditpo() {
                if ($('#edit_po').val() && $('#edit_firstdigit').val() && $('#edit_startbox').val() && $('#edit_endbox').val() && $('#edit_containerno').val()) {
                   
                    var po = $('#edit_po').val().toUpperCase()
                    var startbox = $('#edit_firstdigit').val().toUpperCase() + $('#edit_startbox').val().toUpperCase()
                    var endbox = $('#edit_firstdigit').val().toUpperCase() + $('#edit_endbox').val().toUpperCase()
                    
                    $.ajax({
                        type: 'post',
                        url: 'PackingList',
                        data: {
                            type: "checkqty",
                            po: $('#edit_po').val().toUpperCase(),
                            firstdigit: $('#edit_firstdigit').val().toUpperCase(),
                            startbox: $('#edit_startbox').val().toUpperCase(),
                            endbox: $('#edit_endbox').val().toUpperCase()
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

                                var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="deleditpo(\'' + $('#edit_po').val() + '\')">ลบ</button>';

                                var objpo = {
                                    po: $('#edit_po').val().toUpperCase(),
                                    firstdigit: $('#edit_firstdigit').val().toUpperCase(),
                                    startbox: $('#edit_startbox').val().toUpperCase(),
                                    endbox: $('#edit_endbox').val().toUpperCase(),
                                    containerno: $('#edit_containerno').val().toUpperCase(),
                                    btdel: btndel
                                }

                                const result = listpo.find((em) => {
                                    let chk = null;

                                    if ($('#edit_po').val().toUpperCase() == em.po && $('#edit_firstdigit').val().toUpperCase() == em.firstdigit && $('#edit_startbox').val().toUpperCase() == em.startbox && $('#edit_endbox').val().toUpperCase() == em.endbox) {
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
                if(listpo.length != 0 && $("#edit_invoiceno").val().toUpperCase() && $("#edit_invoicedate").val().toUpperCase() && $("#edit_saveingno").val().toUpperCase()){
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
               
                $.ajax({
                    type:"POST",
                    url:"Invoice",
                    data:{
                        type:"updateinvoice",
                        invoiceno:$("#edit_invoiceno").val().toUpperCase(),
                        invoicedate:$("#edit_invoicedate").val().toUpperCase(),
                        saveingno:$("#edit_saveingno").val().toUpperCase(),
                        datecreate:$("#edit_datecreate").val().toUpperCase(),
                        id : $("#edit_invoiceid").val().toUpperCase(),
                        customer :$("#edit_customer").val(),
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
                     
                        listpo.length = 0
                        gettbpo()
                        $('#modal_viewinvoice').modal('hide')
                        gettableinvoice()
                    }
                })
        
        
        
            }
    
            function viewInvoice(id){
                $('#modal_viewinvoice').modal('show')
                $("#myformeditinvoice").removeClass('was-validated');
                 
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
           
                        $("#edit_invoiceid").val(js.invoiceid.toUpperCase())
                        $("#edit_invoiceno").val(js.invoiceno.toUpperCase())
                        $("#edit_invoicedate").val(js.invoicedate.toUpperCase())
                        $("#edit_saveingno").val(js.saveingno.toUpperCase())
                        $("#edit_datecreate").val(js.datecreate.toUpperCase())
                        $("#edit_customer").html(js.customer)
        
                        listpo.length = 0
                        $.each(jsdecode,function(k,v){
                            
                            var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="deleditpo(\'' + v.po + '\')">ลบ</button>';
           
                            var objpo = {
                                po:v.po.toUpperCase(),
                                firstdigit:v.firstdigit.toUpperCase(),
                                startbox:v.startbox.toUpperCase(),
                                endbox:v.endbox.toUpperCase(),
                                containerno:v.containerno.toUpperCase(),
                                btdel:btndel
                            }
                           
                            listpo.push(objpo);
        
                        })
                        gettbeditpo()
                        console.log(listpo)
                        
                    }
                })
                
            }
            function deleditpo(po){
                for (var i = 0; i < listpo.length; i++) {
                    console.log(listpo[i].po)
                    if (listpo[i].po == po) {
                        listpo.splice(i, 1);
                        gettbeditpo()
                        break;
                        //i--; // Decrement i to recheck the current index after the splice
                    }
                }
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


            
            
            
    
            /********************************************* END EDIT Invoice ************************************************/
    
    
   
            /********************************************* ADD Invoice ************************************************/
            
            function btsaveinvoice(){
                $("#myformaddinvoice").addClass('was-validated');
                if(listpo.length != 0 && $("#add_invoiceno").val() && $("#add_invoicedate").val() && $("#add_saveingno").val()){
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
                        gettableinvoice()
                        
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
               

                if ($('#add_po').val() && $('#add_firstdigit').val() && $('#add_startbox').val() && $('#add_endbox').val() && $('#add_containerno').val()) {
                    
                    var po = $('#add_po').val().toUpperCase()
                    var startbox = $('#add_firstdigit').val().toUpperCase() + $('#add_startbox').val().toUpperCase()
                    var endbox = $('#add_firstdigit').val().toUpperCase() + $('#add_endbox').val().toUpperCase()
                    
                    $.ajax({
                        type: 'post',
                        url: 'PackingList',
                        data: {
                            type: "checkqty",
                            po: $('#add_po').val().toUpperCase(),
                            firstdigit: $('#add_firstdigit').val().toUpperCase(),
                            startbox: $('#add_startbox').val().toUpperCase(),
                            endbox: $('#add_endbox').val().toUpperCase()
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
                                var btndel = '<button type="button" class="btn btn-danger btn-sm" onclick="delpo(\'' + $('#add_po').val() + '\')">ลบ</button>';
               
                                var objpo = {
                                    po:$('#add_po').val().toUpperCase(),
                                    firstdigit:$('#add_firstdigit').val().toUpperCase(),
                                    startbox:$('#add_startbox').val().toUpperCase(),
                                    endbox:$('#add_endbox').val().toUpperCase(),
                                    containerno:$('#add_containerno').val().toUpperCase(),
                                    btdel:btndel
                                }
                
                                const result = listpo.find((em) => {
                                    let chk = null; 
                    
                                    if($('#add_po').val().toUpperCase() == em.po && $('#add_firstdigit').val().toUpperCase() == em. firstdigit && $('#add_startbox').val().toUpperCase() == em.startbox && $('#add_endbox').val().toUpperCase() == em.endbox){
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
                            title: 'Del',
                            data: "btdel"
                        },
                    ]
                }) 
            }
            /********************************************* END ADD Invoice ************************************************/
            
            
            
            
            $(document).ready(function(){
              
                
            })
        </script>
    </body>
</html>
