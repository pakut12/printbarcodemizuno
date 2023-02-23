<%-- 
    Document   : keydatatobox
    Created on : 16 �.�. 2566, 10:31:11
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
                <div class="card-header">���������</div>
                <div class="card-body">
                    <form id="myform">
                        <div class="container">
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">�١���</span>
                                        <select class="form-select form-select-sm text-center" id="customer_num">
                                            <option value="MUS">MUS</option>
                                            <option value="MCA">MCA</option>
                                            <option value="MCL">MCL</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div id="customer_text"></div>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">��˹����·ҧ</span>
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
                                        <span class="input-group-text" id="inputGroup-sizing-sm">�ӹǹ��ǵ�͡��ͧ</span>
                                        <input type="number" class="form-control text-center" name="quantity_box" id="quantity_box" pattern="">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">�ѡ�â�鹵�</span>
                                        <input type="text" class="form-control text-center" name="initial" id="initial" pattern="">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">�Ţ�����ͧ�ҡ</span>
                                        <input type="number" class="form-control text-center" name="numberbox_start" id="numberbox_start" >
                                        <span class="input-group-text" id="inputGroup-sizing-sm">�֧</span>
                                        <input type="number" class="form-control text-center" name="numberbox_end" id="numberbox_end" >
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">�ӹǹ���ͧ������</span>
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
                                        <div class="text-center">�����١���</div>
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
                                        <div class="text-center">���ʺ�����</div>
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
                                        <div class="text-center">�ӹǹ���</div>
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
                                    <button class="btn btn-outline-success btn-sm mx-3 mb-3" type="button" id="bt_sava" onclick="senddata()">�ѹ�֡������</button>
                                    <button class="btn btn-outline-danger btn-sm  mb-3" type="button" id="bt_reset" onclick="location.reload()">¡��ԡ������</button>
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
           
            function customer_text(){
                var text = $("#customer").val();
                if(text == 'MUS'){
                    $("#customer_text").text('MIZUNO USA INC.');
                }else if(text == 'MCA'){
                    $("#customer_text").text('MIZUNO CORPORATION');
                }else if(text == 'MCL'){
                    $("#customer_text").text('MIZUNO CANADA INC-TDC');
                }
            }
            
            function getcustomer_text(){
                customer_text();
                $('#customer').on('change', function() {
                    customer_text();
                });
            }
    
            function senddata(){
                var customer_num = $("#customer_num").val();
                var quantity_box = $("#quantity_box").val();
                var initial = $("#initial").val();
                var numberbox_start = $("#numberbox_start").val();
                var numberbox_end = $("#numberbox_end").val();
                var quantitytotal_box = $("#quantitytotal_box").val();
                var po = $("#po").val();
                var description = $("#description").val();
                var gw = $("#gw").val();
                var nw = $("#nw").val();
                var country = $("#country").val();
                var customer1_id = [$("#customer1_id").val(),$("#customer1_barcode").val(),$("#customer1_color").val(),$("#customer1_size").val(),$("#customer1_number").val()];
                var customer2_id = [$("#customer2_id").val(),$("#customer2_barcode").val(),$("#customer2_color").val(),$("#customer2_size").val(),$("#customer2_number").val()];
                var customer3_id = [$("#customer3_id").val(),$("#customer3_barcode").val(),$("#customer3_color").val(),$("#customer3_size").val(),$("#customer3_number").val()];
                var customer4_id = [$("#customer4_id").val(),$("#customer4_barcode").val(),$("#customer4_color").val(),$("#customer4_size").val(),$("#customer4_number").val()];
                var quantitytotal_box = $("#quantitytotal_box").val();
                
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"adddetails",
                        customer_num:customer_num,
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
                        customer4_id:customer4_id
                    },
                    success:function(msg){
                        var js = JSON.parse(msg)
                        if(js.status == 'true'){
                            Swal.fire({
                                icon: 'success',
                                title: '�ѹ�֡',
                                text: '�ѹ�֡�����'
                            })
                        }else if(js.status == 'false'){
                            Swal.fire({
                                icon: 'error',
                                title: '�ѹ�֡',
                                text: '�ѹ�֡��������'
                            })
                        }
                    }
                })
        
            }

            $(document).ready(function () {
                getcustomer_text()
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
                $("#numberbox_end").on('input', function() {
                    $("#quantitytotal_box").val($(this).val())
                });
            });
            
    
        </script>
    </body>
</html>