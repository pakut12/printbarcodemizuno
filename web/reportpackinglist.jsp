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
        <form action="Report" method="post" id="myformreport">
            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 col-md-12">
                        <div class="card">
                            <div class="card-header">
                                ค้นหา
                            </div>
                            <div class="card-body">
                                <form id="myform" >
                                    <div class="row mt-2 ">
                                        <div class="col-sm-12 col-md-3  ">
                                            <div class="input-group input-group-sm ">
                                                <span class="input-group-text" id="inputGroup-sizing-sm">INVOICE NO</span>
                                                <input type="text" class="form-control text-center"  name="invoiceno" id="invoiceno">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3  ">
                                            <div class="input-group input-group-sm ">
                                                <span class="input-group-text" id="inputGroup-sizing-sm">INVOICE DATE</span>
                                                <input type="date" class="form-control text-center"  name="invoicedate" id="invoicedate">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-4 ">
                                            <div class="d-flex justify-content-center justify-content-md-start mt-3 mt-md-0">
                                                <button type="button" class="btn btn-outline-primary btn-sm" onclick="gettable()">ค้นหา</button>
                                                <button type="reset" class="btn btn-outline-success btn-sm ms-2 " onclick="printpackinglist()">พิมพ์</button>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card shadow-lg mt-3">
                    <div class="card-header">แสดงพีโอ</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="mytable" class="mt-3">
                                <table class='table table-hover text-nowrap table-bordered text-center table-sm' id='tablereport'>
                                    <thead>
                                        <tr>
                                            <th class='text-center'>NO</th>
                                            <th  class='text-center'>Po</th>
                                            <th  class='text-center'>Firstdigit</th>
                                            <th  class='text-center'>Startbox</th>
                                            <th  class='text-center'>Endbox</th>
                                            
                                            <th  class='text-center'>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            function printpackinglist(){
                var invoiceno = $("#invoiceno").val()
                var invoicedate = $("#invoicedate").val()
                var url = "report/packinglist.jsp?invoiceno="+invoiceno+"&invoicedate="+invoicedate;
                
                window.open(url,"_blank");
            }
            
            
            $(document).ready(function () {
                
                
            });
          
        </script>
    </body>
</html>