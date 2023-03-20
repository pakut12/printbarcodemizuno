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
                                    <div class="col-sm-12 col-md-3 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                            <input type="text" class="form-control text-center"  name="po" id="po">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">รหัสลูกค้า</span>
                                            <input type="text" class="form-control text-center"  name="customer_no" id="customer_no" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">รหัสสินค้า</span>
                                            <input type="text" class="form-control text-center"  name="customer_product" id="customer_product">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">พาเลท</span>
                                            <input type="text" class="form-control text-center"  name="pallet" id="pallet">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                            <input type="text" class="form-control text-center" name="firstdigit" id="firstdigit" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">เบอร์กล่อง</span>
                                            <input type="number" class="form-control text-center" name="start" id="start" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                            <input type="number" class="form-control text-center" name="end" id="end" >
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <div class="d-flex justify-content-center justify-content-md-start mt-3 mt-md-0">
                                            <button type="button" class="btn btn-outline-primary btn-sm" onclick="getdate()">ค้นหา</button>
                                            <button type="reset" class="btn btn-outline-danger btn-sm ms-2 " onclick="">ยกเลิกข้อมูล</button>
                                        </div>
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
                var customer_no = $("#customer_no").val();
                var customer_product = $("#customer_product").val();
                var pallet = $("#pallet").val();
                var start = $("#start").val();
                var end = $("#end").val();
                var firstdigit = $("#firstdigit").val();
                var po = $("#po").val();
                
                $.ajax({
                    type:'post',
                    url:'Report',
                    data:{
                        type:"gettablereport",
                        customer_no:customer_no,
                        customer_product:customer_product,
                        pallet:pallet,
                        start:start,
                        end:end,
                        firstdigit:firstdigit,
                        po:po
                    },
                    success:function(msg){
                       
                        $("#mytable").html(msg)
        
                        var groupColumn = 4;
                        var table = $('#tablereport').DataTable({
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    title: 'รายละเอียดสินค้า PO : '+ po + ' วันที่ : ' + today(),
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
                                        window.open('Report?type=getreportproductdetailspdf&'+form, '_blank','height=400,width=800,left=200,top=200');  
                                    }
                                },
                                {
                                    text: 'Print',
                                    action: function ( dt ) {
                                        var form = $("#myformreport").serialize()
                                        window.open('Report?type=getreportproductdetails&'+form, '_blank','height=400,width=800,left=200,top=200');  
                                    }
                                }
                            ],
                            columnDefs: [{ visible: false, targets: groupColumn }],
                            order: [[groupColumn, 'asc']],
                            displayLength: 10,
                            drawCallback: function (settings) {
                                var api = this.api();
                                var rows = api.rows({ page: 'current' }).nodes();
                                var last = null;
 
                                api
                                .column(groupColumn, { page: 'current' })
                                .data()
                                .each(function (group, i) {
                                    if (last !== group) {
                                        $(rows)
                                        .eq(i)
                                        .before('<tr class="group text-start" style="background-color: #d4d4d4"><td colspan="8">' + group + '</td></tr>');
                                        last = group;
                                    }
                                });
                            }
                        });
 
                        // Order by the grouping
                        $('#tablereport tbody').on('click', 'tr.group', function () {
                            var currentOrder = table.order()[0];
                            if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
                                table.order([groupColumn, 'desc']).draw();
                            } else {
                                table.order([groupColumn, 'asc']).draw();
                            }
                        });
                  

                    }
                })
            } 
            
          
        </script>
    </body>
</html>