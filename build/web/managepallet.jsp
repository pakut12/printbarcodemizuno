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
        <div class="container mt-4" >
            <div class="text-center mb-3 h1">
                เเก้ไข ข้อมูลพาเลทเเละน้ำหนัก
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
                                    <input type="text" class="form-control text-center" id="posearch" >
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-2">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                    <select class="form-select form-select-sm text-center" id="firstdigit" >
                                        
                                    </select>
                                    
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่เริ่ม</span>
                                    <input type="number" class="form-control text-center" name="numstart" id="numstart" >
                                    <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                    <input type="number" class="form-control text-center" name="numend" id="numend" >
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4 ">
                                <div class="d-flex justify-content-center justify-content-md-start">
                                    <button type="button" class="btn btn-outline-primary btn-sm w-25 " id="bt_search">ค้นหา</button>
                                    <button class="btn btn-outline-danger btn-sm w-25  mx-3 " type="button" id="bt_reset" onclick="clearinput()">ล้างข้อมูล</button>
                                </div>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="card shadow-lg mt-3">
                <div class="card-header">คีย์ข้อมูล</div>
                <div class="card-body">
                    <form id="myform" novalidate>
                        <div id="mytable">
                        </div> 
                    </form>
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
                        $("#firstdigit").html(msg)
                    }
                })
                
            }
            
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
                        $("#customer").append("<option value=''></option>");
                        $("#customer").append(msg);
                        //getcustomeraddress($("#customer").val())
                    }
                })
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
                var startboxbefore  = $("#numstart").val().toUpperCase();
                var endboxbefore =  $("#numend").val().toUpperCase();
                var firstdigitbefore = $("#firstdigit").val().toUpperCase();
                var po_old = $("#pobefore").val().toUpperCase();
        
                var shipto = $("#customer").val().toUpperCase();
                var customer_address = $("#customer_address").val().toUpperCase();
                var qtyperbox  = $("#quantity_box").val().toUpperCase();
                var firstdigit =  $("#initial").val().toUpperCase();
                var startbox  = $("#numberbox_start").val();
                var endbox  =  $("#numberbox_end").val();
                var allbox  =   $("#quantitytotal_box").val().toUpperCase();    
                var po =  $("#po").val().toUpperCase();
                
                var desctxt = $("#description").val().toUpperCase();
                var grossweight = $("#gw").val().toUpperCase();
                var netweight  = $("#nw").val().toUpperCase();
                var country_origin  = "THAILAND";
                        
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
                var destination  = $("#destination").val().toUpperCase();
               
                if(po != pobefore ){
                    po_old = pobefore
                }
                var date = $("#date_create").val();
                var pallet = $("#pallet").val().toUpperCase();
                var prodorder = $("#prodorder").val().toUpperCase();
              
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
              
                var invoiceno = $("#invoiceno").val();
                var invoicedate = $("#invoicedate").val();
                
                var boxseq = $("#boxseq").val();
                
                console.log(sumqty_result) 
                console.log($("#quantity_box").val())
                
                if(sumqty_result <= parseInt($("#quantity_box").val()) && $("#gw").val() && country_origin && $("#pallet").val()){
                    $.ajax({
                        type:"post",
                        url:"Detail",
                        data:{
                            type:"updatepallet",
                            customer_address:customer_address,
                            pobefore:pobefore,
                            startboxbefore:startboxbefore,
                            endboxbefore:endboxbefore,
                            shipto:shipto,
                            qtyperbox:qtyperbox,
                            firstdigit:firstdigit,
                            startbox:startbox,
                            endbox:endbox,
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
                            pallet:pallet,
                            prodorder:prodorder,
                            destination:destination,
                            date:date,
                            po_old:po_old,
                            firstdigitbefore:firstdigitbefore,
                            invoiceno:invoiceno,
                            invoicedate:invoicedate,
                            boxseq:boxseq,
                            user_edit:user_edit
                        },
                        success:function(msg){
                            if(msg == "true"){
                                Swal.fire({
                                    title:"เเก้ไข",
                                    icon:"success",
                                    text:"เเก้ไขสำเร็จ"
                                })
                            }else if(msg == "false"){
                                Swal.fire({
                                    title:"เเก้ไข",
                                    icon:"error",
                                    text:"เเก้ไขไม่สำเร็จ"
                                })
                            }
                            clearinput(); 
                            $("#myform").removeClass('was-validated')
                            
                        }
                    })
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
                $("#customer_text").val("");
                $("#myform :input").val("");
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
                  
                        //  $("#customer_address").empty();
                        $("#customer_address").append(msg);
                    }
                })
            }
            
            function searchpo(){
                var posearch = $("#posearch").val().toUpperCase();
                var numstart = $("#numstart").val().toUpperCase();
                var numend = $("#numend").val().toUpperCase();
                var firstdigit = $("#firstdigit").val().toUpperCase();
                
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"getdetailpallet",
                        posearch:posearch,
                        numstart:numstart,
                        numend:numend,
                        firstdigit:firstdigit
                    },
                    success:function(msg){
                        if(msg){  
                            $("#mytable").html(msg)
                            $("#table_boxpallet").DataTable({
                                scrollX: true
                            })
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
                var posearch = $("#posearch").val().toUpperCase();
                var numstart = $("#numstart").val().toUpperCase();
                var numend = $("#numend").val().toUpperCase();
                var firstdigit = $("#firstdigit").val().toUpperCase();
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
                                type:"deletedetailsall",
                                posearch:posearch,
                                startbox:numstart,
                                endbox:numend,
                                firstdigit:firstdigit
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
                    $("#customer_address").empty()
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