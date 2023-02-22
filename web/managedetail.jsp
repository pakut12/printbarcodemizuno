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
                    ค้นหาข้อมูล
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่กล่อง</span>
                                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
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
                                    <select class="form-select form-select-sm text-center" id="customer_num" >
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
                            <div class="col text-center">
                                <button class="btn btn-outline-success" type="button" id="bt_sava" onclick="senddata()">บันทึกข้อมูล</button>
                            </div>
                            <div class="col text-center">
                                <button class="btn btn-outline-danger" type="button" id="bt_reset" onclick="location.reload()">ยกเลิกข้อมูล</button>
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
            $(document).ready(function () {
                //alert('asd');
            });
        </script>
    </body>
</html>