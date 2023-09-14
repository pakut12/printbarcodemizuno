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
        <%@ include file="../share/header.jsp" %>
    </head>
    <body>
        <div class="container mt-3">
            <div class="h1 text-center">
                GET MAT FROM SAP
            </div>
            
            <div class="row mt-3 ">
                <div class="col-sm-12 col-md-3 ">
                    <div class="card">
                        <div class="card-header">
                            ค้นหา
                        </div>
                        <div class="card-body" >
                            <form id="myformsap">
                                
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">VKORG</span>
                                    <input type="text" class="form-control text-center" id="VKORG" name="VKORG" required value="9200">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">VTWEG</span>
                                    <input type="text" class="form-control text-center" id="VTWEG" name="VTWEG" required value="94">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">LKUNNR</span>
                                    <input type="text" class="form-control text-center" id="LKUNNR" name="LKUNNR" required value="9210000003">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">HKUNNR</span>
                                    <input type="text" class="form-control text-center" id="HKUNNR" name="HKUNNR" required value="9210000003">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">LKDMAT</span>
                                    <input type="text" class="form-control text-center" id="LKDMAT" name="LKDMAT" required value="350007.0000*">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">HKDMAT</span>
                                    <input type="text" class="form-control text-center" id="HKDMAT" name="HKDMAT" required value="">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">LWERKS</span>
                                    <input type="text" class="form-control text-center" id="LWERKS" name="LWERKS" required value="9000">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">HWERKS</span>
                                    <input type="text" class="form-control text-center" id="HWERKS" name="HWERKS" required value="">
                                </div>
                                
                                
                                <div class="d-flex justify-content-center">
                                    <button class="btn  btn-primary btn-sm" type="button" onclick="getmatformsap()">ดึงข้อมูล</button>
                                    <button class="btn  btn-success ms-3 btn-sm" type="button" >บันทึกข้อมูล</button>
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
                            <table class="table text-nowrap" id="mytable">
                            </table>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>        
        
        <script>
            
            
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
                    url:"../Customer",
                    data:form,
                    
                    success:function(msg){
                        
                        Swal.close()
                        var listmat = JSON.parse(msg)   

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
                                    },
                                ]
                            })
                        }else{
                            Swal.fire({
                                title:'ดึงข้อมูล',
                                text:'ดึงข้อมูลไม่สำเร็จ',
                                icon:'error'
                            }) 
                        }
                    }
                })
            }
            
            $(document).ready(function() {
                //getmatformsap()
            });
            
        </script>
    </body>
</html>