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
            <div class="card shadow-lg">
                <div class="card-header">คีย์ข้อมูล</div>
                <div class="card-body">
                    <form id="myform">
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
                                        <span class="input-group-text" id="inputGroup-sizing-sm">ลูกค้า</span>
                                        <select class="form-select form-select-sm text-center" id="customer">
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4 align-items-md-center">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">สถานที่ส่ง</span>
                                        <select class="form-select form-select-sm text-center" id="customer_address">
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">ปลายทาง</span>
                                        <select class="form-select form-select-sm text-center" id="destination">
                                            <option value=""></option>
                                            <option value="ADC">ADC</option>
                                            <option value="ODC">ODC</option>
                                            <option value="SCCR">SCCR</option>
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
                                        <input type="text" class="form-control text-center" name="initial" id="initial" pattern="" maxlength="2">
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
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                        <input type="text" class="form-control text-center" name="po" id="po" >
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">PO เดิม</span>
                                        <input type="text" class="form-control text-center" name="pobefore" id="pobefore" disabled >
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">PROD.ORDER</span>
                                        <input type="text" class="form-control text-center" name="prodorder" id="prodorder" >
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">พาเลท</span>
                                        <input type="text" class="form-control text-center" name="pallet" id="pallet" >
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-2">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">G.W</span>
                                        <input type="text" class="form-control text-center" name="gw" id="gw" >
                                        <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-2">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">N.W</span>
                                        <input type="text" class="form-control text-center" name="nw" id="nw" >
                                        <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-5">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Description</span>
                                        <input type="text" class="form-control text-center" name="description" id="description" >
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
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
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer2_barcode" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer3_barcode" readonly>
                                    </div>
                                    <div class="row mb-2">
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer4_barcode" readonly>
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
                                        <input type="text" class="form-control form-control-sm text-center"  id="customer2_size" readonly >
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
                                    
                                    <button class="btn btn-outline-success btn-sm mx-3 mb-3" type="button" id="bt_sava" onclick="senddata()">บันทึกข้อมูล</button>
                                    <button class="btn btn-outline-danger btn-sm mb-3" type="button" id="bt_reset" onclick="location.reload()">ล้างข้อมูล</button>
                                </div>
                            </div>
                        </div>
                    </form>
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
    
            function getcustomer(){
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:{
                        type:"getlistcustomer"
                    },
                    success:function(msg){
                        $("#customer").empty();
                        $("#customer").html(msg);
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
                  
                        $("#customer_address").empty();
                        $("#customer_address").html(msg);
                    }
                })
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
                        customer_id:customer_id
                    },
                    success:function(msg){
                        if(msg){
                            var js = JSON.parse(msg)
                            console.log(js)
                            $("#customer1_barcode").val(js.customer_barcode)
                            $("#customer1_color").val(js.customer_color)
                            $("#customer1_size").val(js.customer_size)
                            $("#description").val(js.customer_description)
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
           
            
    
            function senddata(){
                var customer = $("#customer").val().toUpperCase();
                var customer_address = $("#customer_address").val().toUpperCase();
                var quantity_box = $("#quantity_box").val().toUpperCase();
                var initial = $("#initial").val().toUpperCase();
                var numberbox_start = $("#numberbox_start").val().toUpperCase();
                var numberbox_end = $("#numberbox_end").val().toUpperCase();
                var quantitytotal_box = $("#quantitytotal_box").val().toUpperCase();
                var po = $("#po").val().toUpperCase();
                var description = $("#description").val().toUpperCase();
                var gw = $("#gw").val().toUpperCase();
                var nw = $("#nw").val().toUpperCase();
                var country = $("#country").val().toUpperCase();
                var customer1_id = [$("#customer1_id").val().toUpperCase(),$("#customer1_barcode").val().toUpperCase(),$("#customer1_color").val().toUpperCase(),$("#customer1_size").val().toUpperCase(),$("#customer1_number").val().toUpperCase()];
                var customer2_id = [$("#customer2_id").val().toUpperCase(),$("#customer2_barcode").val().toUpperCase(),$("#customer2_color").val().toUpperCase(),$("#customer2_size").val().toUpperCase(),$("#customer2_number").val().toUpperCase()];
                var customer3_id = [$("#customer3_id").val().toUpperCase(),$("#customer3_barcode").val().toUpperCase(),$("#customer3_color").val().toUpperCase(),$("#customer3_size").val().toUpperCase(),$("#customer3_number").val().toUpperCase()];
                var customer4_id = [$("#customer4_id").val().toUpperCase(),$("#customer4_barcode").val().toUpperCase(),$("#customer4_color").val().toUpperCase(),$("#customer4_size").val().toUpperCase(),$("#customer4_number").val().toUpperCase()];
                var quantitytotal_box = $("#quantitytotal_box").val().toUpperCase();
                var prodorder = $("#prodorder").val().toUpperCase();
                var pallet = $("#pallet").val().toUpperCase();
                var destination = $("#destination").val().toUpperCase();
                
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
                var sumqty_result = parseInt(num1)+parseInt(num2)+parseInt(num3)+parseInt(num4)
                
                var date = new Date().format('d-m-Y H:i:s');
                
        
                if(initial && numberbox_start && numberbox_end){
                    if(sumqty_result <= parseInt($("#quantity_box").val()) ){
                        $.ajax({
                            type:"post",
                            url:"Detail",
                            data:{
                                type:"adddetails",
                                customer:customer,
                                customer_address:customer_address,
                                quantity_box:quantity_box,
                                initial:initial,
                                numberbox_start:numberbox_start,
                                numberbox_end:numberbox_end,
                                po:po,
                                description:description,
                                gw:gw,
                                nw:nw,
                                country:country,
                                quantitytotal_box:quantitytotal_box,
                                customer1_id:customer1_id,
                                customer2_id:customer2_id,
                                customer3_id:customer3_id,
                                customer4_id:customer4_id,
                                pallet:pallet,
                                prodorder:prodorder,
                                destination:destination,
                                date:date
                            },
                            success:function(msg){
                            
                                console.log(msg)
                                var js = JSON.parse(msg)
                                if(js.status == 'true'){
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'บันทึก',
                                        text: 'บันทึกสำเร็จ'
                                    })
                                }else if(js.status == 'false'){
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'บันทึก',
                                        text: 'บันทึกไม่สำเร็จ'
                                    })
                                }
                            }
                        })
                    }else{
                        Swal.fire({
                            icon: 'error',
                            title: 'ผิดพลาด',
                            text: 'จำนวนตัวรวมไม่เท่ากับจำนวนตัวต่อกล่อง'
                        })
                    }
                }else{
                    Swal.fire({
                        icon: 'error',
                        title: 'ผิดพลาด',
                        text: 'กรุณากรอกข้อมูลให้ถูกต้อง'
                    })
                }
            }

            $(document).ready(function () {
                getcustomer();
              
              
                $("#customer").change(function() {
                    getcustomeraddress($(this).val())
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
                today()
            });
            
    
        </script>
    </body>
</html>