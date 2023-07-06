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
        <div class="container mt-4">
            <div class="row">
                <div class="text-center h1 mb-3">  พิมพ์กล่องสินค้า MCJ</div>
                <div class="col-12 col-md-8">
                    <div class="card">
                        <div class="card-header">
                            ค้นหา
                        </div>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-sm-12 col-md-7">
                                    <div class="input-group input-group-sm ">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">PO</span>
                                        <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" id="po">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-5">
                                    <div class="input-group input-group-sm ">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">BUDGET MONTH</span>
                                        <input type="text" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" id="budget_month">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-5">
                                    <div class="input-group input-group-sm ">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">อักษรขึ้นต้น</span>
                                        <input type="text" class="form-control text-center" id="firstdigit" maxlength="2">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-5">
                                    <div class="input-group input-group-sm ">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">เลขที่เริ่ม</span>
                                        <input type="number" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" id="boxstart">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">ถึง</span>
                                        <input type="number" class="form-control text-center" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" id="boxend">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-2">
                                    <button type="button" class="btn btn-outline-primary btn-sm text-nowrap w-100" onclick="barcode()">ค้นหา</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-4 ">
                    <div class="card">
                        <div class="card-header">
                            เลือก Stkcker
                        </div>
                        <div class="card-body">
                            <div class="row mx-auto" >
                                <div class="col-sm-12 col-md-6 ">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="style_box" id="style_box1" value="1" checked>
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            รหัสเดียวในกล่อง
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="style_box" id="style_box2" value="2">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            สองรหัสในกล่อง
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="style_box" id="style_box3" value="3">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            สามรหัสในกล่อง
                                        </label>
                                    </div>
                                   
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="style_box" id="style_box4" value="4">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            สี่รหัสในกล่อง
                                        </label>
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
                    <div class="row mb-3">
                        <div class="col-sm-12 col-md-12 text-end">
                            <button class="btn btn-md  btn-outline-primary" id="printbarcode">พิมพ์</button>
                        </div>
                    </div>
                    <div id="mytable">
                        
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <%@ include file="share/footer.jsp" %>
        </footer>
        <script>
            function barcode(){
                var firstdigit = $("#firstdigit").val().toUpperCase();
                var po = $("#po").val().toUpperCase();
                var boxstart = $("#boxstart").val().toUpperCase();
                var boxend = $("#boxend").val().toUpperCase();
                
                $.ajax({
                    type:'post',
                    url:'Detail',
                    data:{
                        type:"getdetailbarcode",
                        po:po,
                        boxstart:boxstart,
                        boxend:boxend,
                        firstdigit:firstdigit
                    },
                    success:function(msg){
                        $("#mytable").empty();
                        $("#mytable").html(msg);
                        $("#table_boxdetail").DataTable({
                            scrollX: true,
                            scrollCollapse: true
                        });
                    }
                })
            } 
            
            $(document).ready(function () {
                $("#printbarcode").click(function(){
                    var firstdigit = $("#firstdigit").val().toUpperCase();
                    var po = $("#po").val().toUpperCase();
                    var start = $("#boxstart").val().toUpperCase();
                    var end = $("#boxend").val().toUpperCase();
                    var budget_month = $("#budget_month").val().toUpperCase();                  
        
        
                    var style_box1 = $("#style_box1").is(":checked");
                    var style_box2 = $("#style_box2").is(":checked");
                    var style_box3 = $("#style_box3").is(":checked");
                    var style_box4 = $("#style_box4").is(":checked");
                            
                    var num = 1;
        
                    if(style_box1){
                        num = 1;
                    }else if(style_box2){
                        num = 2;
                    }else if(style_box3){
                        num = 3;
                    }else if(style_box4){
                        num = 4;
                    }
                    
                    if(po && start && end && num){
                        if(num == 1){
                            window.open("report/reportmcj1.jsp?budget_month="+budget_month+"&po="+po+"&startbox="+start+"&endbox="+end+"&num="+num+"&firstdigit="+firstdigit, '_blank','height=400,width=800,left=200,top=200');        
                        
                        }else if(num == 2){
                            window.open("report/reportmcj2.jsp?budget_month="+budget_month+"&po="+po+"&startbox="+start+"&endbox="+end+"&num="+num+"&firstdigit="+firstdigit, '_blank','height=400,width=800,left=200,top=200');        
                        
                        }else if(num == 3){
                            window.open("report/reportmcj3.jsp?budget_month="+budget_month+"&po="+po+"&startbox="+start+"&endbox="+end+"&num="+num+"&firstdigit="+firstdigit, '_blank','height=400,width=800,left=200,top=200');        
                        
                        }else if(num == 4){
                            window.open("report/reportmcj4.jsp?budget_month="+budget_month+"&po="+po+"&startbox="+start+"&endbox="+end+"&num="+num+"&firstdigit="+firstdigit, '_blank','height=400,width=800,left=200,top=200');       
                        }
                        
                    }
                  
                   
                    //window.open("report/test.jsp", '_blank','height=400,width=800,left=200,top=200');        
                })
            });
        </script>
    </body>
</html>