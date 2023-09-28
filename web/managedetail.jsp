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
        <div class="container mt-4">
            <div class="text-center mb-3 h1">
                เเก้ไข/ลบ ข้อมูลทีล่ะกล่อง
            </div>
            <div class="card">
                <div class="card-header">
                    ค้นหา
                </div>
                <div class="card-body">
                    <form id="myformsearch">
                        <div class="row">
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                    <input type="text" class="form-control text-center" id="posearch">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-2">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                    <select class="form-select form-select-sm text-center" id="firstdigitbefore" >
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่เริ่ม</span>
                                    <input type="number" class="form-control text-center" name="numstart" id="numstart">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="d-flex justify-content-center justify-content-md-start ">
                                    <button type="button" class="btn btn-outline-primary btn-sm w-25 " id="bt_search">ค้นหา</button>
                                    <button class="btn btn-outline-danger btn-sm w-25 mx-3 " type="button" id="bt_reset" onclick="clearinput()">ล้างข้อมูล</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div id="myform"  novalidate>
                <div class="card shadow-lg mt-3">
                    <div class="card-header">คีย์ข้อมูล</div>
                    <div class="card-body">
                        <div class="container">
                            <input id="boxseq" type="hidden">
                            <div class="text-start h5 fw-bold">ข้อมูลผู้สร้างเเละเเก้ไขกล่อง</div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">ผู้สร้าง</span>
                                        <input type="text" class="form-control text-center" name="user_createview" id="user_createview" value="" disabled required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">วันที่สร้าง</span>
                                        <input type="text" class="form-control text-center" name="date_create" id="date_create"  disabled required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">ผู้เเก้ไข</span>
                                        <input type="hidden" class="form-control text-center" name="user_edit" id="user_edit" value="" disabled required>
                                        <input type="text" class="form-control text-center" name="user_editview" id="user_editview" disabled required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">วันที่เเก้ไข</span>
                                        <input type="text" class="form-control text-center" name="date_edit" id="date_edit" disabled required>
                                    </div>
                                </div>
                            </div>
                            <div class="text-start h5 fw-bold">ข้อมูลกล่อง</div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">ลูกค้า</span>
                                        <select class="form-select form-select-sm text-center" id="customer" >
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4 align-items-md-center">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">สถานที่ส่ง</span>
                                        <select class="form-select form-select-sm text-center" id="customer_address" >
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">ปลายทาง</span>
                                        <select class="form-select form-select-sm text-center" id="destination" >
                                            
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">จำนวนตัวต่อกล่อง</span>
                                        <input type="number" class="form-control text-center" name="quantity_box" id="quantity_box"  required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                        <input type="text" class="form-control text-center" name="firstdigit" id="firstdigit" maxlength="3"  required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่เริ่ม</span>
                                        <input type="text" class="form-control text-center" name="boxno" id="boxno" required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่สุดท้าย</span>
                                        <input type="text" class="form-control text-center" name="boxall" id="boxall"  required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                        <input type="text" class="form-control text-center" name="po" id="po" required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">PO เดิม</span>
                                        <input type="text" class="form-control text-center" name="pobefore" id="pobefore" disabled required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">PROD.ORDER</span>
                                        <input type="text" class="form-control text-center" name="prodorder" id="prodorder" required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">พาเลท</span>
                                        <input type="text" class="form-control text-center" name="pallet" id="pallet" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-2">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">G.W</span>
                                        <input type="text" class="form-control text-center" name="gw" id="gw" required>
                                        <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-2">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">N.W</span>
                                        <input type="text" class="form-control text-center" name="nw" id="nw" disabled required>
                                        <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-5">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Description</span>
                                        <input type="text" class="form-control text-center" name="description" id="description" required>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Country of Origin</span>
                                        <input type="text" class="form-control text-center" name="country" id="country" value="THAILAND" disabled required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <div class="row">
                                        <div class="text-center fw-bold">รหัสลูกค้า</div>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center" id="customer1_id" >
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer2_id" >
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer3_id" >
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center" id="customer4_id" >
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="text-center fw-bold">รหัสบาร์โค้ด</div>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer1_barcode" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer2_barcode" readonly >
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer3_barcode" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer4_barcode" readonly >
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="text-center fw-bold">Color</div>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center" id="customer1_color" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer2_color" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer3_color" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center" id="customer4_color" readonly>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="text-center fw-bold">Size</div>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer1_size" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer2_size" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer3_size" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer4_size" readonly>
                                    </div>
                                </div>
                                
                                <div class="col">
                                    <div class="row ">
                                        <div class="text-center fw-bold">จำนวนตัว</div>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center" id="customer1_number" onkeypress="return isNumberKey(event)">
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer2_number" onkeypress="return isNumberKey(event)">
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer3_number" onkeypress="return isNumberKey(event)">
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer4_number" onkeypress="return isNumberKey(event)">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-12 text-center">
                                    <button class="btn btn-outline-success btn-sm mx-3 mb-3" type="button" id="bt_sava" onclick="updatedata()">เเก้ไขข้อมูล</button>
                                    <button class="btn btn-outline-danger btn-sm  mb-3" type="button" id="bt_del" onclick="deletedata()">ลบข้อมูล</button>
                                </div>
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
            function getfirstdigit(){
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"getfirstdigit",
                        po:$("#posearch").val()
                    },
                    success:function(msg){
                        $("#firstdigitbefore").html(msg)
                    }
                })
                
            }
            function isNumberKey(evt){
                var charCode = (evt.which) ? evt.which : evt.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
            
            
            function today(){
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
             
                var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var yyyy = today.getFullYear();
                today = yyyy + '-' + mm + '-' + dd;
                $("#date").val(today)
            }
            
            function chack_customer1(customer_id){
                $.ajax({
                    type:'post',
                    url:'Customer',
                    data:{
                        type:"chack_customer",
                        customer_id:customer_id.toUpperCase()
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer1_barcode").val(js.customer_barcode)
                            $("#customer1_color").val(js.customer_color)
                            $("#customer1_size").val(js.customer_size)
                            $("#description").val("");
                            $("#description").val(js.customer_description)
                            $("#customer1_number").val($("#quantity_box").val())
                        }else{
                            $("#description").val("")
                            $("#customer1_barcode").val("")
                            $("#customer1_color").val("")
                            $("#customer1_size").val("")
                            $("#customer1_number").val("")
                        }
                    }
                })
            }
            function chack_customer2(customer_id){
                $.ajax({
                    type:'post',
                    url:'Customer',
                    data:{
                        type:"chack_customer",
                        customer_id:customer_id.toUpperCase()
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer2_barcode").val(js.customer_barcode)
                            $("#customer2_color").val(js.customer_color)
                            $("#customer2_size").val(js.customer_size)
                            $("#customer2_description").val(js.customer_description)
                            $("#customer2_number").val($("#quantity_box").val())
                        }else{
                            $("#customer2_description").val("")
                            $("#customer2_barcode").val("")
                            $("#customer2_color").val("")
                            $("#customer2_size").val("")
                            $("#customer2_number").val("")
                        }
                    }
                })
            }
            function chack_customer3(customer_id){
                $.ajax({
                    type:'post',
                    url:'Customer',
                    data:{
                        type:"chack_customer",
                        customer_id:customer_id.toUpperCase()
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer3_barcode").val(js.customer_barcode)
                            $("#customer3_color").val(js.customer_color)
                            $("#customer3_size").val(js.customer_size)
                            $("#customer3_description").val(js.customer_description)
                            $("#customer3_number").val($("#quantity_box").val())
                        }else{
                            $("#customer3_description").val("")
                            $("#customer3_barcode").val("")
                            $("#customer3_color").val("")
                            $("#customer3_size").val("")
                            $("#customer3_number").val("")
                        }
                    }
                })
            }
            function chack_customer4(customer_id){
                $.ajax({
                    type:'post',
                    url:'Customer',
                    data:{
                        type:"chack_customer",
                        customer_id:customer_id.toUpperCase()
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer4_barcode").val(js.customer_barcode)
                            $("#customer4_color").val(js.customer_color)
                            $("#customer4_size").val(js.customer_size)
                            $("#customer4_description").val(js.customer_description)
                            $("#customer4_number").val($("#quantity_box").val())
                        }else{
                            $("#customer4_description").val("")
                            $("#customer4_barcode").val("")
                            $("#customer4_color").val("")
                            $("#customer4_size").val("")
                            $("#customer4_number").val("")
                        }
                    }
                })
            }
            
            function updatedata(){
                var user_edit = $("#user_edit").val()
                var pobefore = $("#posearch").val().toUpperCase();
                var startboxbefore  = $("#firstdigitbefore").val()+$("#numstart").val().toUpperCase();
                var po_old = $("#pobefore").val().toUpperCase();
                var boxno = $("#firstdigit").val()+$("#boxno").val().toUpperCase();
               
                var shipto = $("#customer").val().toUpperCase();
                var customer_address = $("#customer_address").val().toUpperCase();
                var qtyperbox  = $("#quantity_box").val().toUpperCase();
                var allbox  =   $("#firstdigit").val()+$("#boxall").val().toUpperCase();    
                var po =  $("#po").val().toUpperCase();
                var desctxt = $("#description").val().toUpperCase();
                var grossweight = $("#gw").val().toUpperCase();
                var netweight  = $("#nw").val().toUpperCase();
                var country_origin  = $("#country").val().toUpperCase();
                        
                var sku_item1  = $("#customer1_id").val().toUpperCase();
                var upc_code1  =  $("#customer1_barcode").val().toUpperCase();
                var colorno1  =  $("#customer1_color").val().toUpperCase();
                var sizeno1  =  $("#customer1_size").val().toUpperCase();
                var qty1  =  $("#customer1_number").val().toUpperCase();

                var sku_item2 =  $("#customer2_id").val().toUpperCase();
                var upc_code2  = $("#customer2_barcode").val().toUpperCase();
                var colorno2  =  $("#customer2_color").val().toUpperCase();
                var sizeno2   =  $("#customer2_size").val().toUpperCase();
                var qty2  =  $("#customer2_number").val().toUpperCase();
                        
                var sku_item3  =  $("#customer3_id").val().toUpperCase();
                var upc_code3 =  $("#customer3_barcode").val().toUpperCase();
                var colorno3 =  $("#customer3_color").val().toUpperCase();
                var sizeno3  =  $("#customer3_size").val().toUpperCase();
                var qty3   =  $("#customer3_number").val().toUpperCase();
                        
                var sku_item4  = $("#customer4_id").val().toUpperCase();
                var upc_code4  = $("#customer4_barcode").val().toUpperCase();
                var colorno4 =  $("#customer4_color").val().toUpperCase();
                var sizeno4  =  $("#customer4_size").val().toUpperCase();
                var qty4  = $("#customer4_number").val().toUpperCase();
                
                var pallet  =  $("#pallet").val().toUpperCase();
                var prodorder  = $("#prodorder").val().toUpperCase();
                var destination  = $("#destination").val().toUpperCase();
                
                if(po){
                    po =  $("#po").val().toUpperCase();
                }else{
                    po =  $("#posearch").val().toUpperCase();
                }
                var date = new Date().format('d-m-Y H:i:s');
         
                var num1 = $("#customer1_number").val().toUpperCase()
                var num2 = $("#customer2_number").val().toUpperCase()
                var num3 = $("#customer3_number").val().toUpperCase()
                var num4 = $("#customer4_number").val().toUpperCase()
                if(!num1){
                    num1=0;
                }
                if(!num2){
                    num2=0;
                }
                if(!num3){
                    num3=0;
                }
                if(!num4){
                    num4=0;
                }
                
                if(po != pobefore ){
                    po_old = pobefore
                }
                
                var sumqty_result = parseInt(num1)+parseInt(num2)+parseInt(num3)+parseInt(num4)
        
                var invoiceno = $("#invoiceno").val();
                var invoicedate = $("#invoicedate").val();
                var boxseq = $("#boxseq").val();
                
        
        
        
        
                if(sumqty_result <= parseInt($("#quantity_box").val())  && grossweight && country_origin){
                    $.ajax({
                        type:"post",
                        url:"Detail",
                        data:{
                            type:"updatedetails",
                            pobefore:pobefore,
                            startboxbefore:startboxbefore,
                            shipto:shipto,
                            qtyperbox:qtyperbox,
                            allbox:allbox,
                            po:po,
                            desctxt:desctxt,
                            grossweight:grossweight,
                            netweight:netweight,
                            country_origin:country_origin,
                            sku_item1:sku_item1,
                            upc_code1:upc_code1,
                            colorno1:colorno1,
                            sizeno1:sizeno1,
                            qty1:qty1,
                            sku_item2:sku_item2,
                            upc_code2:upc_code2,
                            colorno2:colorno2,
                            sizeno2:sizeno2,
                            qty2:qty2,
                            sku_item3:sku_item3,
                            upc_code3: upc_code3,
                            colorno3:colorno3,
                            sizeno3:sizeno3,
                            qty3: qty3,
                            sku_item4:sku_item4,
                            upc_code4:upc_code4,
                            colorno4:colorno4,
                            sizeno4:sizeno4,
                            qty4:qty4,
                            boxno:boxno,
                            pallet:pallet,
                            prodorder:prodorder,
                            destination:destination,
                            date:date,
                            po_old:po_old,
                            customer_address:customer_address,
                            invoiceno:invoiceno,
                            invoicedate:invoicedate,
                            user_edit:user_edit
                        },
                        success:function(msg){
                           
                            if(msg){
                                var js = JSON.parse(msg);
                                if(js.status == "true"){
                                    Swal.fire({
                                        title:"เเก้ไข",
                                        icon:"success",
                                        text:"เเก้ไขสำเร็จ"
                                    })
                                }else if(js.status == "false"){
                                    Swal.fire({
                                        title:"เเก้ไข",
                                        icon:"error",
                                        text:"เเก้ไขไม่สำเร็จ"
                                    })
                                }
                       
                            }else{
                                Swal.fire({
                                    title:"เเก้ไข",
                                    icon:"error",
                                    text:"เเก้ไขไม่สำเร็จ"
                                })
                      
                            }
                            $("#myform").removeClass('was-validated')
                        }
                    })
                     clearinput()
                }else{
                    Swal.fire({
                        icon: 'error',
                        title: 'ผิดพลาด',
                        html: 'จำนวนตัวรวมไม่เท่ากับจำนวนตัวต่อกล่อง<br>หรือกรองข้อมูลไม่ถูกต้องกรุณาตรวจสอบอีกครั้ง'
                    })
                    
                   $("#myform").addClass('was-validated')
                }
               
            }
            
          
            function clearinput(){
                $("#myform :input").val('');
                $("#myform :input").attr("disabled", true);
                $("#myformsearch :input").val('')
                
            }
            
            function getcustomer(){
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:{
                        type:"getlistcustomer"
                    },
                    success:function(msg){
                      
                        //$("#customer").empty();
                        $("#customer").append(msg);
                        getcustomeraddress($("#customer").val())
                    }
                })
            }
            
            function getcustomeraddress(address_customer){
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:{
                        type:"getdelivery",
                        address_customer:address_customer
                    },
                    success:function(msg){
                  
                        //$("#customer_address").empty();
                        $("#customer_address").append(msg);
                    }
                })
            }
            
            function searchpo(){
                var posearch = $("#posearch").val();
                var numstart = $("#numstart").val();
                var firstdigitbefore = $("#firstdigitbefore").val();
                
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"getdetails",
                        posearch:posearch,
                        numstart:firstdigitbefore+numstart
                    },
                    success:function(msg){
                        $("#po").val("");
                        if(msg){  
                            today()
                            var js = JSON.parse(msg);
                            
                            var startbox = parseInt(js.boxno.match(/\d+/)[0]);
                            var endbox = parseInt(js.boxall.match(/\d+/)[0]);
                            var firstdigit = js.boxall.match(/[a-zA-Z]+/)[0];

                            var shipto = js.shipto;
                            var customer_address = js.customer_address;           
            
                            $("#customer").empty()
                            $("#customer").append("<option value='"+ shipto+"'>"+ shipto+"</option>");
                            
                            $("#customer_address").empty()
                            $("#customer_address").append("<option value='"+ customer_address+"'>"+ customer_address+"</option>");
            
                            getcustomer()
                        
                            if(js.destination == "ADC"){
                                $("#destination").empty();
                                $("#destination").append("<option value='ADC'>ADC</option><option value='ODC'>ODC</option><option value='SCCR'>SCCR</option>");
                            }else if(js.destination == "ODC"){
                                $("#destination").empty();
                                $("#destination").append("<option value='ODC'>ODC</option><option value='SCCR'>SCCR</option><option value='ADC'>ADC</option>");
                            }else if(js.destination == "SCCR"){
                                $("#destination").empty();
                                $("#destination").append("<option value='SCCR'>SCCR</option><option value='ADC'>ADC</option><option value='ODC'>ODC</option>");
                            }else{
                                $("#destination").empty();
                                $("#destination").append("<option value=''></option><option value='ADC'>ADC</option><option value='ODC'>ODC</option><option value='SCCR'>SCCR</option>");
                            }
                            
                        
                            $("#quantity_box").val(js.qtyperbox);
                            $("#boxno").val(startbox);
                            $("#boxall").val(endbox);
                          
                            $("#firstdigit").val(firstdigit);
                            $("#quantitytotal_box").val(js.allbox);
                            
                            $("#po").val(js.po);
                            $("#pobefore").val(js.po_old);
                            $("#description").val(js.desctxt);
                            $("#gw").val(js.grossweight);
                            $("#nw").val(js.netweight);
                            $("#country").val(js.country_origin);
                        
                            $("#customer1_id").val(js.sku_item1);
                            $("#customer1_barcode").val(js.upc_code1);
                            $("#customer1_color").val(js.colorno1);
                            $("#customer1_size").val(js.sizeno1);
                            $("#customer1_number").val(js.qty1);

                            $("#customer2_id").val(js.sku_item2);
                            $("#customer2_barcode").val(js.upc_code2);
                            $("#customer2_color").val(js.colorno2);
                            $("#customer2_size").val(js.sizeno2);
                            $("#customer2_number").val(js.qty2);
                        
                            $("#customer3_id").val(js.sku_item3);
                            $("#customer3_barcode").val(js.upc_code3);
                            $("#customer3_color").val(js.colorno3);
                            $("#customer3_size").val(js.sizeno3);
                            $("#customer3_number").val(js.qty3);
                        
                            $("#customer4_id").val(js.sku_item4);
                            $("#customer4_barcode").val(js.upc_code4);
                            $("#customer4_color").val(js.colorno4);
                            $("#customer4_size").val(js.sizeno4);
                            $("#customer4_number").val(js.qty4);
                            $("#myform :input").not('#pobefore,#date_create,#nw,#user_createview,#user_editview,#date_edit,#country').attr("disabled", false);
                            
                            $("#prodorder").val(js.prod_order);
                            $("#pallet").val(js.pallet);
                            $("#date_create").val(js.date_create);
                            $("#date_edit").val(js.date_modify);
                            $("#user_createview").val(js.user_create);
                            $("#user_editview").val(js.user_edit);
                           $("#user_edit").val('<%=userid%>')
                            $("#boxseq").val(js.boxseq);
                            console.log(js)
                        }else{
                            Swal.fire({
                                title:"ผิดพลาด",
                                icon:"error",
                                text:"ไม่พบข้อมูล"
                            })
                            clearinput()
                        }
                    }
                })
                
            }
              
            function deletedata(){
                var posearch = $("#posearch").val();
                var boxno = $("#numstart").val();
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
                            url:"Detail",
                            data:{
                                type:"deletedetails",
                                posearch:posearch,
                                boxno:$("#firstdigit").val()+boxno
                            },
                            success:function(msg){
                                var js = JSON.parse(msg);
                                if(js.status == "true"){
                                    Swal.fire({
                                        title:"ลบ",
                                        icon:"success",
                                        text:"ลบสำเร็จ"
                                    })
                                    clearinput()
                                }else if(js.status == "false"){
                                    Swal.fire({
                                        title:"ลบ",
                                        icon:"error",
                                        text:"ลบไม่สำเร็จ"
                                    })
                                }
                                clearinput()
                            }
                        })
                    }
                })
            
            }
            
            $(document).ready(function () {
                $("#customer").change(function() {
                    $("#customer_address").empty();
                    getcustomeraddress($(this).val())
                });
                $("#bt_search").click(function(){
                    searchpo()
                });
                $("#customer1_id").on('input', function() {
                    chack_customer1($(this).val())
                });
                $("#customer2_id").on('input', function() {
                    chack_customer2($(this).val())
                });
                $("#customer3_id").on('input', function() {
                    chack_customer3($(this).val())
                });
                $("#customer4_id").on('input', function() {
                    chack_customer4($(this).val())
                });
                $("#posearch").on('input', function() {
                    getfirstdigit()
                });
                
                $("#gw").on('input', function() {
                    var gw = $(this).val()
                    
                    if(gw && gw.length > 0){
                        
                        var nw = $(this).val() - 1.3
                        if(nw <= 0 || isNaN(nw)){
                            nw = 0
                        }
                        $("#nw").val(nw.toFixed(1))
                    }else{
                        $("#nw").val("")
                    }  
                });
                
                $("#myform :input").attr("disabled", true);
            });
        </script>
    </body>
</html>