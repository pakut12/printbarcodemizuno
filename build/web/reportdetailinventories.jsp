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
                                <div class="row">
                                    <div class="col-sm-12 col-md-2 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">ลูกค้า</span>
                                            <select class="form-select form-select-sm text-center" id="customer" name="customer">
                                                
                                                
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">ปลายทาง</span>
                                            <select class="form-select form-select-sm text-center" id="destination" name="destination">
                                                <option value=''></option>
                                                <option value="ADC">ADC</option>
                                                <option value="ODC">ODC</option>
                                                <option value="SCCR">SCCR</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">พาเลท</span>
                                            <input type="text" class="form-control text-center"  name="pallet" id="pallet">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                            <input type="text" class="form-control text-center"  name="firstdigit" id="firstdigit" maxlength="1">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">เบอร์กล่องจาก</span>
                                            <input type="number" class="form-control text-center" name="numberbox_start" id="numberbox_start">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                            <input type="number" class="form-control text-center" name="numberbox_end" id="numberbox_end">
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row mt-3">
                                    <div class="col-sm-12 col-md-2">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO เดิม</span>
                                            <input type="text" class="form-control text-center" name="po_old" id="po_old" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                            <input type="text" class="form-control text-center" name="po" id="po" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">รหัสลูกค้า</span>
                                            <input type="text" class="form-control text-center" name="customer_no" id="customer_no" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">รหัสสินค้า</span>
                                            <input type="text" class="form-control text-center" name="customer_product" id="customer_product" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PROD.ORDER</span>
                                            <input type="text" class="form-control text-center" name="prodorder" id="prodorder" >
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row mt-3 text-center">
                                    <div class="col-sm-12 col-md-12">
                                        <button type="button" class="btn btn-outline-primary btn-sm" onclick="getdate()">ค้นหา</button>
                                        <button type="reset" class="btn btn-outline-danger btn-sm ms-2 " onclick="">ล้างข้อมูล</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card shadow-lg mt-3">
                    <div class="card-header">เเสดงข้อมูล</div>
                    <div class="card-body">
                        
                        
                        <div id="mytable" class="mt-3">
                            
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
                        $("#customer").append("<option value=''></option>");
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
            
            function getdate(){
                var customer = $("#customer").val();
                var destination = $("#destination").val();
                var pallet = $("#pallet").val();
                var firstdigit = $("#firstdigit").val();
                var start = $("#numberbox_start").val();
                var end = $("#numberbox_end").val();
                var po = $("#po").val();
                var po_old = $("#po_old").val();
                var customer_no = $("#customer_no").val();
                var customer_product = $("#customer_product").val();
                var prodorder = $("#prodorder").val();
                
                $.ajax({
                    type:'post',
                    url:'Report',
                    data:{
                        type:"gettablereportdetailinventories",
                        customer:customer,
                        destination:destination,
                        pallet:pallet,
                        firstdigit:firstdigit,
                        start:start,
                        end:end,
                        po:po,
                        po_old:po_old,
                        customer_no:customer_no,
                        customer_product:customer_product,
                        prodorder:prodorder
                    },
                    success:function(msg){
                        var form1 = $("#myformreport").serialize()
                       
                        $("#mytable").html(msg);
                        var groupColumn = 3;
                        var table = $('#tablereport').DataTable({
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excelHtml5',
                                    title: 'รายละเอียดสินค้า PO : '+ po + ' วันที่ : ' + today()
                                },
                                {
                                    text: 'PDF',
                                    action: function ( dt ) {
                                        var form = $("#myformreport").serialize()
                                        window.open('Report?type=getreportdetailinventoriespdf&'+form, '_blank','height=400,width=800,left=200,top=200');  
                                    }
                                },
                                {
                                    text: 'Print',
                                    action: function ( dt ) {
                                        var form = $("#myformreport").serialize()
                                        window.open('Report?type=getreportdetailinventories&'+form, '_blank','height=400,width=800,left=200,top=200');  
                                    }
                                }
                            ],
                            order: [[2, 'asc']],
                            scrollX: true,
                            rowGroup: {
                                startRender: function ( rows, group ) {
                                    return "รหัสสินค้า : "+group ;
                                },
                                endRender: function ( rows, group ) {
                                    
                                    var listdata = rows.data().pluck(9);
                                    var sum = 0;
                                    $.each(listdata,function(k,v){
                                        sum += parseInt(v)
                                    })
                                    return "<div style='padding-left: 80%;'>รวม : " + sum +"</div>"
                                },
                                dataSrc: 3
                            }
                            
                        });
                        
                    }
                })
            } 
            
            $( document ).ready(function() {
                getcustomer()
            });
            
          
        </script>
    </body>
</html>