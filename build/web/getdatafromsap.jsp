<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>
<%@page import="com.pg.lib.utility.*"%>
<%@page import="com.pg.lib.service.*"%>
<%@page import="com.pg.lib.model.*"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@ include file="share/header.jsp" %>
        
      
    </head>
    <body>
        <div class="mx-5 mt-3">
            <div class="h1 text-center">
                GET MAT TSG FROM SAP
            </div>
            <div class="alert alert-danger" role="alert">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                    <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
                    <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                </svg> 
                &nbsp; 
                กรุณาตรวจสอบความถูกต้องทุกครั้งก่อนบันทึก
                
            </div>
            <div class="row mt-3 ">
                <div class="col-sm-12 col-md-3 ">
                    <div id='space'></div>
                    <div class="card sticky-top ">
                        <div class="card-header">
                            ค้นหา
                        </div>
                        <div class="card-body" >
                            <form id="myformsap">
                                
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">Sales Organization</span>
                                    <input type="text" class="form-control text-center" id="VKORG" name="VKORG" required value="9200">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">Distribution Channel</span>
                                    <input type="text" class="form-control text-center" id="VTWEG" name="VTWEG" required value="94">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">From Customer No</span>
                                    <input type="text" class="form-control text-center" id="LKUNNR" name="LKUNNR" required value="9210000001">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">To Customer No</span>
                                    <input type="text" class="form-control text-center" id="HKUNNR" name="HKUNNR" required value="9210000016">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">From Customer Mat</span>
                                    <input type="text" class="form-control text-center" id="LKDMAT" name="LKDMAT" required value="350007.0000*">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">To Customer Mat</span>
                                    <input type="text" class="form-control text-center" id="HKDMAT" name="HKDMAT" required value="">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">From Plant</span>
                                    <input type="text" class="form-control text-center" id="LWERKS" name="LWERKS" required value="9000">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">To Plant</span>
                                    <input type="text" class="form-control text-center" id="HWERKS" name="HWERKS" required value="9300">
                                </div>
                                
                                
                                <div class="d-flex justify-content-center">
                                    <button class="btn  btn-primary btn-sm w-50" type="button" onclick="getmatformsap()">ดึงข้อมูล</button>
                                    <button class="btn  btn-success ms-3 btn-sm w-50" type="button" onclick="savedataformsap()"  >บันทึกข้อมูล</button>
                                </div>
                                <div class="d-flex justify-content-center mt-3">
                                    <button class="btn  btn-secondary btn-sm w-100" type="button" onclick="location.assign('keyproduct.jsp')">กลับไปหน้าข้อมูลสินค้า</button>
                                    
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-9">
                    <div class="card ">
                        <div class="card-header">
                            เเสดงข้อมูล
                        </div>
                        <div class="card-body" >
                            <table class="table text-nowrap table-bordered w-100 table-sm" id="mytable">
                            </table>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>        
        
        <script>
            
            const arr = [];
            
            function savedataformsap(){
                
                var form = $("#myformsap").serialize();
                form += "&type=savedatafromsap";
        
                Swal.fire({
                    title: 'คุณต้องการบันทึกหรือไม่',
                    showCancelButton: true,
                    confirmButtonText: 'ใช่',
                    cancelButtonText: 'ไม่ใช่',
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: 'Loading...',
                            allowOutsideClick: false, // Prevent users from closing the dialog
                            didOpen: () => {
                                Swal.showLoading();
                            },
                            showConfirmButton: false
                        });
                
                        var alllist = JSON.stringify(arr)
            
                        $.ajax({
                            type:"post",
                            url:"Customer",
                            data:form,
                            success:function(msg){
                                
  
                                Swal.close()
                                var js = JSON.parse(msg)
                                if(js.status == 'true'){
                                    Swal.fire({
                                        title:'บันทึกข้อมูลสำเร็จ',
                                        html:js.msg,
                                        icon:'success'
                                    })
                                }else if(js.status == 'false') {
                                    Swal.fire({
                                        title:'บันทึกข้อมูลไม่สำเร็จ',
                                        html:js.msg,
                                        icon:'error'
                                    })
            
                                }
                       
                            }
                        })
                    } 
                })

        
              
            }
    
    
            function getmatformsap(){
                var form = $("#myformsap").serialize();
                form += "&type=getdatafromsap";
                
        
                Swal.fire({
                    title: 'Loading...',
                    allowOutsideClick: false, // Prevent users from closing the dialog
                    didOpen: () => {
                        Swal.showLoading();
                    },
                    showConfirmButton: false
                });
        
                $.ajax({
                    type:"post",
                    url:"Customer",
                    data:form,
                    success:function(msg){
                        Swal.close()
                        var listmat = JSON.parse(msg)   
                        arr.length = 0
                        $(listmat).each(function(k,v){
                            arr.push(v)
                        })
                        if(listmat.length > 0){
                            Swal.fire({
                                title:'ดึงข้อมูล',
                                text:'ดึงข้อมูลสำเร็จมีข้อมูลจำนวน : ' + listmat.length + ' เเถว',
                                icon:'success'
                            })
            
                            $("#mytable").DataTable({
                                dom: 'Bfrtip',
                                buttons: [
                                    'pageLength','excel'
                                ],
                                scrollX: true,
                                destroy: true,
                                dom: 'Bfrtip',
                                lengthMenu: [[10, 25, 50,100,9999999], [10, 25, 50,100 ,"All"]],
                                data:listmat,
                                columns: [
                                    { 
                                        title: 'KDMAT',
                                        data: "KDMAT"
                                    },
                                    { 
                                        title: 'COLOR',
                                        data: "COLOR"
                                    },
                                    { 
                                        title: 'SIZES',
                                        data: "SIZES"
                                    },
                                    { 
                                        title: 'UPCCODE',
                                        data: "UPCCODE"
                                    },
                                    { 
                                        title: 'MATNR',
                                        data: "MATNR"
                                    },
                                    {
                                        title: 'POSTX',
                                        data: "POSTX"
                                    },
                                    { 
                                        title: 'MAKTX',
                                        data: "MAKTX"
                                    },
                                    { 
                                        title: 'KUNNR',
                                        data: "KUNNR"
                                    },
                                    { 
                                        title: 'NAME1',
                                        data: "NAME1"
                                    },
                                    { 
                                        title: 'WERKS',
                                        data: "WERKS"
                                    }
                                    
                                ]
                            })
                        }else{
                            Swal.fire({
                                title:'ดึงข้อมูล',
                                text:'ดึงข้อมูลไม่สำเร็จ',
                                icon:'error'
                            }) 
                        }
                    },
                    error: function (xhr, status, error) {
                        Swal.close()
                        Swal.fire({
                            title:'ดึงข้อมูล',
                            text:'ดึงข้อมูลไม่สำเร็จ Code : '+error,
                            icon:'error'
                        })
                    }
                })
            }
         
            
        </script>
    </body>
</html>