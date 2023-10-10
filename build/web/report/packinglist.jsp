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

            List<String> allpoandfg = new ArrayList<String>();
            for (BCInvoice de : inv) {
                String pode = de.getPo() + "#" + de.getFirstdigit();
                if (!allpoandfg.contains(pode)) {
                    allpoandfg.add(pode);
                }
            }
           

            HashMap<String, String> allmap = new HashMap<String, String>();

            for (String ki : allpoandfg) {
                String[] sp = ki.split("#");

                HashMap<String, String> allpogetmap = new HashMap<String, String>();
                for (BCInvoice ix : inv) {
                    if (sp[0].equals(ix.getPo()) && sp[1].equals(ix.getFirstdigit())) {

                        String txt = allpogetmap.get(ix.getPo() + "#" + ix.getFirstdigit());
                        if (txt == null) {
                            String start = ix.getStartbox();
                            String end = ix.getEndbox();
                            String firstdigit = ix.getFirstdigit();

                            String alltxt = "";

                            for (int s = Integer.parseInt(start); s < Integer.parseInt(end) + 1; s++) {
                                if (s < Integer.parseInt(end)) {
                                    alltxt += "'" + firstdigit + String.valueOf(s) + "',";
                                } else {
                                    alltxt += "'" + firstdigit + String.valueOf(s) + "' ";
                                }
                            }

                            allpogetmap.put(ix.getPo() + "#" + ix.getFirstdigit(), alltxt);

                        } else {

                            String start = ix.getStartbox();
                            String end = ix.getEndbox();
                            String firstdigit = ix.getFirstdigit();

                            String alltxt = txt;



                            for (int s = Integer.parseInt(start); s < Integer.parseInt(end) + 1; s++) {
                                if (s < Integer.parseInt(end)) {
                                    alltxt += "'" + firstdigit + String.valueOf(s) + "',";
                                } else {
                                    alltxt += "'" + firstdigit + String.valueOf(s) + "' ";
                                }
                            }

                            allpogetmap.put(ix.getPo() + "#" + ix.getFirstdigit(), alltxt);
                        }

                        System.out.println("------------------------------------------------------");
                        System.out.println("allpogetmap : ");
                        System.out.println(allpogetmap);
                        System.out.println("------------------------------------------------------");


                    }
                }
                allmap.putAll(allpogetmap);

            }
            
            System.out.println("-------------------------------------------");
            System.out.println("TEST BY GG");
            System.out.println(allmap);
            System.out.println("-------------------------------------------");
            
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
            List<String> getpo = new ArrayList<String>();

            for (BCInvoice i : inv) {
                if (!getpo.contains(i.getPo())) {
                    getpo.add(i.getPo());
                }
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

                    System.out.println(size);
                    String width = "";
                    String txtsize = "";
                    int n = 2;

                    for (String res : size) {
                        if (size.contains("120") || size.contains("130") || size.contains("140") || size.contains("150") || size.contains("160")) {
                            /*
                            if (res.contains("120") || res.contains("130") || res.contains("140") || res.contains("150") || res.contains("160")) {
                            txtsize += "{text: '" + res + "', border: [false, true, false, true]},";
                            } else {
                            txtsize += "{text: '', border: [false, true, false, true]},";
                            }
                             */
                            txtsize += "{text: '', border: [false, true, false, true]},";
                            txtsize += "{text: '', border: [false, true, false, true]},";
                            txtsize += "{text: '', border: [false, true, false, true]},";
                            txtsize += "{text: '120', border: [false, true, false, true]},";
                            txtsize += "{text: '130', border: [false, true, false, true]},";
                            txtsize += "{text: '140', border: [false, true, false, true]},";
                            txtsize += "{text: '150', border: [false, true, false, true]},";
                            txtsize += "{text: '160', border: [false, true, false, true]},";


                            width += "'auto',";
                            width += "'auto',";
                            width += "'auto',";
                            width += "'auto',";
                            width += "'auto',";
                            width += "'auto',";
                            width += "'auto',";
                            width += "'auto',";

                            break;

                        } else if (i1.getCustomer().equals("MUS") || i1.getCustomer().equals("MCL") || i1.getCustomer().equals("MOC")) {
                            txtsize += "{text: '0" + n + "\\n" + res + "', border: [false, true, false, true]},\n";
                        } else {
                            txtsize += "{text: '" + res + "', border: [false, true, false, true]},\n";
                        }

                        width += "'auto',\n";
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

                        List<String> grouppo = new ArrayList<String>();
                        for (BCDetailBox ae : x) {
                            String rt = ae.getPo() + "#" + ae.getFirstdigit() + "#" + ae.getBoxno();
                            grouppo.add(rt);
                        }

                        if (!group.contains(",")) {

                            int num = 0;
                            List<BCDetailBox> listsizebypo = PackingListService.GroupCustomerSizeByPO(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox(), seq);
                            HashSet<String> cut = new HashSet<String>();

                            for (BCDetailBox c : listsizebypo) {
                                String c1 = c.getCustomer_no().replace(c.getCustomer_size(), "");
                                String c2 = (c1.contains(".") ? c1.substring(0, c1.length() - 4) : c1);


                                if (!cut.contains(c2)) {
                                    HashMap<String, BCDetailBox> arrsize = new HashMap<String, BCDetailBox>();

                                    for (BCDetailBox z : listsizebypo) {
                                        arrsize.put(c.getCustomer_no() + z.getCustomer_size(), z);
                                    }

                                    String sizetxt = "";

                                    int qty = 0;
                                    int ctn = 0;
                                    double nw = 0;
                                    double gw = 0;
                                    String DESTINATION = "";
                                    String Color = "";

                                    for (String s : size) {
                                        BCDetailBox getsize = arrsize.get(c.getCustomer_no() + s);
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

                                            Color = Utility.subsize(c.getCustomer_no().replace(c.getCustomer_size(), ""));
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



                                    if (num == 0) {

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
                                        num++;
                                    } else {

                                        txt += "[";
                                        txt += "{text: '',border: [false, false, false, false]},";
                                        txt += "{text: '" + Color + "',border: [false, false, false, false]},";
                                        txt += "{text: '" + i1.getPo() + "',border: [false, false, false, false]},";
                                        txt += sizetxt;
                                        txt += "{text: '" + DESTINATION + "',border: [false, false, false, false]},";
                                        txt += "{text: '',border: [false, false, false, false]},";
                                        txt += "{text: '" + (ctn * qty) + "',border: [false, false, false, false]},";
                                        txt += "{text: '',border: [false, false, false, false]},";
                                        txt += "{text: '',border: [false, false, false, false]},";
                                        txt += "],\n";

                                        totalqty += (ctn * qty);
                                        num++;

                                    }

                                    cut.add(c2);
                                }
                            }




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

                    txt += " [ ";
                    txt += " {text: 'TOTAL',border: [false, true, false, true]}, ";
                    txt += " {text: '', border: [false, true, false, true]}, ";
                    txt += " {text: '', border: [false, true, false, true]}, ";

                    for (String s : size) {
                        txt += " {text: '', border: [false, true, false, true]}, ";
                    }

                    txt += " {text: '', border: [false, true, false, true]}, ";
                    txt += " {text: '" + decimalFormat1.format(totalctn) + "',border: [false, true, false, true]}, ";
                    txt += " {text: '" + decimalFormat1.format(totalqty) + "',border: [false, true, false, true]}, ";
                    txt += " {text: '" + decimalFormat.format(totalnw) + "',border: [false, true, false, true]}, ";
                    txt += " {text: '" + decimalFormat.format(totalgw) + "',border: [false, true, false, true]}, ";
                    txt += " ], ";

                    // txt += "[{text: 'TOTAL',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '" + decimalFormat1.format(totalctn) + "',border: [false, true, false, true]},{text: '" + decimalFormat1.format(totalqty) + "',border: [false, true, false, true]},{text: '" + decimalFormat.format(totalnw) + "',border: [false, true, false, true]},{text: '" + decimalFormat.format(totalgw) + "',border: [false, true, false, true]}],";



                    datatable1 += txt;
                    /******************************  End table1 ********************************************/
                    /***************************** set table2 ***************************************/
                    String txt1 = "";
                    String conn = i1.getContainerno() == null ? "" : "Container no." + i1.getContainerno();
                    List<BCDetailBox> listtotalgroup = PackingListService.GroupCustomeSizeTotal(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox());
                    HashMap<String, String> sumqty = new HashMap<String, String>();
                    HashSet<String> dese = new HashSet<String>();
                    HashSet<String> allid = new HashSet<String>();
                    String data1 = "";
                    for (BCDetailBox l1 : listtotalgroup) {
                        String myid1 = Utility.subsize(l1.getCustomer_no());
                        String getdata = sumqty.get(myid1);

                        data1 = sumqty.get(myid1 + "#" + l1.getCustomer_size() + "#" + l1.getDestination());
                        int qt = 0;
                        if (data1 == null) {
                            sumqty.put(myid1 + "#" + l1.getCustomer_size() + "#" + l1.getDestination(), l1.getSumqty());

                        } else {
                            qt = Integer.parseInt(l1.getSumqty()) + Integer.parseInt(data1);
                            sumqty.put(myid1 + "#" + l1.getCustomer_size() + "#" + l1.getDestination(), String.valueOf(qt));

                        }
                        dese.add(l1.getDestination());

                    }
                    List<String> list = new ArrayList<String>(dese);
                    Collections.sort(list);
                    System.out.println(sumqty);

                    for (String d : list) {
                        for (BCDetailBox l : listtotalgroup) {

                            String myid2 = Utility.subsize(l.getCustomer_no());
                            String mfg = "";

                            if (i1.getMfg() != null) {
                                mfg = "(" + i1.getMfg() + ")";
                            }
                            if (!allid.contains(myid2 + d)) {
                                txt1 += "[";
                                txt1 += "{text: '" + myid2 + "',border: [false, false, false, false]},";
                                txt1 += "{text: '" + l.getPo() + " " + mfg + "\t\t\t " + Utility.Chacknull(d) + "',border: [false, false, false, false]},";
                                txt1 += "{text: '',border: [false, false, false, false]},";

                                int qtytotal = 0;
                                for (String s1 : size) {
                                    if (sumqty.get(myid2 + "#" + s1 + "#" + d) == null) {
                                        txt1 += "{text: '',border: [false, false, false, false]},";
                                    } else {
                                        txt1 += "{text: '" + sumqty.get(myid2 + "#" + s1 + "#" + d) + "',border: [false, false, false, false]},";
                                        qtytotal += Integer.parseInt(sumqty.get(myid2 + "#" + s1 + "#" + d));

                                    }

                                }

                                txt1 += "{text: '" + decimalFormat1.format(qtytotal) + "',border: [false, false, false, false]},";
                                txt1 += "{text: '',border: [false, false, false, false]},";
                                txt1 += "{text: '',border: [false, false, false, false]},";
                                txt1 += "{text: '',border: [false, false, false, false]},";
                                txt1 += "{text: '',border: [false, false, false, false]},";
                                txt1 += "],";

                                allid.add(myid2 + d);
                            }
                        }
                    }


                    List<BCDetailBox> listtotalgroupall = PackingListService.GroupCustomeSizeAllTotal(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox());
                    HashMap<String, String> sumsize = new HashMap<String, String>();

                    for (BCDetailBox k : listtotalgroupall) {
                        sumsize.put(k.getCustomer_size(), k.getSumqty());
                    }
                    System.out.println(sumsize);

                    txt1 += "[";
                    txt1 += "{text: 'TOTAL',border: [false, true, false, true]},";
                    txt1 += "{text: '',border: [false, true, false, true]},";

                    txt1 += "{text: '',border: [false, true, false, true]},";
                    int qtyall = 0;
                    for (String s : size) {
                        String sz = sumsize.get(s);
                        if (sz == null) {
                            txt1 += "{text: '',border: [false, true, false, true]},";
                        } else {
                            txt1 += "{text: '" + decimalFormat1.format(Integer.parseInt(sz)) + "',border: [false, true, false, true]},";
                            qtyall += Integer.parseInt(sz);
                        }
                    }
                    txt1 += "{text: '" + decimalFormat1.format(qtyall) + "',border: [false, true, false, true]},";
                    txt1 += "{text: ' " + conn + "',border: [false, false, false, false],alignment:'left', },";

                    txt1 += "{text: '',border: [false, false, false, false]},";
                    txt1 += "{text: '',border: [false, false, false, false]},";
                    txt1 += "{text: '',border: [false, false, false, false]},";

                    txt1 += "],";

                    datatable2 = txt1;
                    allpc += qtyall;

                    /***************************** End table2 ***************************************/
                    String style = "";
                    String woversize1 = "";
                    String woversize2 = "";
                    if (size.size() > 8) {
                        style = "tbcontentoversize";
                        woversize1 = "'auto','auto','auto'";
                        woversize2 = "'auto','auto','auto'";
                    } else {
                        style = "tbcontent";
                        woversize1 = "50,58,84";
                        woversize2 = "50,100,43";
                    }
    %>
                {
                    style: '<%=style%>',
                    table: {
                        headerRows: 1,
                        widths: [  <%=woversize1%>, <%=width%> 17,'auto', 'auto', 'auto' , 'auto'],
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
                                            
                                                    style: '<%=style%>',
                                                    table: {
                                                        headerRows: 1,
                                                        widths: [<%=woversize2%>, <%=width%> 'auto','auto', 'auto', 'auto' , 'auto'],
                                                            body: [
                                                                [
                                                                    {text: 'DESCRIPTION',border: [false, true, false, true]}, 
                                                                    {text: '', border: [false, true, false, true]}, 
                                                                    
                                                                    {text: 'SIZE', border: [false, true, false, true]},
                                                             <%=txtsize%>
                                                                     
                                                                                                 {text: 'TOTAL\n(PC)', border: [false, true, false, true]},
                                                                                                 {text: '', border: [false, false, false, false]},
                                                                                                 {text: '', border: [false, false, false, false]},
                                                                                                 {text: '', border: [false, false, false, false]},
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
                            fontSize:12,
                            bold: true,
                            margin: [45, 2] 
                        },
                        tbcontent: {
                            fontSize:11,
                            bold: true,
                            margin: [10, 2],
                            alignment:'center'                      
                        },
                        tbcontentoversize: {
                            fontSize:9,
                            bold: true,
                            margin: [10, 2],
                            alignment:'center'                      
                        }
                    },
                    defaultStyle: {
                        font: 'THSarabunNew',
                        fontSize: 13,
                        bold:true
                    }
                };
                pdfMake.createPdf(docDefinition).open({}, window); 
        
    
    
        </script>
    </body>
</html>