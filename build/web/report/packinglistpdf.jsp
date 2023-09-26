<%-- 
    Document   : packinglist
    Created on : 17 ?.?. 2566, 11:43:50
    Author     : pakutsing
--%>
<%@page import="com.pg.lib.service.*" %>
<%@page import="com.pg.lib.model.*" %>
<%@page import="com.pg.lib.utility.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
        <script src="../js/pdfmake.min.js"></script>
        <script src="../js/vfs_fonts.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <script>
            <%
            String id = request.getParameter("id").trim();
            List<BCInvoice> inv = PackingListService.getPackingListByid(id);

            /*****************  set header **************/
            String invoiceno = inv.get(0).getInvoiceno();
            String invoicedate = Utility.CoverDate(inv.get(0).getInvoicedate().replace(" 00:00:00.0", ""));
            String saveingno = inv.get(0).getSaveingno();


            /********************** set Custome *******************/
            String cms = inv.get(0).getCustomer();
            String address1 = "";
            String address2 = "";
            String fineldeatination = "";

            HashSet<String> gd = new HashSet<String>();
            for (BCInvoice item : inv) {
                List<BCDetailBox> GroupDESCRIPTION = PackingListService.GroupDESCRIPTION(item.getPo(), item.getFirstdigit(), item.getStartbox(), item.getEndbox());

                for (BCDetailBox DG : GroupDESCRIPTION) {
                    gd.add(DG.getDestination());
                }

            }

            /********************** end Custome *******************/
            String shipper = inv.get(0).getShipper();
            String shipfrom = inv.get(0).getShipfrom();
            String shipto = inv.get(0).getShipto();

            DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
            DecimalFormat decimalFormat1 = new DecimalFormat("#,###");

            String pono = "PO.NO. ";
            String ctnno = "";
            HashSet<String> getpo = new HashSet<String>();

            for (BCInvoice i : inv) {
                getpo.add(i.getPo());
                ctnno += i.getFirstdigit() + i.getStartbox() + "-" + i.getFirstdigit() + i.getEndbox() + ",";
            }

            for (String p : getpo) {
                pono += p + ",";
            }

            pono = pono.substring(0, pono.length() - 1);
            ctnno = ctnno.substring(0, ctnno.length() - 1);


            if (cms.equals("MCJ")) {
                cms = "MC";
                fineldeatination += "FINAL DESTINATION : " + inv.get(0).getFinald();
            } else if (cms.equals("MUS")) {
                address1 = "NORCROSS,GA";
                address2 = "VIA DOWNEY,CA";
            } else if (cms.equals("MCL")) {
                address1 = "ONTARIO";
                address2 = "";
            } else if (cms.equals("MOC")) {
                cms = pono.replace("PO.NO.", "");
                address1 = "MOC";
                address2 = "MELBOURNE";
                pono = "";
            } else if (cms.equals("TMC")) {
                cms = "TMC";
                address1 = "(IN DIA)";
                address2 = "";
                fineldeatination += "FINAL DESTINATION : " + inv.get(0).getFinald();
            } else if (cms.equals("MKL")) {
                cms = "MKL";
                address1 = "BUSAN";
                address2 = "";
                fineldeatination += "FINAL DESTINATION : " + inv.get(0).getFinald();
            }


            if (inv.get(0).getFinald() == null) {
                fineldeatination = "";
            }


            /*****************  end set header **************/

            %>
            
                pdfMake.fonts = {
                    THSarabunNew: {
                        normal: 'THSarabunNew.ttf',
                        bold: 'THSarabunNew-Bold.ttf',
                        italics: 'THSarabunNew-Italic.ttf',
                        bolditalics: 'THSarabunNew-BoldItalic.ttf'
                    },
                    Roboto: {
                        normal: 'Roboto-Regular.ttf',
                        bold: 'Roboto-Medium.ttf',
                        italics: 'Roboto-Italic.ttf',
                        bolditalics: 'Roboto-MediumItalic.ttf'
                    }
                }
            
                var docDefinition = {
                    
        
                    pageSize: {
                        width: 600,
                        height: 800
                    },
                    pageMargins: [20, 70, 30, 30 ],
                    footer: function(currentPage, pageCount) { 
                        return [
                            { 
                                width: '*',
                                text: '<%=invoiceno%>',
                                fontSize: 14,
                                alignment:'center',
                                bold: true                            
                            }
                        ]
                    },
                    header: function(currentPage, pageCount, pageSize) {
                  
                            
                        return [
                            {
                                columns: [
                                    {
                                        width: 255,
                                        alignment: 'left',
                                        text: [{text:'THAI SPORTS GARMENT CO.LTD.',bold:true,fontSize:15},{text:'\n666 RAMA 3 ROAD,YANNAWA, BANGKOK 10120 THAILAND',bold:false,fontSize:12}],
                                        margin: [25, 10]
                                    },
                                    { 
                                        width: '*',
                                        alignment: 'left',
                                        text: 'PACKING LIST', 
                                        decoration: 'underline', 
                                        decorationStyle: 'double' ,
                                        bold:true,
                                        margin: [20, 10]
                                    },
                                    {
                                        width: '*',
                                        alignment: 'right',
                                        text: 'Page : '+currentPage,
                                        margin: [30, 10]
                                    },
                                ]       
                            }
                        ]
                    },
                    content: [
                        {
                            style:['headercontent'],
                            columns: [
                                {
                                    width: '*',
                                    text:'INVOICE NO. <%=invoiceno%>',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'DATED <%=invoicedate%>' 
                                },
                                {
                                    width: '*',
                                    text:''
                                }
                            ]
                                                
                        },
                        {
                            style:['headercontent'],
                            columns: [
                                {
                                    width: '*',
                                    text:'TERMS OF PAYMENY : T/T : SAVING NO. <%=saveingno%>',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'MARKS & NOS.',
                                    alignment: 'center',
                                    bold:true
                                }
                            ]
                                           
                        },
                        {
                            style:['headercontent'],
                            columns: [
                                {
                                    width: '*',
                                    text:'ISSUED BY : BANGKOK BANK PUBLIC CO.,LTD.',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'',
                                    alignment: 'center',
                                    bold:true
                                }
                            ]  
                        },
                        {
                            style:['headercontent'],
                            columns: [
                                {
                                    width: 'auto',
                                    text:'\t\t\tBUKKHALO BRANCH,THAILAND',
                                    bold:true,
                                    margin: [90, 0,0,0]
                                },
                                {
                                    width: '*',
                                    text:'<%=cms%>\n<%=address1%>\n<%=address2%>',
                                    alignment: 'center',
                                    bold:true
                                    
                                }
                            ]  
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:' <%=pono%>',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:'CTN.NO. <%=ctnno%>',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:'MADE IN THAILAND',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:'<%=fineldeatination%>',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:'CARTON MEAS : 38x57x40 CMS.'
                                },
                                {
                                    width: '*',
                                    text:'',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:'VOLUMN : 0.087 M3/CARTON'
                                },
                                {
                                    width: '*',
                                    text:'SHIP PER : <%=shipper%>',
                                    alignment: 'center'
                                }
                            ]
                        },
            
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:'FROM : <%=shipfrom%>',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:'REMARK : ',
                                    alignment: 'center'
                                },
                                {
                                    width: '*',
                                    text:'TO :  <%=shipto%>',
                                    alignment: 'center'
                                }
                            ]
                        },
               
    
    <%
            String datatable2 = "";
            String datatable1 = "";
            int allpc = 0;
            int allcartons = 0;
            double allnw = 0;
            double allgw = 0;
            try {



                for (BCInvoice i1 : inv) {
                    /******************************  set table1 ********************************************/
                    String data[];
                    int totalqty = 0;
                    int totalctn = 0;
                    double totalnw = 0;
                    double totalgw = 0;

                    List<String> listseq = new ArrayList<String>();
                    List<BCDetailBox> inva = PackingListService.GroupCustomerNoByPO(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox());

                    /***************************** set size ******************************/
                    List<BCDetailBox> CheckSize = PackingListService.CheckSize(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox());
                    List<String> size = Utility.getallsize(i1.getCustomer(), CheckSize); // List Size 

                    String width = "";
                    System.out.println(size);

                    String txtsize = "";
                    int n = 2;
                    
                    for (String res : size) {
                        if (size.contains("120") || size.contains("130") || size.contains("140") || size.contains("150") || size.contains("160")) {
                            if(res.contains("120") || res.contains("130") || res.contains("140") || res.contains("150") || res.contains("160")){
                                 txtsize += "{text: '" + res + "', border: [false, true, false, true]},";
                            }else{
                                 txtsize += "{text: '', border: [false, true, false, true]},";
                            }
                            
                        } else if (i1.getCustomer().equals("MUS") || i1.getCustomer().equals("MCL") || i1.getCustomer().equals("MOC")) {
                            txtsize += "{text: '0" + n + "\\n" + res + "', border: [false, true, false, true]},";
                        } else {
                            txtsize += "{text: '" + res + "', border: [false, true, false, true]},";
                        }
                        width += "'auto',";
                        n++;
                    }

                    /*
                    int n1 = size.size();
                    while(n1 != 8){
                    txtsize += "{text: '\\t', border: [false, true, false, true]},";
                    n1++;
                    System.out.println(txtsize);
                    }
                     */


                    /***************************** end size ******************************/
                    HashMap<String, BCDetailBox> listtotal = new HashMap<String, BCDetailBox>();


                    for (BCDetailBox ae : inva) {
                        if (!listseq.contains(ae.getBoxseq())) {
                            listseq.add(ae.getBoxseq());
                        }
                    }
                    String txt = "";
                    for (String seq : listseq) {
                        List<BCDetailBox> x = PackingListService.GroupCustomerNoBySEQ(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox(), seq);

                        String group = Utility.groupnumber(x);

                        System.out.println(group);

                        List<String> grouppo = new ArrayList<String>();
                        for (BCDetailBox ae : x) {
                            String rt = ae.getPo() + "#" + ae.getFirstdigit() + "#" + ae.getBoxno();
                            grouppo.add(rt);
                        }

                        if (!group.contains(",")) {

                            List<BCDetailBox> listsizebypo = PackingListService.GroupCustomerSizeByPO(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox(), seq);

                            HashMap<String, BCDetailBox> arrsize = new HashMap<String, BCDetailBox>();

                            for (BCDetailBox z : listsizebypo) {
                                arrsize.put(z.getCustomer_size(), z);
                            }

                            String sizetxt = "";

                            int qty = 0;
                            int ctn = 0;
                            double nw = 0;
                            double gw = 0;
                            String DESTINATION = "";
                            String Color = "";

                            for (String s : size) {
                                BCDetailBox getsize = arrsize.get(s);
                                if (getsize == null) {
                                    sizetxt += "{text: '',border: [false, false, false, false]},";
                                } else {

                                    if (getsize.getCustomer_no().equals(getsize.getSku_item1())) {
                                        qty += Integer.parseInt(getsize.getQty_result1());
                                        sizetxt += "{text: '" + getsize.getQty_result1() + "',border: [false, false, false, false]},";
                                    } else if (getsize.getCustomer_no().equals(getsize.getSku_item2())) {
                                        qty += Integer.parseInt(getsize.getQty_result2());
                                        sizetxt += "{text: '" + getsize.getQty_result2() + "',border: [false, false, false, false]},";
                                    } else if (getsize.getCustomer_no().equals(getsize.getSku_item3())) {
                                        qty += Integer.parseInt(getsize.getQty_result3());
                                        sizetxt += "{text: '" + getsize.getQty_result3() + "',border: [false, false, false, false]},";
                                    } else if (getsize.getCustomer_no().equals(getsize.getSku_item4())) {
                                        qty += Integer.parseInt(getsize.getQty_result4());
                                        sizetxt += "{text: '" + getsize.getQty_result4() + "',border: [false, false, false, false]},";
                                    }

                                    Color = Utility.subsize(getsize.getCustomer_no());
                                    ctn = Integer.parseInt(getsize.getCountbox());
                                    nw = Double.parseDouble(getsize.getSumnw());
                                    gw = Double.parseDouble(getsize.getSumgw());
                                    if (getsize.getDestination() == null) {
                                        DESTINATION = "";
                                    } else {
                                        DESTINATION = getsize.getDestination();
                                    }

                                }
                            }


                            txt += "[";
                            txt += "{text: '" + group + "',border: [false, false, false, false]},";
                            txt += "{text: '" + Color + "',border: [false, false, false, false]},";
                            txt += "{text: '" + i1.getPo() + "',border: [false, false, false, false]},";
                            txt += sizetxt;
                            txt += "{text: '" + DESTINATION + "',border: [false, false, false, false]},";
                            txt += "{text: '" + ctn + "',border: [false, false, false, false]},";
                            txt += "{text: '" + (ctn * qty) + "',border: [false, false, false, false]},";
                            txt += "{text: '" + decimalFormat.format(nw) + "',border: [false, false, false, false]},";
                            txt += "{text: '" + decimalFormat.format(gw) + "',border: [false, false, false, false]},";
                            txt += "],\n";


                            totalctn += ctn;
                            totalqty += (ctn * qty);
                            totalnw += nw;
                            totalgw += gw;


                            /******** count cartons ทั้งหมด **********/
                            allcartons += ctn;
                            allnw += nw;
                            allgw += gw;
                        /******* end count cartons ทั้งหมด *******/
                        } else {

                            String[] groupT2 = group.split(",");

                            if (groupT2.length - 1 == 1) {

                                List<BCDetailBox> listsizebypo = PackingListService.GroupCustomerSizeByPO(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox(), seq);
                                int status = 0;

                                HashMap<String, BCDetailBox> grouplist = new HashMap<String, BCDetailBox>();
                                HashSet<String> groupid = new HashSet<String>();

                                for (BCDetailBox box : listsizebypo) {
                                    String Color = Utility.subsize(box.getCustomer_no());
                                    grouplist.put(Color, box);
                                    groupid.add(Color);
                                }

                                ArrayList<String> arrayList = new ArrayList<String>(groupid);
                                // Sort the ArrayList
                                Collections.sort(arrayList);
                                HashMap<String, String> setsize = new HashMap<String, String>();
                                for (BCDetailBox box1 : listsizebypo) {

                                    BCDetailBox listb = box1;

                                    int qty = 0;

                                    String key = "";
                                    if (listb.getCustomer_no().equals(listb.getSku_item1())) {
                                        qty += Integer.parseInt(listb.getQty_result1());
                                        key = listb.getCustomer_size() + "#" + listb.getCustomer_no();
                                        setsize.put(listb.getCustomer_size() + "#" + listb.getCustomer_no(), String.valueOf(qty));
                                    } else if (listb.getCustomer_no().equals(listb.getSku_item2())) {
                                        qty += Integer.parseInt(listb.getQty_result2());
                                        key = listb.getCustomer_size() + "#" + listb.getCustomer_no();
                                        setsize.put(listb.getCustomer_size() + "#" + listb.getCustomer_no(), String.valueOf(qty));
                                    } else if (listb.getCustomer_no().equals(listb.getSku_item3())) {
                                        qty += Integer.parseInt(listb.getQty_result3());
                                        key = listb.getCustomer_size() + "#" + listb.getCustomer_no();
                                        setsize.put(listb.getCustomer_size() + "#" + listb.getCustomer_no(), String.valueOf(qty));
                                    } else if (listb.getCustomer_no().equals(listb.getSku_item4())) {
                                        qty += Integer.parseInt(listb.getQty_result4());
                                        key = listb.getCustomer_size() + "#" + listb.getCustomer_no();
                                        setsize.put(listb.getCustomer_size() + "#" + listb.getCustomer_no(), String.valueOf(qty));
                                    }

                                }

                                HashSet<String> htset = new HashSet<String>();
                                for (String atxt : arrayList) {

                                    for (BCDetailBox box : listsizebypo) {
                                        String xz = Utility.subsize(box.getCustomer_no());

                                        if (!htset.contains(xz)) {
                                            if (atxt.equals(xz)) {

                                                BCDetailBox listb = box;
                                                String sizetxt = "";
                                                int qty = 0;
                                                int ctn = 0;
                                                double nw = 0;
                                                double gw = 0;
                                                String DESTINATION = "";
                                                String Color = "";


                                                if (listb.getDestination() == null) {
                                                    DESTINATION = "";
                                                } else {
                                                    DESTINATION = listb.getDestination();
                                                }

                                                Color = Utility.subsize(listb.getCustomer_no());
                                                ctn = Integer.parseInt(listb.getCountbox());
                                                nw = Double.parseDouble(listb.getSumnw());
                                                gw = Double.parseDouble(listb.getSumgw());


                                                if (status == 0) {
                                                    txt += "[";
                                                    txt += "{text: '" + group.replace(",", "") + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + Color + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + i1.getPo() + "',border: [false, false, false, false]},";

                                                    for (String s : size) {
                                                        String key = s + "#" + xz + s;
                                                        if (setsize.get(key) != null) {
                                                            txt += "{text: '" + setsize.get(key) + "',border: [false, false, false, false]},";
                                                            qty += Integer.parseInt(setsize.get(key));
                                                        } else {
                                                            txt += "{text: '',border: [false, false, false, false]},";
                                                        }
                                                    }

                                                    txt += "{text: '" + DESTINATION + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + ctn + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + (ctn * qty) + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + decimalFormat.format(nw) + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + decimalFormat.format(gw) + "',border: [false, false, false, false]},";
                                                    txt += "],\n";

                                                    totalctn += ctn;
                                                    totalqty += (ctn * qty);
                                                    totalnw += nw;
                                                    totalgw += gw;

                                                    allcartons += ctn;
                                                    allnw += nw;
                                                    allgw += gw;


                                                } else {
                                                    txt += "[";
                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "{text: '" + Color + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + i1.getPo() + "',border: [false, false, false, false]},";

                                                    for (String s : size) {
                                                        String key = s + "#" + xz + s;
                                                        if (setsize.get(key) != null) {
                                                            txt += "{text: '" + setsize.get(key) + "',border: [false, false, false, false]},";
                                                            qty += Integer.parseInt(setsize.get(key));
                                                        } else {
                                                            txt += "{text: '',border: [false, false, false, false]},";
                                                        }

                                                    }

                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "{text: '" + (ctn * qty) + "',border: [false, false, false, false]},";
                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "],\n";
                                                    totalqty += (ctn * qty);
                                                }


                                                status++;
                                                htset.add(xz);


                                            }

                                        }
                                    }
                                }


                            } else {

                                String spid[] = groupT2[1].split("-");
                                String id1 = Utility.splitstringandint(groupT2[groupT2.length - 1]) + spid[0].replace(" ", "");
                                String id2 = groupT2[groupT2.length - 1].replace(" ", "");

                                String gtxt = id1 + "-" + id2;

                                List<BCDetailBox> listsizebypo = PackingListService.GroupCustomerSizeByPO(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox(), seq);
                                int status = 0;

                                HashMap<String, BCDetailBox> grouplist = new HashMap<String, BCDetailBox>();
                                HashSet<String> groupid = new HashSet<String>();

                                for (BCDetailBox box : listsizebypo) {
                                    String Color = Utility.subsize(box.getCustomer_no());
                                    grouplist.put(Color, box);
                                    groupid.add(Color);
                                }

                                ArrayList<String> arrayList = new ArrayList<String>(groupid);
                                // Sort the ArrayList
                                Collections.sort(arrayList);
                                HashMap<String, String> setsize = new HashMap<String, String>();
                                for (BCDetailBox box1 : listsizebypo) {

                                    BCDetailBox listb = box1;

                                    int qty = 0;

                                    String key = "";
                                    if (listb.getCustomer_no().equals(listb.getSku_item1())) {
                                        qty += Integer.parseInt(listb.getQty_result1());
                                        key = listb.getCustomer_size() + "#" + listb.getCustomer_no();
                                        setsize.put(listb.getCustomer_size() + "#" + listb.getCustomer_no(), String.valueOf(qty));
                                    } else if (listb.getCustomer_no().equals(listb.getSku_item2())) {
                                        qty += Integer.parseInt(listb.getQty_result2());
                                        key = listb.getCustomer_size() + "#" + listb.getCustomer_no();
                                        setsize.put(listb.getCustomer_size() + "#" + listb.getCustomer_no(), String.valueOf(qty));
                                    } else if (listb.getCustomer_no().equals(listb.getSku_item3())) {
                                        qty += Integer.parseInt(listb.getQty_result3());
                                        key = listb.getCustomer_size() + "#" + listb.getCustomer_no();
                                        setsize.put(listb.getCustomer_size() + "#" + listb.getCustomer_no(), String.valueOf(qty));
                                    } else if (listb.getCustomer_no().equals(listb.getSku_item4())) {
                                        qty += Integer.parseInt(listb.getQty_result4());
                                        key = listb.getCustomer_size() + "#" + listb.getCustomer_no();
                                        setsize.put(listb.getCustomer_size() + "#" + listb.getCustomer_no(), String.valueOf(qty));
                                    }

                                }

                                HashSet<String> htset = new HashSet<String>();
                                for (String atxt : arrayList) {

                                    for (BCDetailBox box : listsizebypo) {
                                        String xz = Utility.subsize(box.getCustomer_no());

                                        if (!htset.contains(xz)) {
                                            if (atxt.equals(xz)) {

                                                BCDetailBox listb = box;
                                                String sizetxt = "";
                                                int qty = 0;
                                                int ctn = 0;
                                                double nw = 0;
                                                double gw = 0;
                                                String DESTINATION = "";
                                                String Color = "";


                                                if (listb.getDestination() == null) {
                                                    DESTINATION = "";
                                                } else {
                                                    DESTINATION = listb.getDestination();
                                                }

                                                Color = Utility.subsize(listb.getCustomer_no());
                                                ctn = Integer.parseInt(listb.getCountbox());
                                                nw = Double.parseDouble(listb.getSumnw());
                                                gw = Double.parseDouble(listb.getSumgw());


                                                if (status == 0) {
                                                    txt += "[";
                                                    txt += "{text: '" + gtxt + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + Color + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + i1.getPo() + "',border: [false, false, false, false]},";

                                                    for (String s : size) {
                                                        String key = s + "#" + xz + s;
                                                        if (setsize.get(key) != null) {
                                                            txt += "{text: '" + setsize.get(key) + "',border: [false, false, false, false]},";
                                                            qty += Integer.parseInt(setsize.get(key));
                                                        } else {
                                                            txt += "{text: '',border: [false, false, false, false]},";
                                                        }
                                                    }

                                                    txt += "{text: '" + DESTINATION + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + ctn + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + (ctn * qty) + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + decimalFormat.format(nw) + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + decimalFormat.format(gw) + "',border: [false, false, false, false]},";
                                                    txt += "],\n";

                                                    totalctn += ctn;
                                                    totalqty += (ctn * qty);
                                                    totalnw += nw;
                                                    totalgw += gw;

                                                    allcartons += ctn;
                                                    allnw += nw;
                                                    allgw += gw;


                                                } else {
                                                    txt += "[";
                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "{text: '" + Color + "',border: [false, false, false, false]},";
                                                    txt += "{text: '" + i1.getPo() + "',border: [false, false, false, false]},";

                                                    for (String s : size) {
                                                        String key = s + "#" + xz + s;
                                                        if (setsize.get(key) != null) {
                                                            txt += "{text: '" + setsize.get(key) + "',border: [false, false, false, false]},";
                                                            qty += Integer.parseInt(setsize.get(key));
                                                        } else {
                                                            txt += "{text: '',border: [false, false, false, false]},";
                                                        }

                                                    }

                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "{text: '" + (ctn * qty) + "',border: [false, false, false, false]},";
                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "{text: '',border: [false, false, false, false]},";
                                                    txt += "],\n";
                                                    totalqty += (ctn * qty);
                                                }


                                                status++;
                                                htset.add(xz);


                                            }

                                        }
                                    }
                                }



                            }
                        }
                    }

                    txt += "[{text: 'TOTAL',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '" + decimalFormat1.format(totalctn) + "',border: [false, true, false, true]},{text: '" + decimalFormat1.format(totalqty) + "',border: [false, true, false, true]},{text: '" + decimalFormat.format(totalnw) + "',border: [false, true, false, true]},{text: '" + decimalFormat.format(totalgw) + "',border: [false, true, false, true]}],";
                    datatable1 += txt;
                    /******************************  End table1 ********************************************/
                    /***************************** set table2 ***************************************/
                    String txt1 = "";
                    String conn = i1.getContainerno() == null ? "" : "Container no." + i1.getContainerno();

                    List<BCDetailBox> listgroupcolor = PackingListService.GroupCustomeColor(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox());
                    HashMap<String, String> map = new HashMap<String, String>();
                    //HashMap<String, String> maptotal = new HashMap<String, String>();
                    List<String> maptotal = new ArrayList<String>();
                    List<String> alltotal = new ArrayList<String>();
                    String data1 = "";

                    for (BCDetailBox g : listgroupcolor) {

                        String desc1 = Utility.Chacknull(g.getDestination());
                        HashSet<String> kl = new HashSet<String>();
                        kl.add(desc1);

                        String grouptxt = Utility.subsize(g.getCustomer_no()) + desc1;
                        if (!alltotal.contains(grouptxt)) {
                            List<BCDetailBox> listtotalgroup = PackingListService.GroupCustomeSizeTotal(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox(), g.getCustomer_color(), desc1);

                            for (BCDetailBox x : listtotalgroup) {
                                String q = "";
                                String s = "";

                                if (x.getCustomer_no().equals(x.getSku_item1())) {
                                    s = x.getSizen01();
                                    q = x.getQty_result1();
                                } else if (x.getCustomer_no().equals(x.getSku_item2())) {
                                    s = x.getSizen02();
                                    q = x.getQty_result2();
                                } else if (x.getCustomer_no().equals(x.getSku_item3())) {
                                    s = x.getSizen03();
                                    q = x.getQty_result3();
                                } else if (x.getCustomer_no().equals(x.getSku_item4())) {
                                    s = x.getSizen04();
                                    q = x.getQty_result4();
                                }




                                data1 = map.get(g.getCustomer_color() + "#" + s + "#" + desc1);
                                int qt = 0;
                                if (data1 == null) {
                                    map.put(g.getCustomer_color() + "#" + s + "#" + desc1, q);

                                } else {
                                    qt = Integer.parseInt(q) + Integer.parseInt(data1);
                                    map.put(g.getCustomer_color() + "#" + s + "#" + desc1, String.valueOf(qt));

                                }
                                maptotal.add(s + "#" + q);
                            }

                            txt1 += "[";
                            txt1 += "{text: '" + grouptxt.replace(desc1, "") + "',border: [false, false, false, false]},";
                            txt1 += "{text: '" + g.getPo() + "',border: [false, false, false, false]},";
                            txt1 += "{text: '" + Utility.Chacknull(desc1) + "',border: [false, false, false, false]},";
                            txt1 += "{text: '',border: [false, false, false, false]},";
                            int qtytotal = 0;
                            for (String s1 : size) {
                                for (String k1 : kl) {
                                    if (map.get(g.getCustomer_color() + "#" + s1 + "#" + desc1) == null) {
                                        txt1 += "{text: '',border: [false, false, false, false]},";

                                    } else {
                                        txt1 += "{text: '" + map.get(g.getCustomer_color() + "#" + s1 + "#" + desc1) + "',border: [false, false, false, false]},";
                                        qtytotal += Integer.parseInt(map.get(g.getCustomer_color() + "#" + s1 + "#" + desc1));

                                    }

                                }

                            }

                            txt1 += "{text: '" + decimalFormat1.format(qtytotal) + "',border: [false, false, false, false]},";
                            txt1 += "{text: '',border: [false, false, false, false]},";
                            txt1 += "],";

                            alltotal.add(grouptxt);
                        }

                    }


                    txt1 += "[";
                    txt1 += "{text: 'TOTAL',border: [false, true, false, true]},";
                    txt1 += "{text: '',border: [false, true, false, true]},";
                    txt1 += "{text: '',border: [false, true, false, true]},";
                    txt1 += "{text: '',border: [false, true, false, true]},";
                    Map<String, Integer> groupedSum = new HashMap<String, Integer>();

                    for (String item : maptotal) {
                        String[] parts = item.split("#");
                        String key = parts[0];
                        int value = Integer.parseInt(parts[1]);

                        if (groupedSum.containsKey(key)) {
                            groupedSum.put(key, groupedSum.get(key) + value);
                        } else {
                            groupedSum.put(key, value);
                        }
                    }

                    //  System.out.println("+asdxzc" + maptotal);
                    //  System.out.println("+asd1" + groupedSum);


                    int qtyall = 0;
                    for (String s : size) {
                        if (groupedSum.get(s) == null) {
                            txt1 += "{text: '',border: [false, true, false, true]},";
                        } else {
                            txt1 += "{text: '" + decimalFormat1.format(groupedSum.get(s)) + "',border: [false, true, false, true]},";
                            qtyall += groupedSum.get(s);
                        }
                    }
                    txt1 += "{text: '" + decimalFormat1.format(qtyall) + "',border: [false, true, false, true]},";
                    txt1 += "{text: ' " + conn + "',border: [false, false, false, false],alignment:'left' },";
                    txt1 += "],";

                    datatable2 = txt1;
                    allpc += qtyall;

                    /***************************** End table2 ***************************************/

    %>
                {
                    style: 'tbcontent',
                    table: {
                        headerRows: 1,
                        widths: [ 50, 50,84, <%=width%> 17,'auto', 'auto', 'auto' , 'auto'],
                        body: [
                            [
                                {text: 'CTN.\nNO.',border: [false, true, false, true]}, 
                                {text: 'DESCRIPTION', border: [false, true, false, true]}, 
                                {text: 'PO', border: [false, true, false, true]},
                                 
                                <%=txtsize%>
                                                            {text: '', border: [false, true, false, true]},
                                                            {text: 'TOTAL\nCTN.', border: [false, true, false, true]},
                                                            {text: '\nQTY', border: [false, true, false, true]},
                                                            {text: 'WEIGHT\nN.W.', border: [false, true, false, true]},
                                                            {text: '\nG.W.', border: [false, true, false, true]},
                                                        ],
                                <%=datatable1%>
                                
                                                    ]
                                                }
                        
                                            },
                                            {
                                            
                                                style: 'tbcontent',
                                                table: {
                                                    headerRows: 1,
                                                    widths: [ 50, 50,17,58, <%=width%> 'auto',110 ],
                                                    body: [
                                                        [
                                                            {text: 'DESCRIPTION',border: [false, true, false, true]}, 
                                                            {text: '', border: [false, true, false, true]}, 
                                                            {text: '', border: [false, true, false, true]}, 
                                                            {text: 'SIZE', border: [false, true, false, true]},
                                                             <%=txtsize%>
                                                                     
                                                                                         {text: 'TOTAL\n(PC)', border: [false, true, false, true]},
                                                                                         {text: '', border: [false, false, false, false]},
                                                                                     ],
                        
                                                            <%=datatable2%>

                                
                    ]
                }
                        
            },
            
    
    
    <%
                    datatable1 = "";
                    datatable2 = "";

                }

            } catch (Exception e) {
                e.printStackTrace();
            }



    %>
                
                {
                    columns: [
                        {
                            // auto-sized columns have their widths based on their content
                            width: 'auto',
                            text: 'TOTAL',
                            margin: [9, 2] 
                        },
                        {
                            // star-sized columns fill the remaining space
                            // if there's more than one star-column, available width is divided equally
                            width: '*',
                            text: '\t <%=decimalFormat1.format(allpc)%>   PC',
                            margin: [9, 2] 
                        },
                        {
                            // fixed width
                            width: 100,
                            text: ''
                        },
                        {
                            // % width
                            width: '20%',
                            text: ''
                        }
                    ],
                    // optional space between columns
                    columnGap: 20
                },
                {
                    columns: [
                        {
                            // auto-sized columns have their widths based on their content
                            width: 'auto',
                            text: '',
                            margin: [9, 2] 
                        },
                        {
                            // star-sized columns fill the remaining space
                            // if there's more than one star-column, available width is divided equally
                            width: '*',
                            text: '\t:\t    <%=decimalFormat1.format(allcartons)%>  CARTONS',
                            margin: [9, 2] 
                        },
                        {
                            // fixed width
                            width: 100,
                            text: ''
                        },
                        {
                            // % width
                            width: '20%',
                            text: ''
                        }
                    ],
                    // optional space between columns
                    columnGap: 20
                },
                {
                    columns: [
                        {
                            // auto-sized columns have their widths based on their content
                            width: 'auto',
                            text: '',
                            margin: [9, 2] 
                        },
                        {
                            // star-sized columns fill the remaining space
                            // if there's more than one star-column, available width is divided equally
                            width: '*',
                            text: '\t:\t   <%=decimalFormat.format(allnw)%>  KGS.(NET WEIGHT)',
                            margin: [9, 2] 
                        },
                        {
                            // fixed width
                            width: 100,
                            text: ''
                        },
                        {
                            // % width
                            width: '20%',
                            text: ''
                        }
                    ],
                    // optional space between columns
                    columnGap: 20
                },
                {
                    columns: [
                        {
                            // auto-sized columns have their widths based on their content
                            width: 'auto',
                            text: '',
                            margin: [9, 2] 
                        },
                        {
                            // star-sized columns fill the remaining space
                            // if there's more than one star-column, available width is divided equally
                            width: '*',
                            text: '\t:\t   <%=decimalFormat.format(allgw)%>  KGS.(GROSS WEIGHT)',
                            margin: [9, 2] 
                        },
                        {
                            // fixed width
                            width: 100,
                            text: ''
                        },
                        {
                            // % width
                            width: '20%',
                            text: ''
                        }
                    ],
                    // optional space between columns
                    columnGap: 20
                },
                
            ],
            styles: {
                headercontent: {
                    fontSize: 13,
                    bold: true,
                    margin: [45, 2] 
                },
                    
                tbcontent: {
                    fontSize: 10,
                    bold: true,
                    margin: [10, 2],
                    alignment:'center'                      
                }
                    
            },
            defaultStyle: {
                font: 'THSarabunNew',
                fontSize: 15,
                bold:true
            }
        };
        
pdfMake.createPdf(docDefinition).download('<%=invoiceno%>.pdf');  
        
    
    
        </script>
    </body>
</html>