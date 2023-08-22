<%-- 
    Document   : packinglist
    Created on : 17 ส.ค. 2566, 11:43:50
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
            String invoiceno = "7392300095"; //request.getParameter("invoiceno").trim();

            String invoicedate = "2023-06-26";
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
                    pageMargins: [ 40, 70, 30, 40 ],
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
                                        text: [{text:'THAI SPORTS GARMENT CO.LTD',bold:true,fontSize:15},{text:'\n666 RAMA 3 ROAD,YANNAWA, BANGKOK 10120 THAILAND',bold:false,fontSize:12}],
                                        margin: [40, 10]
                                    },
                                    { 
                                        width: '*',
                                        alignment: 'left',
                                        text: 'PACKING LIST', 
                                        decoration: 'underline', 
                                        decorationStyle: 'double' ,
                                        bold:true,
                                        margin: [40, 10]
                                    },
                                    {
                                        width: '*',
                                        alignment: 'right',
                                        text: 'Page : '+currentPage,
                                        margin: [20, 10]
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
                                    text:'TERMS OF PAYMENY : T/T : SAVING NO.1140933894',
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
                                    width: '*',
                                    text:'\t\t\tBUKKHALO BRANCH,THAILAND',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'MUS\nNORCROSS,GA\nVIA DOWNEY,CA',
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
                                    text:'PO.NO.',
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
                                    text:'CTN.NO.',
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
                                    text:'SHIP PER : CCNI ANGOL V327W',
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
                                    text:'FROM : LAEM CHABANG,THAILAND',
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
                                    text:'TO : ATLANTA,USA',
                                    alignment: 'center'
                                }
                            ]
                        },
                    
                      <%


            try {


                List<BCDetailBox> listpo = PackingListService.getPOByInvoicenoandInvoiceDate(invoiceno, Utility.CoverDate(invoicedate));


                // for (BCDetailBox c : listpo) {
                String arrbox = "";
                String arrboxtotal = "";

                List<BCDetailBox> list = PackingListService.getPackingListByPO("173332-OP", "M");
                List<BCDetailBox> Grouplist = PackingListService.GroupCustomerNoByPO("173332-OP", "M");

                int sumctn = 0;
                int sumqty = 0;
                double sumnw = 0;
                double sumgw = 0;

                for (BCDetailBox g : Grouplist) {

                    List<BCDetailBox> listbycolor = PackingListService.getPackingListCustomerColorByPO("173332-OP", "M", g.getCustomer_color());
                    arrboxtotal += "\n[";
                    arrboxtotal += "{text: '" + g.getCustomer_color() + "', border: [false, false, false, false]},";
                    arrboxtotal += "{text: '" + g.getPo() + "', border: [false, false, false, false]},";
                    arrboxtotal += "{text: '', border: [false, false, false, false]},";


                    System.out.println(listbycolor.size());

                    String[] size = {"XXS", "XS", "S", "M", "L", "XL", "XXL", "XXXL"};

                    for (BCDetailBox l : listbycolor) {
                        if (l.getCustomer_color().equals("0010")) {

                            if (l.getCustomer_size().equals("XXS")) {

                                if (l.getSku_item1().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                                }

                            } else if (l.getCustomer_size().equals("XS")) {

                                if (l.getSku_item1().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                                }
                            } else if (l.getCustomer_size().equals("S")) {
                                if (l.getSku_item1().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                                }
                            } else if (l.getCustomer_size().equals("M")) {
                                if (l.getSku_item1().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                                }
                            } else if (l.getCustomer_size().equals("L")) {
                                if (l.getSku_item1().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                                }
                            } else if (l.getCustomer_size().equals("XL")) {
                                if (l.getSku_item1().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                                }
                            } else if (l.getCustomer_size().equals("XXL")) {
                                if (l.getSku_item1().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                                }
                            } else if (l.getCustomer_size().equals("XXXL")) {
                                if (l.getSku_item1().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";

                                } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                                    arrboxtotal += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                                }
                            }else{
                                arrboxtotal += "  {text: '', border: [false, false, false, false]},";
                            }
                        }

                    }


                    arrboxtotal += "  {text: '', border: [false, false, false, false]},";
                    arrboxtotal += "],\n";


                }

                for (BCDetailBox l : list) {
                    String BOXSTART = l.getFirstdigit() + l.getStartbox();
                    String BOXEND = l.getFirstdigit() + l.getEndbox();
                    String CTNNO = "";

                    if (BOXSTART.equals(BOXEND)) {
                        CTNNO = BOXSTART;
                    } else {
                        CTNNO = BOXSTART + "-" + BOXEND;
                    }

                    String DESC = l.getCustomer_no();
                    String PO = l.getPo();


                    arrbox += "[";
                    arrbox += "  {text: '" + CTNNO + "',border: [false, false, false, false]},";
                    arrbox += "  {text: '" + DESC + "', border: [false, false, false, false]},";
                    arrbox += "  {text: '" + PO + "', border: [false, false, false, false]},";

                    if (l.getCustomer_size().equals("XXS")) {
                        if (l.getSku_item1().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '" + l.getQty1() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";




                        } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '" + l.getQty2() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '" + l.getQty3() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '" + l.getQty4() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        }

                    } else if (l.getCustomer_size().equals("XS")) {
                        if (l.getSku_item1().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty1() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                        } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty2() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty3() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty4() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        }

                    } else if (l.getCustomer_size().equals("S")) {
                        if (l.getSku_item1().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty1() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                        } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty2() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty3() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty4() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        }

                    } else if (l.getCustomer_size().equals("M")) {
                        if (l.getSku_item1().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty1() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                        } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty2() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty3() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty4() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        }

                    } else if (l.getCustomer_size().equals("L")) {
                        if (l.getSku_item1().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty1() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                        } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty2() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty3() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty4() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        }

                    } else if (l.getCustomer_size().equals("XL")) {
                        if (l.getSku_item1().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty1() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                        } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty2() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty3() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty4() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        }

                    } else if (l.getCustomer_size().equals("XXL")) {
                        if (l.getSku_item1().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty1() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                        } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty2() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty3() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty4() + "', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";

                        }

                    } else if (l.getCustomer_size().equals("XXXL")) {
                        if (l.getSku_item1().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty1() + "', border: [false, false, false, false]},";
                        } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty2() + "', border: [false, false, false, false]},";

                        } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty3() + "', border: [false, false, false, false]},";

                        } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '', border: [false, false, false, false]},";
                            arrbox += "  {text: '" + l.getQty4() + "', border: [false, false, false, false]},";

                        }

                    }



                    arrbox += "  {text: '" + l.getCtn() + "', border: [false, false, false, false]},";
                    sumctn += Integer.parseInt(l.getCtn());


                    if (l.getSku_item1().equals(l.getCustomer_no())) {
                        arrbox += "  {text: '" + l.getSumqty1() + "', border: [false, false, false, false]},";
                        sumqty += Integer.parseInt(l.getSumqty1());
                    } else if (l.getSku_item2().equals(l.getCustomer_no())) {
                        arrbox += "  {text: '" + l.getSumqty2() + "', border: [false, false, false, false]},";
                        sumqty += Integer.parseInt(l.getSumqty2());
                    } else if (l.getSku_item3().equals(l.getCustomer_no())) {
                        arrbox += "  {text: '" + l.getSumqty3() + "', border: [false, false, false, false]},";
                        sumqty += Integer.parseInt(l.getSumqty3());
                    } else if (l.getSku_item4().equals(l.getCustomer_no())) {
                        arrbox += "  {text: '" + l.getSumqty4() + "', border: [false, false, false, false]},";
                        sumqty += Integer.parseInt(l.getSumqty4());
                    }

                    arrbox += "  {text: '" + String.format("%.2f", Double.parseDouble(l.getSumnw())) + "', border: [false, false, false, false]},";
                    arrbox += "  {text: '" + String.format("%.2f", Double.parseDouble(l.getSumgw())) + "', border: [false, false, false, false]},";
                    sumnw += Double.parseDouble(l.getSumnw());
                    sumgw += Double.parseDouble(l.getSumgw());

                    arrbox += " ],";


                }

                DecimalFormat formatter = new DecimalFormat("#,###");

                arrbox += "[";
                arrbox += "{text: 'TOTAL',border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]}, ";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '', border: [false, true, false, true]},";
                arrbox += "{text: '" + formatter.format(sumctn) + "', border: [false, true, false, true]},";
                arrbox += "{text: '" + formatter.format(sumqty) + "', border: [false, true, false, true]},";
                arrbox += "{text: '" + String.format("%.2f", sumnw) + "', border: [false, true, false, true]},";
                arrbox += "{text: '" + String.format("%.2f", sumgw) + "', border: [false, true, false, true]},";
                arrbox += "],";


                 %>
                 
                 
           
                             {
                                 style: 'tbcontent',
                                 table: {
                                     headerRows: 1,
                                     widths: [ '*', 'auto','*', 'auto', 'auto','auto', 'auto','auto', 'auto', 'auto','auto', 'auto','auto', 'auto', 'auto' ],
                                     body: [
                                         [
                                             {text: 'CTN.\nNO.',border: [false, true, false, true]}, 
                                             {text: 'DESCRIPTION', border: [false, true, false, true]}, 
                                             {text: 'PO', border: [false, true, false, true]},
                                             {text: '.02\nXXS', border: [false, true, false, true]},
                                             {text: '.03\nXS', border: [false, true, false, true]},
                                             {text: '.04\nS', border: [false, true, false, true]},
                                             {text: '.05\nM', border: [false, true, false, true]},
                                             {text: '.06\nL', border: [false, true, false, true]},
                                             {text: '.07\nXL', border: [false, true, false, true]},
                                             {text: '.08\nXXL', border: [false, true, false, true]},
                                             {text: '.09\nXXXL', border: [false, true, false, true]},
                                             {text: 'TOTAL\nCTN.', border: [false, true, false, true]},
                                             {text: '\nQTY', border: [false, true, false, true]},
                                             {text: 'WEIGHT\nN.W.', border: [false, true, false, true]},
                                             {text: '\nG.W.', border: [false, true, false, true]},
                                         ],
                                <%=arrbox%>
                                
                                                    ]
                                                }
                        
                                            },
                                            {
                                                style: 'tbcontent',
                                                table: {
                                                    headerRows: 1,
                                                    widths: [ '*', 'auto','*', 'auto', 'auto','auto', 'auto','auto', 'auto', 'auto','auto', 'auto' ],
                                                    body: [
                                                        [
                                                            {text: 'DESCRIPTION',border: [false, true, false, true]}, 
                                                            {text: '', border: [false, true, false, true]}, 
                                                            {text: '\nSIZE', border: [false, true, false, true]},
                                                            {text: '.02\nXXS', border: [false, true, false, true]},
                                                            {text: '.03\nXS', border: [false, true, false, true]},
                                                            {text: '.04\nS', border: [false, true, false, true]},
                                                            {text: '.05\nM', border: [false, true, false, true]},
                                                            {text: '.06\nL', border: [false, true, false, true]},
                                                            {text: '.07\nXL', border: [false, true, false, true]},
                                                            {text: '.08\nXXL', border: [false, true, false, true]},
                                                            {text: '.09\nXXXL', border: [false, true, false, true]},
                                                            {text: 'TOTAL\n(PC)', border: [false, true, false, true]},
                                             
                                                        ],
                                <%=arrboxtotal%>
                                
                                                    ]
                                                }
                        
                                            },
                                             <%
            // }

            } catch (Exception e) {
                e.printStackTrace();
            }


        %>
                            
                    
                ],
                styles: {
                    headercontent: {
                        fontSize: 13,
                        bold: true,
                        margin: [45, 2] 
                    },
                    
                    tbcontent: {
                        fontSize: 12,
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
            pdfMake.createPdf(docDefinition).open({}, window); 
        
    
    
        </script>
    </body>
</html>
