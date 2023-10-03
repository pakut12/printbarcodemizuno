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
            <div class="mx-5 mt-5">
                <div class="text-center h1 mb-3">
                    รายงานสินค้าคงเหลือ
                </div>
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
                                    
                                    <div class="col-sm-12 col-md-2 mt-3 mt-md-0">
                                        <div class="input-group input-group-sm ">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                            <select class="form-select form-select-sm text-center" id="firstdigit" name="firstdigit" >
                                                
                                            </select>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12 col-md-5">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">วันที่</span>
                                            <input class="form-control text-center" type="date" value="" id="datestart" name="datestart">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-5">
                                        <div class="input-group input-group-sm  mt-3 mt-md-0">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                            <input class="form-control text-center" type="date" value="" id="datestop" name="datestop">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2">
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
                        
                        
                        <div id="mytable" class="mt-3">
                           
                            <table class='table table-hover text-nowrap table-bordered text-center table-sm w-100' id='tablereport'>
                                <thead>
                                    <tr>
                                        
                                        <th scope='col'>PO</th>
                                        <th scope='col'>PO เดิม</th>
                                        <th scope='col'>รหัสลูกค้า</th>
                                        <th scope='col'>รหัสสินค้า</th>
                                        <th scope='col'>Production Order</th>
                                        <th scope='col'>พาเลท</th>
                                        <th scope='col'>กล่องที่</th>
                                        <th scope='col'>จำนวนเต็ม</th>
                                        <th scope='col'>จำนวนในกล่อง</th>
                                        <th scope='col'>ต่าง</th>
                                        <th scope='col'>หมายเหตุ</th>
                                        <th scope='col'>ผู้สร้าง</th>
                                        <th scope='col'>วันที่สร้าง</th>
                                        <th scope='col'>ผู้เเก้ไข</th>
                                        <th scope='col'>วันที่เเก้ไข</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="7" class="text-center">รวมทั้งหมด</th>
                                        <th class="text-center" id="sumqty"></th>
                                        <th class="text-center" id="sumqty_result"></th>
                                        <th class="text-center" id="sumdiff"></th>
                                        <th class="text-center" id="summark"></th>
                                        <th class="text-center" ></th>
                                        <th class="text-center" ></th>
                                        <th class="text-center" ></th>
                                        <th class="text-center" ></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        
                    </div>
                </div>
            </div>
        </form>
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            function getfirstdigit(){
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"getfirstdigit",
                        po:$("#po").val()
                    },
                    success:function(msg){
                        var txt = '<option value=""></option>'
                        txt += msg
                        $("#firstdigit").html(txt)
                    }
                })
                
            }
            
    
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
                var today = day + "_" + month + "_" + year; 
                console.log(today)
                return today;
            }
            
    
            function chacknull(txt){
                if(!txt){
                    txt = ""
                }
                return txt
            }
    
            function newexportaction(e, dt, button, config) {
                var self = this;
                var oldStart = dt.settings()[0]._iDisplayStart;
                dt.one('preXhr', function (e, s, data) {
                    // Just this once, load all data from the server...
                    data.start = 0;
                    data.length = 2147483647;
                    dt.one('preDraw', function (e, settings) {
                        // Call the original action function
                        if (button[0].className.indexOf('buttons-copy') >= 0) {
                            $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
                        } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                            $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
                        } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                            $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                                $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                                $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
                        } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                            $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                                $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                                $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
                        } else if (button[0].className.indexOf('buttons-print') >= 0) {
                            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                        }
                        dt.one('preXhr', function (e, s, data) {
                            // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                            // Set the property to what it was before exporting.
                            settings._iDisplayStart = oldStart;
                            data.start = oldStart;
                        });
                        // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                        setTimeout(dt.ajax.reload, 0);
                        // Prevent rendering of the full data to the DOM
                        return false;
                    });
                });
                // Requery the server with the new one-time export settings
                dt.ajax.reload();
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
                var datestart = $("#datestart").val();
                var datestop = $("#datestop").val();
        
                var table =   $("#tablereport").DataTable({
                    lengthMenu: [[10, 25, 50,100,9999999], [10, 25, 50,100 ,"All"]],
                    processing: true,
                    serverSide: true,
                    ajax: {
                        type:"post",
                        url:"Report",
                        data:{
                            type:"gettablereportdetailinventories",
                            customer:customer,
                            destination:destination,
                            pallet:pallet,
                            firstdigit:firstdigit,
                            startbox:start,
                            endbox:end,
                            po:po,
                            po_old:po_old,
                            customer_no:customer_no,
                            customer_product:customer_product,
                            prodorder:prodorder,
                            datestart:datestart,
                            datestop:datestop
                        },
                        dataSrc:function(json){
                          
                            var arr = [];
                            var data = JSON.parse(json.data);
                            console.log(data)
                       
                            $("#sumqty").text(json.sumqty)
                            $("#sumqty_result").text(json.sumqty_result)
                            $("#sumdiff").text(json.sumdiff)
                            $("#summark").text(json.summark)
                            
                         
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
                                    if(parseInt(v.qty_result1) < parseInt(qty)){
                                        mark = "*"
                                    }
                                    diff =  qty - v.qty_result1;
                                }else if(v.customer_no == v.sku_item2){
                                    qty = v.qty2
                                    qty_result=v.qty_result2
                                    if(parseInt(v.qty_result2) < parseInt(qty)){
                                        mark = "*"
                                    }
                                    diff =  qty - v.qty_result2;
                                }else if(v.customer_no == v.sku_item3){
                                    qty = v.qty3
                                    qty_result=v.qty_result3
                                    if(parseInt(v.qty_result3) < parseInt(qty)){
                                        mark = "*"
                                    }
                                    diff =  qty - v.qty_result3;
                                }else if(v.customer_no == v.sku_item4){
                                    qty = v.qty3
                                    qty_result=v.qty_result4
                                    if(parseInt(v.qty_result3) < parseInt(qty)){
                                        mark = "*"
                                    }
                                    diff =  qty - v.qty_result3;
                                }
                                
                                var result = {
                                    date_create : chacknull(v.date_create),
                                    date_modify : chacknull(v.date_modify),
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
                                    user_create:chacknull(v.user_create),
                                    user_edit:chacknull(v.user_edit),
                                    test:"test"
                                }
                                
                                arr.push(result);
                            })
                            //console.log(data)
                            return arr
                        }
                        
                    },
                    columns: [
                        
                        { data: 'po' },
                        { data: 'po_old' },
                        { data: 'customer_no' },
                        { data: 'customer_product' },
                        { data: 'prodorder' },
                        { data: 'pallet' },
                        { data: 'boxno' },
                        { data: 'qty' },
                        { data: 'qty_result' },
                        { data: 'diff' },
                        { data: 'mark' },
                        { data: 'user_create' },
                        { data: 'date_create' },
                        { data: 'user_edit' },
                        { data: 'date_modify' }
                    ],
                    bDestroy: true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength',
                        
                        {
                            extend: 'excelHtml5',
                            title: 'รายละเอียดสินค้า '+ today(),
                            titleAttr: 'Excel',
                            action: newexportaction
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
                    
                    scrollX: true,
                    rowGroup: {
                        startRender: function ( rows, group ) {
                            return "รหัสลูกค้า : "+group ;
                        },
                        endRender: function ( rows, group ) {
                            var listdataqty_result = rows.data().pluck("qty_result");
                            var listdataqty = rows.data().pluck("qty");
                            var listdatadiff = rows.data().pluck("diff");
                            var listdatamark = rows.data().pluck("mark");
                           
                            var sumqty_result = 0;
                            $.each(listdataqty_result,function(k,v){
                                sumqty_result += parseInt(v)
                            })
                           
                            var sumqty = 0;
                            $.each(listdataqty,function(k,v){
                                sumqty += parseInt(v)
                            })
                            
                            var sumdiff = 0;
                            $.each(listdatadiff,function(k,v){
                                sumdiff += parseInt(v)
                            })
                            
                            var summark = 0;
                            $.each(listdatamark,function(k,v){
                                if(v == "*"){
                                    summark += 1
                                }
                                
                            })
                            
                            return $('<tr/>')
                            .append( '<th colspan="7" class="text-end ">รวม : </th>' )
                            .append( '<th class="text-center">'+sumqty.toLocaleString('en-US')+'</td>' )
                            .append( '<th class="text-center">'+sumqty_result.toLocaleString('en-US')+'</th>' )
                            .append( '<th class="text-center">'+sumdiff.toLocaleString('en-US')+'</th>' )
                            .append( '<th class="text-center">'+summark.toLocaleString('en-US')+'</th>' )
                            .append( '<th class="text-center"></th>' )
                            .append( '<th class="text-center"></th>' )
                            .append( '<th class="text-center"></th>' )
                            .append( '<th/>' )
                        },
                        dataSrc: function(row) {
                            console.log(row)
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
            


            $( document ).ready(function() {
                getcustomer()
                
                $("#po").on('input', function() {
                    getpallet()
                    getfirstdigit()
                });
                
                ckpallat()
    
                
                
    
    
            });
            
          
        </script>
    </body>
</html>