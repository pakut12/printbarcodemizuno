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
        <div class="mx-5 mt-5" >
            <div class="text-center mb-3 h1">
                ���� �����ž��ŷ���й��˹ѡ
            </div>
            <div class="card">
                <div class="card-header">
                    ����
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
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�ѡ�â�鹵�</span>
                                    <select class="form-select form-select-sm text-center" id="firstdigit" >
                                        
                                    </select>
                                    
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="input-group input-group-sm ">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�Ţ��������</span>
                                    <input type="number" class="form-control text-center" name="numstart" id="numstart" >
                                    <span class="input-group-text" id="inputGroup-sizing-sm">�֧</span>
                                    <input type="number" class="form-control text-center" name="numend" id="numend" >
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4 ">
                                <div class="d-flex justify-content-center justify-content-md-start">
                                    <button type="button" class="btn btn-outline-primary btn-sm w-25 " id="bt_search" onclick=" getdata()">����</button>
                                    <button class="btn btn-outline-danger btn-sm w-25  mx-3 " type="button" id="bt_reset" onclick="clearinput()">��ҧ������</button>
                                </div>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                    <div class="card shadow-lg mt-3">
                        <div class="card-header">���������</div>
                        <div class="card-body">
                            <form id="myformtable">
                                <div id="mytable" class="mt-3">
                                    
                                    <table class='table table-hover text-nowrap table-bordered text-center table-sm w-100' id='tablereport'>
                                        <thead>
                                            <tr>
                                                <th scope='col'>PO</th>
                                                <th scope='col'>PO ���</th>
                                                <th scope='col'>�����١���</th>
                                                <th scope='col'>�����Թ���</th>
                                                <th scope='col'>Production Order</th>
                                                <th scope='col'>���ͧ���</th>
                                                <th scope='col'>���ŷ</th>
                                                <th scope='col'>GROSSWEIGHT</th>
                                                <th scope='col'>NETWEIGHT</th>
                                                <th scope='col'>�ӹǹ���</th>
                                                <th scope='col'>�ӹǹ㹡��ͧ</th>
                                                <th scope='col'>��ҧ</th>
                                                <th scope='col'>�����˵�</th>
                                                <th scope='col'>������ҧ</th>
                                                <th scope='col'>�ѹ������ҧ</th>
                                                <th scope='col'>�������</th>
                                                <th scope='col'>�ѹ�������</th>
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
                    <button class='btn btn-success btn-lg  w-100 me-3' onclick="senddata()" id="btsave" disabled>�ѹ�֡</button>
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
                $("#myformsearch :input").val('')
            }
    
    
            function getem() {
                $( "#tablereport" ).on( "input", function( event ) {
                    var id = event.target.id;
        
                
        
                    if (id) {
                        
                        var sp = id.split("_");
                        var po = (sp[0].includes('.') ? sp[0].replace(".","\\.") : sp[0])
                        var boxno = (sp[1].includes('.') ? sp[1].replace(".","\\.") : sp[1])
            
                        var pl = $("#" + po + "_" + boxno + "_PL").val().toUpperCase().trim();
                        var gw = $("#" + po + "_" + boxno + "_GW").val().toUpperCase().trim();
                        var nw = (gw - 1.3).toFixed(1);
                        
                        if(nw == 'NaN' || nw <= 0){
                            nw = 0
                        }
                        
                        var txt = boxno+"#"+pl + "#" + gw + "#" + nw;
                        console.log(txt)
                        
                        $("#" + po + "_" + boxno + "_PL").val($("#" + po + "_" + boxno + "_PL").val().toUpperCase().trim())
                        $("#" + po + "_" + boxno + "_GW").val($("#" + po + "_" + boxno + "_GW").val().toUpperCase().trim())
                        $("#" + po + "_" + boxno + "_NW").val(nw); 
                        $("#" + po + "_" + boxno).val(txt.toUpperCase().trim());
                        
                    }
                });
                
                
            }
            
            function senddata(){
                var alldata = '';
                
                for(var i = $('#numstart').val(); i<=$('#numend').val(); i++){
                    var po = ($("#posearch").val().includes('.') ? $("#posearch").val().replace(".","\\.") : $("#posearch").val())
                    var numbox = $('#firstdigit').val()+i
                    var txt = po+numbox
                   
                    if(po && numbox){
                        var data = $('#'+po+'_'+numbox).val()
                        if(data === undefined){
                            continue;
                        }else{
                            alldata += data+',';
                        }
                        
                    }
                    
                }
                
                console.log(alldata)
        
                $.ajax({
                    type:"post",
                    url:"Detail",
                    data:{
                        type:"updatepallet",
                        alldata:alldata,
                        po:$("#posearch").val(),
                        numstart:$('#numstart').val(),
                        numend:$('#numend').val(),
                        firstdigit:$('#firstdigit').val()
                    },
                    success:function(msg){
                        if(msg == 'true'){
                            Swal.fire({
                                title:'�ѹ�֡',
                                icon:'success',
                                text:'�ѹ�֡�����'
                            })
                        }else{
                            Swal.fire({
                                title:'�ѹ�֡',
                                icon:'error',
                                text:'�ѹ�֡��������'
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
                    txt = " "
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
        
                var table = $("#tablereport").DataTable({
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
                            
                            var boxno = []
                            $.each(data,function(k,v){
                                var palletnew = "";
                                var gwnew = "";
                                var nwnew = "";
                                var boxno1 = "";
                                 
                                if(!boxno.includes(v.boxno)){
                                    palletnew = "<input type='hidden' id='"+chacknull(v.po)+"_"+chacknull(v.boxno)+"' name='"+chacknull(v.po)+"_"+chacknull(v.boxno)+"' value='"+chacknull(v.boxno)+"#"+chacknull(v.pallet)+"#"+chacknull(v.grossweight)+"#"+chacknull(v.netweight)+"' ><input type='text' id='"+chacknull(v.po)+"_"+chacknull(v.boxno)+"_PL' name='"+chacknull(v.po)+"_"+chacknull(v.boxno)+"_PL' class='form-control form-control-sm  border border-primary text-center palletnew' value='"+chacknull(v.pallet)+"'>";
                                    gwnew = "<input type='text' id='"+chacknull(v.po)+"_"+chacknull(v.boxno)+"_GW' name='"+chacknull(v.po)+"#"+chacknull(v.boxno)+"_GW' class='form-control form-control-sm  border border-primary text-center gwnew' value='"+chacknull(v.grossweight)+"'>";
                                    nwnew = "<input type='text' id='"+chacknull(v.po)+"_"+chacknull(v.boxno)+"_NW' name='"+chacknull(v.po)+"#"+chacknull(v.boxno)+"_NW' class='form-control form-control-sm  border border-primary text-center nwnew' value='"+chacknull(v.netweight)+"' disabled>"; 
                              
                                    boxno1 = chacknull(v.boxno)
                                    boxno.push(v.boxno)
                                }else{
                                    nwnew = "";
                                    gwnew = "";
                                    palletnew = "";
                                }
                                
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
                                    gwnew:gwnew,
                                    nwnew:nwnew
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
                        { data: 'palletnew' },
                        { data: 'gwnew' },
                        { data: 'nwnew' },
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
                    scrollX: true
                   
                });      
                

                
            }
            
            $(window).scroll(function() {
                var scrollPosition = $(this).scrollTop();
               
                var button = $("#bt_save");

                // ��Ǩ�ͺ�����٧�ͧ div ����դ��� "row" ��л�Ѻ���˹觢ͧ���������ͧ���
                var rowHeight = $(".row").height();
               

                if (scrollPosition > rowHeight) {
                    button.addClass("fixed-bottom");
                    // ������û�Ѻ����� � �����ͧ���
                } else {
                    button.removeClass("fixed-bottom");
                    // ���͡��û�Ѻ����� � �����ͧ���
                }
            });

            $(document).ready(function () {
                $("#posearch").on('input', function() {
                    getfirstdigit()
                });
                getem()
            });
        </script>
    </body>
</html>