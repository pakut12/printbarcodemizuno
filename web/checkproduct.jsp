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
                                <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่กล่อง</span>
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
            <div id="myform">
                <div class="card shadow-lg mt-3">
                    <div class="card-header">คีย์ข้อมูล</div>
                    <div class="card-body">
                        <div class="container">
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-6">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">รหัสบาร์โค้ด</span>
                                        <input type="number" class="form-control text-center" name="barcode_box" id="barcode_box" pattern="" onclick="this.select();">
                                    </div>
                                </div>
                                
                                <div class="col-sm-12 col-md-6">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
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
                                        <div class="text-center">จำนวนตัวนับได้</div>
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
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            function checkbarcode(){
                var barcode = $("#barcode_box").val();
                var customer1_barcode = $("#customer1_barcode").val();
                var customer2_barcode = $("#customer2_barcode").val();
                var customer3_barcode = $("#customer3_barcode").val();
                var customer4_barcode = $("#customer4_barcode").val();
                
                if(barcode == customer1_barcode){
                    var num = parseInt($("#customer1_number").val())+1;
                    $("#customer1_number").val(num);
                }else if(barcode == customer2_barcode){
                    var num = parseInt($("#customer2_number").val())+1;
                    $("#customer2_number").val(num);
                }else if(barcode == customer3_barcode){
                    var num = parseInt($("#customer3_number").val())+1;
                    $("#customer3_number").val(num);
                }else if(barcode == customer4_barcode){
                    var num = parseInt($("#customer4_number").val())+1;
                    $("#customer4_number").val(num);
                }
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
                            $("#customer1_number").val(0);

                            $("#customer2_id").val(js.sku_item2);
                            $("#customer2_barcode").val(js.upc_code2);
                            $("#customer2_color").val(js.colorno2);
                            $("#customer2_size").val(js.sizeno2);
                            $("#customer2_number").val(0);
                        
                            $("#customer3_id").val(js.sku_item3);
                            $("#customer3_barcode").val(js.upc_code3);
                            $("#customer3_color").val(js.colorno3);
                            $("#customer3_size").val(js.sizeno3);
                            $("#customer3_number").val(0);
                        
                            $("#customer4_id").val(js.sku_item4);
                            $("#customer4_barcode").val(js.upc_code4);
                            $("#customer4_color").val(js.colorno4);
                            $("#customer4_size").val(js.sizeno4);
                            $("#customer4_number").val(0);
                            
                            $("#barcode_box").attr("disabled", false);
                            $("#customer1_number").attr("disabled", false);
                            $("#customer2_number").attr("disabled", false);
                            $("#customer3_number").attr("disabled", false);
                            $("#customer4_number").attr("disabled", false);
                           
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
                $("#barcode_box").on('input', function() {
                  
                    checkbarcode()
                });
                
                $("#myform :input").attr("disabled", true);
               
            });
        </script>
    </body>
</html>