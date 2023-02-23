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
                        <div class="col-sm-12 col-md-4">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                <input type="text" class="form-control text-center" id="posearch">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-4">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่เริ่ม</span>
                                <input type="text" class="form-control text-center" name="numstart" id="numstart">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-4 ">
                            <div class="d-flex justify-content-center ">
                                <button type="button" class="btn btn-outline-primary btn-sm w-25 " id="bt_search">ค้นหา</button>
                                <button class="btn btn-outline-danger btn-sm w-25  mx-3 " type="button" id="bt_reset" onclick="clearinput()">ยกเลิกข้อมูล</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow-lg mt-3">
                <h5 class="card-header">คีย์ข้อมูล</h5>
                <div class="card-body">
                    <div class="container">
                        <div class="row mb-3">
                            <div class="col-sm-12 col-md-4">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">ลูกค้า</span>
                                    <select class="form-select form-select-sm text-center" id="customer_num" disabled>
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div id="customer_text"></div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">กำหนดปลายทาง</span>
                                    <select class="form-select form-select-sm text-center" id="">
                                        <option value="MUS">MUS</option>
                                        <option value="MCA">MCA</option>
                                        <option value="MCL">MCL</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-12 col-md-4">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                    <input type="text" class="form-control text-center" name="boxno" id="boxno" pattern="" readonly>
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
                                    <div class="text-center">รหัสลูกค้า</div>
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
                                    <div class="text-center">รหัสบาร์โค้ด</div>
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
                                    <div class="text-center">Color</div>
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
                                    <div class="text-center">Size</div>
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
                                    <div class="text-center">จำนวนตัว</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" id="customer1_number" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer2_number" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer3_number" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer4_number" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 text-center">
                                <button class="btn btn-outline-success btn-sm mx-3 mb-3" type="button" id="bt_sava" onclick="updatedata()">เเก้ไขข้อมูล</button>
                                <button class="btn btn-outline-danger btn-sm  mb-3" type="button" id="bt_reset" onclick="deletedata()">ลบข้อมูล</button>
                                
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
            function chack_customer1(customer_id){
                $.ajax({
                    type:'post',
                    url:'Customer',
                    data:{
                        type:"chack_customer",
                        customer_id:customer_id
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer1_barcode").val(js.customer_barcode)
                            $("#customer1_color").val(js.customer_color)
                            $("#customer1_size").val(js.customer_size)
                            $("#customer1_number").val($("#quantity_box").val())
                        }else{
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
                        customer_id:customer_id
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer2_barcode").val(js.customer_barcode)
                            $("#customer2_color").val(js.customer_color)
                            $("#customer2_size").val(js.customer_size)
                            $("#customer2_number").val($("#quantity_box").val())
                        }else{
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
                        customer_id:customer_id
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer3_barcode").val(js.customer_barcode)
                            $("#customer3_color").val(js.customer_color)
                            $("#customer3_size").val(js.customer_size)
                            $("#customer3_number").val($("#quantity_box").val())
                        }else{
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
                        customer_id:customer_id
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer4_barcode").val(js.customer_barcode)
                            $("#customer4_color").val(js.customer_color)
                            $("#customer4_size").val(js.customer_size)
                            $("#customer4_number").val($("#quantity_box").val())
                        }else{
                            $("#customer4_barcode").val("")
                            $("#customer4_color").val("")
                            $("#customer4_size").val("")
                            $("#customer4_number").val("")
                        }
                    }
                })
            }
            
            function updatedata(){
                var pobefore = $("#posearch").val();
                var startboxbefore  = $("#numstart").val();
               
        
        
                var shipto = $("#customer_num").val();
                var qtyperbox  = $("#quantity_box").val();
                var allbox  =   $("#boxall").val();    
                var po =  $("#po").val();
                var desctxt = $("#description").val();
                var grossweight = $("#gw").val();
                var netweight  = $("#nw").val();
                var country_origin  = $("#country").val();
                        
                var sku_item1  = $("#customer1_id").val();
                var upc_code1  =  $("#customer1_barcode").val();
                var colorno1  =  $("#customer1_color").val();
                var sizeno1  =  $("#customer1_size").val();
                var qty1  =  $("#customer1_number").val();

                var sku_item2 =  $("#customer2_id").val();
                var upc_code2  = $("#customer2_barcode").val();
                var colorno2  =  $("#customer2_color").val();
                var sizeno2   =  $("#customer2_size").val();
                var qty2  =  $("#customer2_number").val();
                        
                var sku_item3  =  $("#customer3_id").val();
                var upc_code3 =  $("#customer3_barcode").val();
                var colorno3 =  $("#customer3_color").val();
                var sizeno3  =  $("#customer3_size").val();
                var qty3   =  $("#customer3_number").val();
                        
                var sku_item4  = $("#customer4_id").val();
                var upc_code4  = $("#customer4_barcode").val();
                var colorno4 =  $("#customer4_color").val();
                var sizeno4  =  $("#customer4_size").val();
                var qty4  = $("#customer4_number").val();
                
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
                        qty4:qty4
                    },
                    success:function(msg){
                      
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
                    }
                })
        
            }
            
            function clearinput(){
                $("#customer_num").empty();
                $("#customer_num").append("<option value=''></option>");

                $("#quantity_box").val("");
                $("#boxno").val("");
                $("#numberbox_start").val("");
                $("#numberbox_end").val("");
                $("#boxall").val("");
                        
                $("#po").val("");
                $("#description").val("");
                $("#gw").val("");
                $("#nw").val("");
                $("#country").val("");
                        
                $("#customer1_id").val("");
                $("#customer1_barcode").val("");
                $("#customer1_color").val("");
                $("#customer1_size").val("");
                $("#customer1_number").val("");

                $("#customer2_id").val("");
                $("#customer2_barcode").val("");
                $("#customer2_color").val("");
                $("#customer2_size").val("");
                $("#customer2_number").val("");
                        
                $("#customer3_id").val("");
                $("#customer3_barcode").val("");
                $("#customer3_color").val("");
                $("#customer3_size").val("");
                $("#customer3_number").val("");
                        
                $("#customer4_id").val("");
                $("#customer4_barcode").val("");
                $("#customer4_color").val("");
                $("#customer4_size").val("");
                $("#customer4_number").val("");
            }
            
            function searchpo(){
                var posearch = $("#posearch").val();
                var numstart = $("#numstart").val();
                var numend = $("#numend").val();
                
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"getdetails",
                        posearch:posearch,
                        numstart:numstart,
                        numend:numend
                    },
                    success:function(msg){
                        if(msg){  
                            var js = JSON.parse(msg);
                            console.log(js)
                            $("#customer_num").empty();
                            $("#customer_num").append("<option value='"+js.shipto+"'>"+js.shipto+"</option>");
 
                            $("#quantity_box").val(js.qtyperbox);
                            $("#boxno").val(js.boxno);
                            $("#boxall").val(js.boxall);
                          
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
                
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"deletedetails",
                        posearch:posearch,
                        boxno:boxno
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
                    }
                })
            }
            
            $(document).ready(function () {
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
      
            });
        </script>
    </body>
</html>