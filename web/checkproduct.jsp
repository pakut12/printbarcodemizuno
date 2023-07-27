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
        <div class="container mt-5">
            <div class="card">
                <div class="card-header">
                    ค้นหา
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-3">
                            <div class="input-group input-group-sm ">
                                <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                <input type="text" class="form-control text-center" id="posearch">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="input-group input-group-sm ">
                                <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                <input type="text" class="form-control text-center" id="firstdigitbefore" maxlength="2">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-2">
                            <div class="input-group input-group-sm ">
                                <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่กล่อง</span>
                                <input type="number" class="form-control text-center" name="numstart" id="numstart">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-4 ">
                            <div class="d-flex justify-content-center justify-content-md-start">
                                <button type="button" class="btn btn-outline-primary btn-sm  w-25" id="bt_search">ค้นหา</button>
                                <button class="btn btn-outline-danger btn-sm  mx-3 " type="button" id="bt_reset" onclick="clearinput()">ล้างข้อมูล</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="myform">
                <div class="card shadow-lg mt-3">
                    <div class="card-header">ยิงบรรจุกล่อง</div>
                    <div class="card-body">
                        <div class="container">
                            <div class="row">
                                <div class="d-flex justify-content-end mb-3">
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm mb-3">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">วันที่</span>
                                            <input type="date" class="form-control text-center" name="date" id="date"  disabled>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">รหัสบาร์โค้ด</span>
                                        <input type="number" class="form-control text-center" name="barcode_box" id="barcode_box" pattern="" onclick="this.select();">
                                    </div>
                                </div>
                                
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                        <input type="text" class="form-control text-center" name="firstdigit" id="firstdigit" pattern="" readonly>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่กล่อง</span>
                                        <input type="text" class="form-control text-center" name="boxno" id="boxno" pattern="" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">ลูกค้า</span>
                                        <select class="form-select form-select-sm text-center" id="customer_num" disabled>
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">จำนวนตัวต่อกล่อง</span>
                                        <input type="number" class="form-control text-center" name="quantity_box" id="quantity_box" pattern="">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่สุดท้าย</span>
                                        <input type="text" class="form-control text-center" name="boxall" id="boxall" pattern="" readonly>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-6">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                        <input type="text" class="form-control text-center" name="po" id="po" readonly >
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Description</span>
                                        <input type="text" class="form-control text-center" name="description" id="description" >
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">G.W</span>
                                        <input type="text" class="form-control text-center" name="gw" id="gw" >
                                        <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">N.W</span>
                                        <input type="text" class="form-control text-center" name="nw" id="nw" >
                                        <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Country of Origin</span>
                                        <input type="text" class="form-control text-center" name="country" id="country" value="THAILAND">
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
                                        <input type="text" class="form-control form-control-sm text-center" id="customer1_qty" >
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer2_qty" >
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer3_qty" >
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer4_qty" >
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="row ">
                                        <div class="text-center fw-bold">จำนวนตัวนับได้</div>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="number" class="form-control form-control-sm text-center" id="customer1_number"  onkeypress="return isNumberKey(event)">
                                    </div>
                                    <div class="row mb-2">
                                        <input type="number" class="form-control form-control-sm text-center"  id="customer2_number" onkeypress="return isNumberKey(event)">
                                    </div>
                                    <div class="row mb-2">
                                        <input type="number" class="form-control form-control-sm text-center"  id="customer3_number" onkeypress="return isNumberKey(event)">
                                    </div>
                                    <div class="row mb-2">
                                        <input type="number" class="form-control form-control-sm text-center"  id="customer4_number" onkeypress="return isNumberKey(event)">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-12 text-center">
                                    <button class="btn btn-outline-success btn-sm mx-3  " type="button" id="bt_sava" onclick="updatedata()">บันทึกข้อมูล</button>
                                    
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
            
            function updatedata(){
                var sumqty_result = parseInt($("#customer1_number").val())+parseInt($("#customer2_number").val())+parseInt($("#customer3_number").val())+parseInt($("#customer4_number").val())
                
                if(parseInt($("#customer1_number").val()) > parseInt($("#customer1_qty").val())){
                    Swal.fire({
                        icon:'error',
                        title:'ผิดพลาด',
                        text:'จำนวนตัวนับได้มากกว่าจำนวนตัว ช่องที่ 1'
                    })
                }else if(parseInt($("#customer2_number").val()) > parseInt($("#customer2_qty").val())){
                    Swal.fire({
                        icon:'error',
                        title:'ผิดพลาด',
                        text:'จำนวนตัวนับได้มากกว่าจำนวนตัว ช่องที่ 2'
                    })
                }else if(parseInt($("#customer3_number").val()) > parseInt($("#customer3_qty").val())){
                    Swal.fire({
                        icon:'error',
                        title:'ผิดพลาด',
                        text:'จำนวนตัวนับได้มากกว่าจำนวนตัว ช่องที่ 3'
                    })
                }else if(parseInt($("#customer4_number").val()) > parseInt($("#customer4_qty").val())){
                    Swal.fire({
                        icon:'error',
                        title:'ผิดพลาด',
                        text:'จำนวนตัวนับได้มากกว่าจำนวนตัว ช่องที่ 4'
                    })
                }else{
                   
                    var firstdigit = $("#firstdigit").val();
                    var posearch = $("#posearch").val();
                    var numstart = firstdigit+$("#numstart").val();
                    
                    var qty_result1 = $("#customer1_number").val();
                    var qty_result2 = $("#customer2_number").val();
                    var qty_result3 = $("#customer3_number").val();
                    var qty_result4 = $("#customer4_number").val();
                    var date = new Date().format('d-m-Y H:i:s');
                    
                    $.ajax({
                        type:"post",
                        url:"Detail",
                        data:{
                            type:"updateqtyfrombarcode",
                            posearch:posearch,
                            boxno:numstart,
                            qty_result1:qty_result1,
                            qty_result2:qty_result2,
                            qty_result3:qty_result3,
                            qty_result4:qty_result4,
                            date:date
                        },
                        success:function(msg){
                            if(msg){
                                var js = JSON.parse(msg);
                                if(js.status == "true"){
                                    Swal.fire({
                                        title:"บันทึก",
                                        icon:"success",
                                        text:"บันทึกสำเร็จ"
                                    })
                                    clearinput()
                                }else if(js.status == "false"){
                                    Swal.fire({
                                        title:"บันทึก",
                                        icon:"error",
                                        text:"บันทึกไม่สำเร็จ"
                                    })
                                }
                                clearinput()
                            }else{
                                Swal.fire({
                                    icon:'error',
                                    title:'บันทึก',
                                    text:'บันทึกไม่สำเร็จ'
                                })  
                            }
                        }
                    })
                        

                }
            }
            function clearinput(){
                $("#myform :input").val("");
            }
            
            function checkbarcode(){
                
                var barcode = $("#barcode_box").val();
                var customer1_barcode = $("#customer1_barcode").val();
                var customer2_barcode = $("#customer2_barcode").val();
                var customer3_barcode = $("#customer3_barcode").val();
                var customer4_barcode = $("#customer4_barcode").val();
                
                var customer1_number =  $("#customer1_number").val();
                var customer2_number =  $("#customer2_number").val();
                var customer3_number =  $("#customer3_number").val();
                var customer4_number =  $("#customer4_number").val();
        
               
        
        
                const listbarcode = [customer1_barcode, customer2_barcode, customer3_barcode,customer4_barcode]   
        
        
                if(!customer1_number){
                    customer1_number = 0
                }
                if(!customer2_number){
                    customer2_number = 0
                }
                if(!customer3_number){
                    customer3_number = 0
                }
                if(!customer4_number){
                    customer4_number = 0
                }
               
      
              
                if(listbarcode.includes(barcode)){
                    
                    if(barcode === customer1_barcode && customer1_barcode){
                        var num = parseInt(customer1_number)+1;
                        if(num <= $("#customer1_qty").val()){
                            $("#customer1_number").val(num);
                        }else{
                            setTimeout(function (){
                                Swal.fire({
                                    icon:'error',
                                    title:'ผิดพลาด',
                                    text:'จำนวนตัวนับได้มากกว่าจำนวนตัว ช่องที่ 1'
                                })
                            }, 100);
                            
                        }
                    }else if(barcode === customer2_barcode && customer2_barcode){
                        var num = parseInt(customer2_number)+1;
                        if(num <= $("#customer2_qty").val()){
                            $("#customer2_number").val(num);
                        }else{
                            setTimeout(function (){
                                Swal.fire({
                                    icon:'error',
                                    title:'ผิดพลาด',
                                    text:'จำนวนตัวนับได้มากกว่าจำนวนตัว ช่องที่ 2'
                                })
                            }, 100);
                            
                        }
                    
                    }else if(barcode === customer3_barcode && customer3_barcode){
                        var num = parseInt(customer3_number)+1;
                        if(num <= $("#customer3_qty").val()){
                            $("#customer3_number").val(num);
                        }else{
                            setTimeout(function (){
                                Swal.fire({
                                    icon:'error',
                                    title:'ผิดพลาด',
                                    text:'จำนวนตัวนับได้มากกว่าจำนวนตัว ช่องที่ 3'
                                })
                            }, 100);
                            
                        }
                    
                    }else if(barcode === customer4_barcode && customer4_barcode){
                        var num = parseInt(customer4_number)+1;
                        if(num <= $("#customer4_qty").val()){
                            $("#customer4_number").val(num);
                        }else{
                            setTimeout(function (){
                                Swal.fire({
                                    icon:'error',
                                    title:'ผิดพลาด',
                                    text:'จำนวนตัวนับได้มากกว่าจำนวนตัว ช่องที่ 4'
                                })
                            }, 100);
                            
                        }
                    
                    }
                    
                    setTimeout(function (){
                        $("#barcode_box").val("");
                    }, 100);
                }else{
                    setTimeout(function (){
                        Swal.fire({
                            icon:'error',
                            title:'ผิดพลาด',
                            text:'รหัส Barcode ไม่ถูกต้อง'
                        })
                    }, 100);
                    
                    setTimeout(function (){
                        $("#barcode_box").val("");
                    }, 100);
                }
                
            }
            
            function searchpo(){
                
                var firstdigitbefore = $("#firstdigitbefore").val();
                var posearch = $("#posearch").val();
                var numstart = firstdigitbefore+$("#numstart").val();
    
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"getdetailsforbarcode",
                        posearch:posearch,
                        numstart:numstart
                    },
                    success:function(msg){
                        if(msg){  
                            var js = JSON.parse(msg);
                            console.log(js)
                            today()
                            var qty_result1 = js.qty_result1  
                            var qty_result2 = js.qty_result2  
                            var qty_result3 = js.qty_result3   
                            var qty_result4 = js.qty_result4   
                           
                            var startbox = parseInt(js.boxno.match(/\d+/)[0]);
                            var endbox = parseInt(js.boxall.match(/\d+/)[0]);
                            var firstdigit = js.boxall.match(/[a-zA-Z]+/)[0];
                            
            
                            $("#firstdigit").val(firstdigit);
                            $("#customer_num").empty();
                            $("#customer_num").append("<option value='"+js.shipto+"'>"+js.shipto+"</option>");
 
                            $("#quantity_box").val(js.qtyperbox);
                            $("#boxno").val(startbox);
                            $("#boxall").val(endbox);
                          
                            $("#quantitytotal_box").val(js.allbox);
                        
                            $("#po").val(js.po);
                            $("#description").val(js.desctxt);
                            $("#gw").val(js.grossweight);
                            $("#nw").val(js.netweight);
                            $("#country").val(js.country_origin);
                        
                            $("#customer1_id").val(js.sku_item1);
                            $("#customer1_barcode").val(js.upc_code1);
                            $("#customer1_color").val(js.colorno1);
                            $("#customer1_size").val(js.sizeno1);
                            $("#customer1_qty").val(js.qty1);
                            $("#customer1_number").val(qty_result1);
                            $("#customer2_id").val(js.sku_item2);
                            $("#customer2_barcode").val(js.upc_code2);
                            $("#customer2_color").val(js.colorno2);
                            $("#customer2_size").val(js.sizeno2);
                            $("#customer2_qty").val(js.qty2);
                            $("#customer2_number").val(qty_result2);
                        
                            $("#customer3_id").val(js.sku_item3);
                            $("#customer3_barcode").val(js.upc_code3);
                            $("#customer3_color").val(js.colorno3);
                            $("#customer3_size").val(js.sizeno3);
                            $("#customer3_qty").val(js.qty3);
                            $("#customer3_number").val(qty_result3);
                        
                            $("#customer4_id").val(js.sku_item4);
                            $("#customer4_barcode").val(js.upc_code4);
                            $("#customer4_color").val(js.colorno4);
                            $("#customer4_size").val(js.sizeno4);
                            $("#customer4_qty").val(js.qty4);
                            $("#customer4_number").val(qty_result4);
                            
                            $("#barcode_box").attr("disabled", false);
                            $("#customer1_number").attr("disabled", false);
                            $("#customer2_number").attr("disabled", false);
                            $("#customer3_number").attr("disabled", false);
                            $("#customer4_number").attr("disabled", false);
                            $("#bt_sava").attr("disabled", false);
                            $("#bt_reset").attr("disabled", false);
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
              
            $(document).ready(function () {
                var x = "";
            
                $("#bt_search").click(function(){
                    searchpo()
                });
                
                $("#barcode_box").on("keyup",function(e) {
                    if(e.keyCode === 13){
                        checkbarcode()
                    }
                });
               
                $("#myform :input").attr("disabled", true);
          
            });
        </script>
    </body>
</html>