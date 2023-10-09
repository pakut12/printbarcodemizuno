







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
                                text: 'TESTBYGUS',
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
                                    text:'INVOICE NO. TESTBYGUS',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'DATED 16/09/2023' 
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
                                    text:'TERMS OF PAYMENY : T/T : SAVING NO. 1140933894',
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
                                    text:'MC\n\n',
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
                                    text:' PO.NO. 311TBS1',
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
                                    text:'CTN.NO. G1-G17',
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
                                    text:'FINAL DESTINATION : ADC.ODC',
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
                                    text:'SHIP PER : ASDASD',
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
                                    text:'FROM : ASDASD',
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
                                    text:'TO :  ASDASD',
                                    alignment: 'center'
                                }
                            ]
                        },
               
    
    
                {
                    style: 'tbcontent',
                    table: {
                        headerRows: 1,
                        widths: [ 50, 58,84, 'auto','auto','auto','auto','auto','auto','auto','auto','auto', 17,'auto', 'auto', 'auto' , 'auto'],
                            body: [
                                [
                                    {text: 'CTN.\nNO.',border: [false, true, false, true]}, 
                                    {text: 'DESCRIPTION', border: [false, true, false, true]}, 
                                    {text: 'PO', border: [false, true, false, true]},
                                 
                                {text: 'SS', border: [false, true, false, true]},{text: 'S', border: [false, true, false, true]},{text: 'M', border: [false, true, false, true]},{text: 'O', border: [false, true, false, true]},{text: 'XO', border: [false, true, false, true]},{text: '2XO', border: [false, true, false, true]},{text: '4XO-5', border: [false, true, false, true]},{text: '6XO-6', border: [false, true, false, true]},{text: '8XO-7', border: [false, true, false, true]},
                                                                {text: '', border: [false, true, false, true]},
                                                                {text: 'TOTAL\nCTN.', border: [false, true, false, true]},
                                                                {text: '\nQTY', border: [false, true, false, true]},
                                                                {text: 'WEIGHT\nN.W.', border: [false, true, false, true]},
                                                                {text: '\nG.W.', border: [false, true, false, true]},
                                                            ],
                                [{text: ' G1',border: [false, false, false, false]},{text: 'G2JCB21525',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '9.10',border: [false, false, false, false]},{text: '10.40',border: [false, false, false, false]},],
[{text: ' G2',border: [false, false, false, false]},{text: 'G2JCB21525',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '9.60',border: [false, false, false, false]},{text: '10.90',border: [false, false, false, false]},],
[{text: ' G3',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '0',border: [false, false, false, false]},{text: '0',border: [false, false, false, false]},{text: '0.00',border: [false, false, false, false]},{text: '0.00',border: [false, false, false, false]},],
[{text: ' G4',border: [false, false, false, false]},{text: 'G2JCB21525',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '10.50',border: [false, false, false, false]},{text: '11.80',border: [false, false, false, false]},],
[{text: ' G5',border: [false, false, false, false]},{text: 'G2JCB21525',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '28',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '28',border: [false, false, false, false]},{text: '11.00',border: [false, false, false, false]},{text: '12.30',border: [false, false, false, false]},],
[{text: ' G6',border: [false, false, false, false]},{text: 'G2JCB21525',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '20',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '20',border: [false, false, false, false]},{text: '7.70',border: [false, false, false, false]},{text: '9.00',border: [false, false, false, false]},],
[{text: ' G7',border: [false, false, false, false]},{text: 'G2JCB21525',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '2',border: [false, false, false, false]},{text: '5',border: [false, false, false, false]},{text: '5',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '12',border: [false, false, false, false]},{text: '4.60',border: [false, false, false, false]},{text: '5.90',border: [false, false, false, false]},],
[{text: ' G8-G9',border: [false, false, false, false]},{text: 'G2JCB21545',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '9.60',border: [false, false, false, false]},{text: '10.90',border: [false, false, false, false]},],
[{text: ' G10',border: [false, false, false, false]},{text: 'G2JCB21545',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '29',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '29',border: [false, false, false, false]},{text: '9.70',border: [false, false, false, false]},{text: '11.00',border: [false, false, false, false]},],
[{text: ' G11',border: [false, false, false, false]},{text: 'G2JCB21545',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '20',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '9.70',border: [false, false, false, false]},{text: '11.00',border: [false, false, false, false]},],
[{text: ' G12',border: [false, false, false, false]},{text: 'G2JCB21545',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '9',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '19',border: [false, false, false, false]},{text: '7.80',border: [false, false, false, false]},{text: '9.10',border: [false, false, false, false]},],
[{text: ' G13',border: [false, false, false, false]},{text: 'G2JCB21561',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '29',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '29',border: [false, false, false, false]},{text: '9.50',border: [false, false, false, false]},{text: '10.80',border: [false, false, false, false]},],
[{text: ' G14',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '0',border: [false, false, false, false]},{text: '0',border: [false, false, false, false]},{text: '0.00',border: [false, false, false, false]},{text: '0.00',border: [false, false, false, false]},],
[{text: ' G15',border: [false, false, false, false]},{text: 'G2JCB21561',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '10.50',border: [false, false, false, false]},{text: '11.80',border: [false, false, false, false]},],
[{text: ' G16',border: [false, false, false, false]},{text: 'G2JCB21561',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '20',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '9.70',border: [false, false, false, false]},{text: '11.00',border: [false, false, false, false]},],
[{text: ' G17',border: [false, false, false, false]},{text: 'G2JCB21561',border: [false, false, false, false]},{text: '311TBS1',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: 'ODC',border: [false, false, false, false]},{text: '1',border: [false, false, false, false]},{text: '20',border: [false, false, false, false]},{text: '6.80',border: [false, false, false, false]},{text: '8.10',border: [false, false, false, false]},],
[{text: 'TOTAL',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '14',border: [false, true, false, true]},{text: '367',border: [false, true, false, true]},{text: '125.80',border: [false, true, false, true]},{text: '144.00',border: [false, true, false, true]}],
                                
                                                        ]
                                                    }
                        
                                                },
                                                {
                                            
                                                    style: 'tbcontent',
                                                    table: {
                                                        headerRows: 1,
                                                        widths: [ 50, 100,43, 'auto','auto','auto','auto','auto','auto','auto','auto','auto', 'auto','auto', 'auto', 'auto' , 'auto'],
                                                            body: [
                                                                [
                                                                    {text: 'DESCRIPTION',border: [false, true, false, true]}, 
                                                                    {text: '', border: [false, true, false, true]}, 
                                                                    
                                                                    {text: 'SIZE', border: [false, true, false, true]},
                                                             {text: 'SS', border: [false, true, false, true]},{text: 'S', border: [false, true, false, true]},{text: 'M', border: [false, true, false, true]},{text: 'O', border: [false, true, false, true]},{text: 'XO', border: [false, true, false, true]},{text: '2XO', border: [false, true, false, true]},{text: '4XO-5', border: [false, true, false, true]},{text: '6XO-6', border: [false, true, false, true]},{text: '8XO-7', border: [false, true, false, true]},
                                                                     
                                                                                                 {text: 'TOTAL\n(PC)', border: [false, true, false, true]},
                                                                                                 {text: '', border: [false, false, false, false]},
                                                                                                 {text: '', border: [false, false, false, false]},
                                                                                                 {text: '', border: [false, false, false, false]},
                                                                                                 {text: '', border: [false, false, false, false]},
                                                                                             ],
                        
                                                            [{text: 'G2JCB21525',border: [false, false, false, false]},{text: '311TBS1 			 ODC',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '28',border: [false, false, false, false]},{text: '20',border: [false, false, false, false]},{text: '2',border: [false, false, false, false]},{text: '5',border: [false, false, false, false]},{text: '5',border: [false, false, false, false]},{text: '150',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},],[{text: 'G2JCB21545',border: [false, false, false, false]},{text: '311TBS1 			 ODC',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '20',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '29',border: [false, false, false, false]},{text: '9',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '108',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},],[{text: 'G2JCB21561',border: [false, false, false, false]},{text: '311TBS1 			 ODC',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '20',border: [false, false, false, false]},{text: '29',border: [false, false, false, false]},{text: '30',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '10',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '109',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},],[{text: 'TOTAL',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '20',border: [false, true, false, true]},{text: '70',border: [false, true, false, true]},{text: '89',border: [false, true, false, true]},{text: '89',border: [false, true, false, true]},{text: '47',border: [false, true, false, true]},{text: '40',border: [false, true, false, true]},{text: '2',border: [false, true, false, true]},{text: '5',border: [false, true, false, true]},{text: '5',border: [false, true, false, true]},{text: '367',border: [false, true, false, true]},{text: ' ',border: [false, false, false, false],alignment:'left', },{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},{text: '',border: [false, false, false, false]},],

                                
                                                                                        ]
                                                                                    }
                        
                                                                                },
                                                
            
    
    
    
                
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
                                    text: '\t 367   PC',
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
                                    text: '\t:\t    14  CARTONS',
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
                                    text: '\t:\t   125.80  KGS.(NET WEIGHT)',
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
                                    text: '\t:\t   144.00  KGS.(GROSS WEIGHT)',
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
                            fontSize: 5,
                            bold: true,
                            margin: [45, 2] 
                        },
                    
                        tbcontent: {
                            fontSize: 5,
                            bold: true,
                            margin: [10, 2],
                            alignment:'center'                      
                        }
                    
                    },
                    defaultStyle: {
                        font: 'THSarabunNew',
                        fontSize: 5,
                        bold:true
                    }
                };
                pdfMake.createPdf(docDefinition).open({}, window); 
        
    
    
        </script>
    </body>
</html>