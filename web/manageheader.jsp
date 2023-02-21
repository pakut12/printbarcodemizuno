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
            <div class="card">
                <div class="card-header">
                    ����
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
                            <button type="button" class="btn btn-outline-success btn-sm w-25 ">����</button>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="card shadow-lg mt-3">
                <h5 class="card-header">���������</h5>
                <div class="card-body">
                    <div class="container">
                        <div class="row mb-3">
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�ӹǹ��ǵ�͡��ͧ</span>
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
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�ӹǹ��ǵ�͡��ͧ</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�ѡ�â�鹵�</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�Ţ�����ͧ�ҡ</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�֧</span>
                                    <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                </div>
                            </div>
                            
                            <div class="col">
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�ӹǹ���ͧ������</span>
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
                                    <div class="">�����١���</div>
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
                                    <div class="text-start">���ʺ�����</div>
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
                                    <div class="">�ӹǹ���</div>
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
                                <button class="btn  btn-outline-success" type="button">�ѹ�֡������</button>
                            </div>
                            <div class="col text-center">
                                <button class="btn  btn-outline-danger w-25" type="button">ź</button>
                            </div>
                            <div class="col text-center">
                                <button class="btn  btn-outline-danger" type="button">¡��ԡ������</button>
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