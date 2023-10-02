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
        <div class="mx-5 mt-5" >
            <div class="text-center mb-3 h1">
                เเก้ไข ข้อมูลพาเลทเเละน้ำหนัก
            </div>
            <div class="card">
                <div class="card-header">
                    ค้นหา
                </div>
                <div class="card-body">
                    <form id="myformsearch">
                        <div class="row">
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                    <input type="text" class="form-control text-center" id="posearch" >
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-2">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                    <select class="form-select form-select-sm text-center" id="firstdigit" >
                                        
                                    </select>
                                    
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่เริ่ม</span>
                                    <input type="number" class="form-control text-center" name="numstart" id="numstart" >
                                    <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                    <input type="number" class="form-control text-center" name="numend" id="numend" >
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4 ">
                                <div class="d-flex justify-content-center justify-content-md-start">
                                    <button type="button" class="btn btn-outline-primary btn-sm w-25 " id="bt_search" onclick=" getdata()">ค้นหา</button>
                                    <button class="btn btn-outline-danger btn-sm w-25  mx-3 " type="button" id="bt_reset" onclick="clearinput()">ล้างข้อมูล</button>
                                </div>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                    <div class="card shadow-lg mt-3">
                        <div class="card-header">คีย์ข้อมูล</div>
                        <div class="card-body">
                            <form id="myformtable">
                                <div id="mytable" class="mt-3">
                                    
                                    <table class='table table-hover text-nowrap table-bordered text-center table-sm w-100' id='tablereport'>
                                        <thead>
                                            <tr>
                                                <th scope='col'>PO</th>
                                                <th scope='col'>PO เดิม</th>
                                                <th scope='col'>รหัสลูกค้า</th>
                                                <th scope='col'>รหัสสินค้า</th>
                                                <th scope='col'>Production Order</th>
                                                
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
                                        
                                    </table>
                                    
                                    
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-2 mt-3  ms-auto  my-3" id="bt_save">
                    <button class='btn btn-success btn-lg  w-100 me-3' onclick="senddata()" id="btsave" disabled>บันทึก</button>
                </div>
            </div>
        </div>
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            
    
            function clearinput(){
                $("#btsave").attr('disabled',true)
                $("#tablereport").DataTable().destroy();
                $("#tablereport tbody").html('')
            }
    
    
            function getem(){
               
                $( "#tablereport" ).on( "input", function( event ) {
                    var id = event.target.id
                    if(id){
                        $('#'+id).keyup(function(){
                            var sp = id.split("_")
                            var idtext = sp[0]+"_"+sp[1]
                            console.log(sp)
                            if(idtext){
                                var pl = $('#'+ idtext+"_PL").val()
                                var gw = $('#'+ idtext+"_GW").val()
                                var nw = (gw - 1.3).toFixed(2)
                                console.log()
                                if(nw=='NaN' || nw <= 0){
                                    $('#'+ idtext+"_NW").val(0)     
                                }else{
                                    $('#'+ idtext+"_NW").val(nw)
                                }
                                var data = pl + '#' +gw+'#'+nw
                                $('#'+ idtext).val(data)
                                
                            }
                       
                        });
                    }
                });
             
                
            }
            
            function senddata(){
                var alldata = '';
                
                for(var i = $('#numstart').val(); i<=$('#numend').val(); i++){
                    var key = $('#posearch').val()+"#"+$('#firstdigit').val()+i+"#"
                    var s =  $('#'+$('#posearch').val()+'_'+$('#firstdigit').val()+i).val()
                    
                    if(key && s){
                        alldata += key+s+',';
                    }
                }
                
   
                
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"updatepallet",
                        alldata:alldata
                    },
                    success:function(msg){
                        if(msg == 'true'){
                            Swal.fire({
                                 title:'บันทึก',
                                 icon:'success',
                                 text:'บันทึกสำเร็จ'
                            })
                        }else{
                           Swal.fire({
                                 title:'บันทึก',
                                 icon:'error',
                                 text:'บันทึกไม่สำเร็จ'
                            })
                        }
                        clearinput()
                    }
                })
              
             
            }
    
            function getfirstdigit(){
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"getfirstdigit",
                        po:$("#posearch").val()
                    },
                    success:function(msg){
                        $("#firstdigit").html(msg)
                    }
                })
                
            }
            
            function chacknull(txt){
                if(!txt){
                    txt = ""
                }
                return txt
            }
    

            function getdata(){
               $("#btsave").attr('disabled',false)
                var customer = "";
                var destination = "";
                var pallet = "";
                var firstdigit = $("#firstdigit").val();
                var start = $("#numstart").val();
                var end = $("#numend").val();
                var po = $("#posearch").val();
                var po_old = "";
                var customer_no = "";
                var customer_product = "";
                var prodorder = "";
                var datestart = "";
                var datestop = "";
        
                var table =   $("#tablereport").DataTable({
                    lengthMenu: [[10, 25, 50,100,9999999], [10, 25, 50,100 ,"All"]],
                    pageLength: 9999999,
                    processing: true,
                    serverSide: true,
                    ajax: {
                        type:"post",
                        url:"Detail",
                        data:{
                            type:"gettablepallet",
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
                            
                            
                            $.each(data,function(k,v){
                                
                                var palletnew = "<input type='text' id='"+chacknull(v.po)+"_"+chacknull(v.boxno)+"' name='"+chacknull(v.po)+"_"+chacknull(v.boxno)+"' class='form-control form-control-sm  border border-primary text-center '>";
                                var gwnew = "<input type='text' id='gwnew[]' name='gwnew[]' class='form-control form-control-sm  border border-primary text-center ' value='"+v.grossweight+"'>";
                                 
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
                                    palletnew:palletnew,
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
                                    test:"test",
                                    gw:chacknull(v.grossweight),
                                    nw:chacknull(v.netweight),
                                    gwnew:gwnew
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
                        'pageLength'
                    ],
                    ordering: false,
                    
                    order: [[6, 'asc']],
                    scrollX: true,
                    rowGroup: {
                        startRender: function ( rows, group ) {
                            var pallet = rows.data().pluck("pallet");
                            var gw = rows.data().pluck("gw");
                            var nw = '' ;
                            if(gw[0]){
                               nw = (gw[0] - 1.3).toFixed(2) ; 
                            }
                            
                            var po = rows.data().pluck("po") ;
                            var boxno = rows.data().pluck("boxno") ;
                            
                            
      
                            var html = ''
                            html +=  '<div class="d-flex justify-content-between mx-3 mt-3 mb-3">'
                            html +=  '<div class="h2 fw-bold">เลขที่กล่อง : '+group+' </div>'
                            html +=  '<div class="">'
                            html +=  '<input type="hidden" class="form-control text-center" id="'+po[0]+'_'+boxno[0]+'" onclick="getem()" value="'+pallet[0]+'#'+gw[0]+'#'+nw+'">'
                            html +=  '<div class="input-group input-group-sm ">'
                            html +=  '<span class="input-group-text" id="inputGroup-sizing-sm">พาเลท</span>'
                            html +=  '<input type="text" class="form-control text-center" id="'+po[0]+'_'+boxno[0]+'_PL" onclick="getem()" value="'+pallet[0]+'">'
                            html +=  '</div>'
                            html +=  '<div class="input-group input-group-sm ">'
                            html +=  '<span class="input-group-text" id="inputGroup-sizing-sm">GROSSWEIGHT</span>'
                            html +=  '<input type="text" class="form-control text-center " id="'+po[0]+'_'+boxno[0]+'_GW" onclick="getem()" value="'+gw[0]+'">'
                            html +=  '</div>'
                            html +=  '<div class="input-group input-group-sm ">'
                            html +=  '<span class="input-group-text" id="inputGroup-sizing-sm">NETWEIGHT</span>'
                            html +=  '<input type="text" class="form-control text-center " id="'+po[0]+'_'+boxno[0]+'_NW" disabled value="'+nw+'">'
                            html +=  '</div>'
                            html +=  '</div>'
                            html +=  '</div>'
                           
                            return html ;
                        },
                        dataSrc: function(row) {
                            return row.boxno;
                        }
                    
                    }



                });      
                

                
            }
            
            $(window).scroll(function() {
                var scrollPosition = $(this).scrollTop();
               
                var button = $("#bt_save");

                // ตรวจสอบความสูงของ div ที่มีคลาส "row" และปรับตำแหน่งของปุ่มตามต้องการ
                var rowHeight = $(".row").height();
               

                if (scrollPosition > rowHeight) {
                    button.addClass("fixed-bottom");
                    // เพิ่มการปรับแต่งอื่น ๆ ตามต้องการ
                } else {
                    button.removeClass("fixed-bottom");
                    // นำออกการปรับแต่งอื่น ๆ ตามต้องการ
                }
            });

            $(document).ready(function () {
                $("#posearch").on('input', function() {
                    getfirstdigit()
                });
                
                
    
    
            });
        </script>
    </body>
</html>