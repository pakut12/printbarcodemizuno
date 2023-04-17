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
                                <div class="row mt-2 ">
                                    <div class="col-sm-12 col-md-4  ">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">ลูกค้า</span>
                                            <select class="form-select form-select-sm text-center" id="customer" name="customer">
                                                
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 ">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">รหัสลูกค้า</span>
                                            <input type="text" class="form-control text-center"  name="customer_no" id="customer_no" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 ">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">รหัสสินค้า</span>
                                            <input type="text" class="form-control text-center"  name="customer_product" id="customer_product">
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row mt-3">
                                    <div class="col-sm-12 col-md-4  mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">วันที่</span>
                                            <input class="form-control form-control-sm text-center" type="date" id="datestart"></input>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4  mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                            <input class="form-control form-control-sm text-center" type="date" id="dateend"></input>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 ">
                                        <div class="d-flex justify-content-center justify-content-md-start mt-3 mt-md-0">
                                            <button type="button" class="btn btn-outline-primary btn-sm" onclick="getdate()">ค้นหา</button>
                                            <button type="reset" class="btn btn-outline-danger btn-sm ms-2 " onclick="">ล้างข้อมูล</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card shadow-lg mt-3">
                    <div class="card-header">แสดงพีโอ</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="mytable" class="mt-3">
                                
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
            function getcustomer(){
                $.ajax({
                    type:"post",
                    url:"CustomerAddress",
                    data:{
                        type:"getlistcustomer"
                    },
                    success:function(msg){
                        $("#customer").empty();
                        
                        $("#customer").append(msg);
                        //getcustomeraddress($("#customer").val())
                    }
                })
            }
            function today(){
                const date = new Date();
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear(); 
                var today = day + "/" + month + "/" + year; 
                console.log(today)
                return today;
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
            
            function getdate(){
                var customer_no = $("#customer_no").val();
                var customer_product = $("#customer_product").val();
                var customer = $("#customer").val();
                var datestart = $("#datestart").val();
                var dateend = $("#dateend").val();
        
                $.ajax({
                    type:'post',
                    url:'Report',
                    data:{
                        type:"gettablereportviewpo",
                        customer_no:customer_no,
                        customer_product:customer_product,
                        customer:customer,
                        datestart:datestart,
                        dateend:dateend
                    },
                    success:function(msg){
                        $("#mytable").html(msg)
                        var groupColumn = 1;
                        var table = $('#tablereport').DataTable({
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    title: 'รายงานเเสดง PO ลูกค้า : '+ customer + ' วันที่ : ' + today(),
                                    exportOptions: {
                                        format: {
                                            body: function ( data, row, column, node ) {
                                                if(column === 5){}
                                                return data
                                                   
                                            }
                                        }
                                    }
                                },
                                {
                                    text: 'PDF',
                                    action: function ( dt ) {
                                        var form = $("#myformreport").serialize()
                                        window.open('Report?type=getreporviewpopdf&'+form, '_blank','height=400,width=800,left=200,top=200');  
                                    }
                                },
                                {
                                    text: 'Print',
                                    action: function ( dt ) {
                                        var form = $("#myformreport").serialize()
                                        window.open('Report?type=getreporviewpo&'+form, '_blank','height=400,width=800,left=200,top=200');  
                                    }
                                }
                            ],
                            order: [[1, 'asc']]
                           
                        });
 
                    }
                })
            } 
            
            $(document).ready(function () {
                getcustomer()
                $("#customer_no").on('input', function() {
                    chack_customer1($(this).val())
                });
                
            });
          
        </script>
    </body>
</html>