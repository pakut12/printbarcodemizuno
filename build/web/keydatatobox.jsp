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
                <h5 class="card-header">���������</h5>
                <div class="card-body">
                    <div class="container">
                        <div class="row mb-3">
                            <div class="col-sm-12 col-md-4">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�ӹǹ��ǵ�͡��ͧ</span>
                                    <select class="form-select form-select-sm" id="customer">
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
                                    <select class="form-select form-select-sm" id="">
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
                                    <input type="number" class="form-control" name="quantity_box" id="quantity_box" pattern="">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�ѡ�â�鹵�</span>
                                    <input type="text" class="form-control" name="initial" id="initial"   pattern="">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�Ţ�����ͧ�ҡ</span>
                                    <input type="number" class="form-control" name="numberbox_start" id="numberbox_start" >
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�֧</span>
                                    <input type="number" class="form-control" name="numberbox_end" id="numberbox_end" >
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�ӹǹ���ͧ������</span>
                                    <input type="number" class="form-control" name="quantitytotal_box" id="quantitytotal_box" >
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-12 col-md-6">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                    <input type="text" class="form-control" name="po" id="po" >
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">Description</span>
                                    <input type="text" class="form-control" name="description" id="description" >
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-12 col-md-4">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">G.W</span>
                                    <input type="text" class="form-control" name="gw" id="gw" >
                                    <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">N.W</span>
                                    <input type="text" class="form-control" name="nw" id="nw" >
                                    <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">Country of Origin</span>
                                    <input type="text" class="form-control" name="country" id="country" value="THAILAND">
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="row">
                                    <div class="text-center">�����١���</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="" id="" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="" id="" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="" id="" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="" id="" >
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="text-center">���ʺ�����</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer1_id" id="customer1_id" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer2_id" id="customer2_id" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer3_id" id="customer3_id" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer4_id" id="customer4_id" >
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="text-center">Color</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer1_color" id="customer1_color" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer2_color" id="customer2_color" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer3_color" id="customer3_color" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer4_color" id="customer4_color" >
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="text-center">Size</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer1_size" id="customer1_size" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer2_size" id="customer2_size" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer3_size" id="customer3_size" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer4_size" id="customer4_size" >
                                </div>
                            </div>
                            <div class="col">
                                <div class="row ">
                                    <div class="text-center">�ӹǹ���</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer4_number" id="customer4_number" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer4_number" id="customer4_number" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer4_number" id="customer4_number" >
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm " name="customer4_number" id="customer4_number" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <button class="btn btn-outline-success" type="button" id="bt_sava">�ѹ�֡������</button>
                            </div>
                            <div class="col text-center">
                                <button class="btn btn-outline-danger" type="button" id="bt_reset" onclick="location.reload()">¡��ԡ������</button>
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
    
            $(document).ready(function () {
                getcustomer_text()
            });
        </script>
    </body>
</html>