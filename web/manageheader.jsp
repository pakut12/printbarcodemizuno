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
                        <div class="col">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                            </div>
                        </div>
                        
                        <div class="col">
                            <button type="button" class="btn btn-outline-success btn-sm w-25 ">ค้นหา</button>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="card shadow-lg mt-3">
                <h5 class="card-header">คีย์ข้อมูล</h5>
                <div class="card-body">
                    <div class="container">
                        <div class="row mb-3">
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">จำนวนตัวต่อกล่อง</span>
                                    <select class="form-select form-select-sm text-center" id="">
                                        <option value="MUS">MUS</option>
                                        <option value="MCA">MCA</option>
                                        <option value="MCL">MCL</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <div id=""></div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">จำนวนตัวต่อกล่อง</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่กล่องจาก</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">จำนวนกล่องทั้งหมด</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">Description</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">G.W</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">N.W</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">KGS.</span>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">Country of Origin</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" value="THAILAND">
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col justify-content-center">
                                <div class="row">
                                    <div class="">รหัสลูกค้า</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="text-start">รหัสบาร์โค้ด</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="text-start">Color</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="text-start">Size</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="row text-start">
                                    <div class="">จำนวนตัว</div>
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                                <div class="row mb-2">
                                    <input type="text" class="form-control form-control-sm" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <button class="btn  btn-outline-success" type="button">บันทึกข้อมูล</button>
                            </div>
                            <div class="col text-center">
                                <button class="btn  btn-outline-danger w-25" type="button">ลบ</button>
                            </div>
                            <div class="col text-center">
                                <button class="btn  btn-outline-danger" type="button">ยกเลิกข้อมูล</button>
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