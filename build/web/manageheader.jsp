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
                                <input type="text" class="form-control text-center" name="numstart" id="numstart" >
                                <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                <input type="text" class="form-control text-center" name="numend" id="numend" >
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
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">จำนวนตัวต่อกล่อง</span>
                                    <input type="number" class="form-control text-center" name="quantity_box" id="quantity_box" pattern="">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                    <input type="text" class="form-control text-center" name="initial" id="initial" pattern="">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่กล่องจาก</span>
                                    <input type="number" class="form-control text-center" name="numberbox_start" id="numberbox_start" >
                                    <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                    <input type="number" class="form-control text-center" name="numberbox_end" id="numberbox_end" >
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">จำนวนกล่องทั้งหมด</span>
                                    <input type="number" class="form-control text-center" name="quantitytotal_box" id="quantitytotal_box" >
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-12 col-md-6">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                    <input type="text" class="form-control text-center" name="po" id="po" >
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
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer1_barcode" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer2_barcode" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer3_barcode" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer4_barcode" >
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="text-center">Color</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" id="customer1_color" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer2_color" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer3_color" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" id="customer4_color" >
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="text-center">Size</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer1_size" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer2_size"  >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer3_size" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center"  id="customer4_size" >
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
                                <button class="btn btn-outline-success mx-3 mb-3" type="button" id="bt_sava" onclick="senddata()">เเก้ไขข้อมูล</button>
                                <button class="btn btn-outline-danger  mb-3" type="button" id="bt_reset" onclick="location.reload()">ลบข้อมูล</button>
                                
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
            function clearinput(){
                $("#customer_num").empty();
                $("#customer_num").append("<option value=''></option>");
                        
        
                $("#quantity_box").val("");
                $("#initial").val("");
                $("#numberbox_start").val("");
                $("#numberbox_end").val("");
                $("#quantitytotal_box").val("");
                        
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
                            $("#customer_num").empty();
                            $("#customer_num").append("<option value='"+js.shipto+"'>"+js.shipto+"</option>");
                        
        
                            $("#quantity_box").val(js.qtyperbox);
                            $("#initial").val(js.firstdigit);
                            $("#numberbox_start").val(js.startbox);
                            $("#numberbox_end").val(js.endbox);
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
            
            $(document).ready(function () {
                $("#bt_search").click(function(){
                    searchpo()
                })
      
    
            });
        </script>
    </body>
</html>