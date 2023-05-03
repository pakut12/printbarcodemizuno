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
                                   
                                    
                                    <div class="col-sm-12 col-md-2 mt-3 mt-md-0" id="inputpallat">
                                        
                                        
                                    </div>
                                    
                                    <div class="col-sm-12 col-md-1 mt-3 mt-md-0">
                                        <div class="form-check mt-1">
                                            <input class="form-check-input" type="checkbox" value="" id="chkpallat" onclick="ckpallat()">
                                            <label class="form-check-label " for="chkpallat">
                                                KeyPallat
                                            </label>
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
                                            <span class="input-group-text" id="inputGroup-sizing-sm">เบอร์กล่องจาก</span>
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
                                            <button type="reset" class="btn btn-outline-danger btn-sm ms-2 " onclick="">ล้างข้อมูล</button>
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
                        
                        <div class="table-responsive">
                            <div id="mytable" class="mt-3">
                                <div class='row mb-3 text-center fs-4'>
                                    <div class='text-center h3 fw-bold'>รายละเอียดสินค้า</div>
                                    
                                </div>
                                <table class='table table-hover table-bordered text-nowrap text-center table-sm' id='tablereport'>
                                    <thead>
                                        <tr>
                                            <th scope='col'>วันที่</th>
                                            <th scope='col'>PO</th>
                                            <th scope='col'>รหัสลูกค้า</th>
                                            <th scope='col'>รหัสสินค้า</th>
                                            <th scope='col'>Production Order</th>
                                            <th scope='col'>พาเลท</th>
                                            <th scope='col'>กล่องที่</th>
                                            <th scope='col'>จำนวน</th>
                                            <th scope='col'>หมายเหตุ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th colspan="7" class="text-center">รวมทั้งหมด</th>
                                            <th class="text-center" id="sumqty_result"></th>
                                            <th class="text-center" id="summark"></th>
                                            
                                        </tr>
                                    </tfoot>
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
            
            function today(){
                const date = new Date();
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear(); 
                var today = day + "/" + month + "/" + year; 
                console.log(today)
                return today;
            }
            
            function chacknull(txt){
                if(!txt){
                    txt = ""
                }
                return txt
            }
    
            function getdate(){
                var customer_no = $("#customer_no").val();
                var customer_product = $("#customer_product").val();
                var pallet = $("#pallet").val();
                var boxstart = $("#start").val();
                var boxend = $("#end").val();
                var firstdigit = $("#firstdigit").val();
                var po = $("#po").val();
                
                var table =  $("#tablereport").DataTable({
                    processing: true,
                    serverSide: true,
                    ajax: {
                        type:'post',
                        url:'Report',
                        data:{
                            type:"gettablereport",
                            customer_no:customer_no,
                            customer_product:customer_product,
                            pallet:pallet,
                            boxstart:boxstart,
                            boxend:boxend,
                            firstdigit:firstdigit,
                            po:po
                        },
                        dataSrc:function(json){
                            
                            $("#sumqty_result").text(json.sumqty_result);
                            $("#summark").text(json.summark);
                            
                            var arr = [];
                            var data = JSON.parse(json.data);
 
                            $.each(data,function(k,v){
                                var date = "";
                                if(v.date_create){
                                    date = v.date_create
                                }
                                var qty = "";
                                var qty_result = "";
                                
                                var mark = "";
                                var diff = 0;
                                if(v.customer_no == v.sku_item1){
                                    qty = v.qty1
                                    qty_result=v.qty_result1 
                                    if(v.qty_result1 < qty){
                                        mark = "*"
                                    }
                                    diff =  qty - v.qty_result1;
                                }else if(v.customer_no == v.sku_item2){
                                    qty = v.qty2
                                    qty_result=v.qty_result2
                                    if(v.qty_result2 < qty){
                                        mark = "*"
                                    }
                                    diff =  qty - v.qty_result2;
                                }else if(v.customer_no == v.sku_item3){
                                    qty = v.qty3
                                    qty_result=v.qty_result3
                                    if(v.qty_result3 < qty){
                                        mark = "*"
                                    }
                                    diff =  qty - v.qty_result3;
                                }else if(v.customer_no == v.sku_item4){
                                    qty = v.qty3
                                    qty_result=v.qty_result4
                                    if(v.qty_result3 < qty){
                                        mark = "*"
                                    }
                                    diff =  qty - v.qty_result3;
                                }
                                
                                var result = {
                                    date_create : chacknull(v.date_create),
                                    po : chacknull(v.po),
                                    po_old : chacknull(v.po_old),
                                    customer_no : chacknull( v.customer_no),
                                    customer_product :  chacknull(v.customer_product),
                                    prodorder :  chacknull(v.prodorder),
                                    pallet :  chacknull(v.pallet),
                                    qty :  chacknull(qty),
                                    qty_result :  chacknull(qty_result),
                                    diff :  diff,
                                    mark :  chacknull(mark),
                                    boxno :  chacknull(v.boxno),
                                    test:"test"
                                }
                                arr.push(result);
                            })
                            console.log(json)
                            return arr
                        }
                        
                    },
                    columns: [
                        { data: 'date_create' },
                        { data: 'po' },
                        { data: 'customer_no' },
                        { data: 'customer_product' },
                        { data: 'prodorder' },
                        { data: 'pallet' },
                        { data: 'boxno' },
                        { data: 'qty_result' },
                        { data: 'mark' }
                    ],
                    bDestroy: true,
                    dom: 'Bfrtip',
                    lengthMenu: [[10, 25, 50,100,9999999], [10, 25, 50,100 ,"All"]],
                    buttons: [
                        'pageLength',
                        {
                            extend: 'excel',
                            title: 'รายละเอียดสินค้า '+ today()
                            
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
                    order: [[2, 'asc']],
                    rowGroup: {
                        startRender: function ( rows, group ) {
                            return "รหัสสินค้า : "+group ;
                        },
                        endRender: function ( rows, group ) {
                        
                            var listdataqty_result = rows.data().pluck("qty_result");
                            var listdatamark = rows.data().pluck("mark");
                            
                            var sumqty_result = 0;
                            var mark = 0;
                            
                            $.each(listdataqty_result,function(k,v){
                                sumqty_result += parseInt(v)
                            })
                            
                            $.each(listdatamark,function(k,v){
                                mark++;
                            })
                            
                        
                            return $('<tr/>')
                            .append( '<th colspan="7" class="text-end ">รวม : </th>' )
                            .append( '<th class="text-center">'+sumqty_result+'</td>' )
                            .append( '<th class="text-center">'+mark+'</td>' )
                            .append( '<th/>' )
                            
                        },
                        dataSrc: function(row) {
                            return row.customer_no;
                        }
                   
                    }
                    
                });
              
            } 
            
            function getpallet(){
                var po = $("#po").val();
                console.log(po)
                $.ajax({
                    type:'post',
                    url:'Detail',
                    data:{
                        type:"getpalletbyid",
                        po:po
                    },
                    success:function(msg){
                        var js = JSON.parse(msg);
                        var html = "";
                        html += "<option value=''></option>";
                        $.each(js.listpallet,function(k,v){
                            if(v){
                                html += "<option value='"+v+"'>"+v+"</option>";
                            }
                            
                        })
                        $("#pallet").empty();
                        $("#pallet").html(html);
                    }
                });
            }
            
            function ckpallat(){
                if(!$("#chkpallat").is(':checked'))
                {
                    
                    $("#inputpallat").empty();
                    $("#inputpallat").html('<div class="input-group input-group-sm "><span class="input-group-text" id="inputGroup-sizing-sm">พาเลท</span><select class="form-select" name="pallet" id="pallet"><option value=""></option></select></div>');
               
                } else {
                    
                    $("#inputpallat").empty();
                    $("#inputpallat").html('<div class="input-group input-group-sm "><span class="input-group-text" id="inputGroup-sizing-sm">พาเลท</span><input class="form-control" name="pallet" id="pallet"></input></div>');
                    
                }   
                
                getpallet()
        
            }
            
            $(document).ready(function () {
            
                $("#po").on('input', function() {
                    getpallet()
                });
               
               ckpallat()
            });
            
          
        </script>
    </body>
</html>