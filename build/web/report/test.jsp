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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = "100";
            List<BCInvoice> inv = PackingListService.getPackingListByid(id);
            String[] size = {"XXS", "XS", "S", "M", "L", "XL", "XXL", "XXXL"};


            try {
                for (BCInvoice i : inv) {
                    String txt = "";

                    List<BCDetailBox> listgroupcolor = PackingListService.GroupCustomeColor(i.getPo(), i.getFirstdigit(), i.getStartbox(), i.getEndbox());
                    HashMap<String, String> map = new HashMap<String, String>();

                    for (BCDetailBox g : listgroupcolor) {

                        List<BCDetailBox> listtotalgroup = PackingListService.GroupCustomeSizeTotal(i.getPo(), i.getFirstdigit(), i.getStartbox(), i.getEndbox(), g.getCustomer_color());

                        for (BCDetailBox x : listtotalgroup) {
                            String q = "";
                            String s = "";

                            if (x.getCustomer_size().equals(x.getSizen01())) {
                                s = x.getSizen01();
                                q = x.getQty_result1();
                            } else if (x.getCustomer_size().equals(x.getSizen02())) {
                                s = x.getSizen02();
                                q = x.getQty_result2();
                            } else if (x.getCustomer_size().equals(x.getSizen03())) {
                                s = x.getSizen03();
                                q = x.getQty_result3();
                            } else if (x.getCustomer_size().equals(x.getSizen04())) {
                                s = x.getSizen04();
                                q = x.getQty_result4();
                            }
                            /*
                            System.out.println("---------------------------------------------------------------------");
                            System.out.println(g.getCustomer_color());
                            System.out.println(s);
                            System.out.println(q);
                            System.out.println("---------------------------------------------------------------------");
                             */

                            String data = map.get(g.getCustomer_color() + "#" + s);
                            map.put(g.getCustomer_color() + "#" + s, q);


                            if (data == null) {
                                map.put(g.getCustomer_color() + "#" + s, q);
                            } else {
                                int qt = Integer.parseInt(q) + Integer.parseInt(data);
                                map.put(g.getCustomer_color() + "#" + s, String.valueOf(qt));
                            }

                        }

                        txt += "[";
                        txt += "'',";
                        for (String s : size) {
                            if (map.get(g.getCustomer_color() + "#" + s) == null) {
                                txt += "'',";
                            } else {
                                txt += "'" + map.get(g.getCustomer_color() + "#" + s) + "',";
                            }

                        }
                        
                        txt += "],";


                    }
                    
                    out.print(txt);

                /*
                List<BCDetailBox> listsizebypo = PackingListService.GroupCustomeSizeTotal(i.getPo(), i.getFirstdigit(), i.getStartbox(), i.getEndbox());
                HashMap<String, BCDetailBox> arrsize = new HashMap<String, BCDetailBox>();
                for (BCDetailBox x : listsizebypo) {
                
                for (BCDetailBox z : listsizebypo) {
                arrsize.put(z.getCustomer_color() + "#" + z.getCustomer_size(), x);
                }
                
                System.out.println("---------------------------------------------------------------------");
                System.out.println(x.getPo());
                System.out.println(x.getCustomer_color());
                System.out.println(x.getCustomer_size());
                System.out.println(x.getSizen01());
                System.out.println(x.getSizen02());
                System.out.println(x.getSizen03());
                System.out.println(x.getSizen04());
                System.out.println(x.getQty_result1());
                System.out.println(x.getQty_result2());
                System.out.println(x.getQty_result3());
                System.out.println(x.getQty_result4());
                System.out.println("---------------------------------------------------------------------");
                
                }
                 */
                }




            } catch (Exception e) {
                e.printStackTrace();



            }




        %>
        
    </body>
</html>