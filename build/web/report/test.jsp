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
            
            <div class="row ">
                <div class="col-sm-12 col-md-6 mx-auto">
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
                                    <span class="input-group-text" id="inputGroup-sizing-sm">KUNNR</span>
                                    <input type="text" class="form-control text-center" id="KUNNR" name="KUNNR" required value="9210000003">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text" id="inputGroup-sizing-sm">LKDMAT</span>
                                    <input type="text" class="form-control text-center" id="LKDMAT" name="LKDMAT" required value="3501*">
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
                                    <input type="text" class="form-control text-center" id="HWERKS" name="HWERKS" required value="9300">
                                </div>
                                
                                
                                <div class="d-flex justify-content-center">
                                    <button class="btn  btn-success" type="button" onclick="getmatformsap()">ดึงข้อมูล</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mt-3">
                <div class="card-header">
                    เเสดงข้อมูล
                </div>
                <div class="card-body" >
                    <table class="table" id="mytable">
                    </table>
                </div>
            </div>
        </div>        
        
        <script>
            
            
            function getmatformsap(){
                var form = $("#myformsap").serialize();
                form += "&type=getdatafromsap";
                
                $.ajax({
                    type:"post",
                    url:"../Customer",
                    data:form,
                    success:function(msg){
                        var listmat = JSON.parse(msg)             
        
                        $("#mytable").DataTable({
                            dom: 'Bfrtip',
                            buttons: [
                                'copy', 'csv', 'excel', 'pdf', 'print'
                            ],
                            destroy: true,
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
                    }
                })
            }
            
            $(document).ready(function() {
                getmatformsap()
            });
            
        </script>
    </body>
</html>