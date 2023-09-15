/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.*;
import com.sap.mw.jco.IFunctionTemplate;
import com.sap.mw.jco.JCO;

import com.pg.lib.utility.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class SapService {

    public static List<BCSap> GetCustomerMat(String VKORG, String VTWEG, String LKUNNR, String HKUNNR, String LKDMAT, String HKDMAT, String LWERKS, String HWERKS) {
        List<BCSap> listmat = new ArrayList<BCSap>();
        int numrow = 0;
        try {
            JCO.Client client = ConnectSap.createpool();

            String version = JCO.getVersion();

            System.out.println("SAP : " + version);

            JCO.Repository repository = new JCO.Repository("Myrep", client);
            IFunctionTemplate ftemplate1 = repository.getFunctionTemplate("ZRFC_TSG_LIST_MAT");
            JCO.Function function1 = new JCO.Function(ftemplate1);
            JCO.ParameterList input1 = function1.getImportParameterList();

            input1.setValue(VKORG, "VKORG");
            input1.setValue(VTWEG, "VTWEG");
            input1.setValue(LKUNNR, "LKUNNR");
            input1.setValue(HKUNNR, "HKUNNR");
            input1.setValue(LKDMAT, "LKDMAT");
            input1.setValue(HKDMAT, "HKDMAT");
            input1.setValue(LWERKS, "LWERKS");
            input1.setValue(HWERKS, "HWERKS");

            client.execute(function1);

            JCO.Table output = function1.getTableParameterList().getTable("ITAB_LISTMAT");

            int numColumns = output.getFieldCount();
            numrow = output.getNumRows();

            System.out.println("C : " + numColumns);
            System.out.println("R" + HWERKS + " : " + numrow);

            int a = 0;
            while (a < numrow) {
                output.setRow(a);
                //System.out.println("Row: " + String.valueOf(output.getRow()));


                int n = 0;
                while (n < numColumns) {
                    System.out.println(output.getName(n) + " : " + output.getString(n));
                    n++;
                }

                BCSap sap = new BCSap();
                sap.setKDMAT(output.getString(0));
                sap.setCOLOR(output.getString(1));
                sap.setSIZES(output.getString(2));
                sap.setUPCCODE(output.getString(3));
                sap.setMATNR(output.getString(4));
                sap.setMAKTX(output.getString(5));
                sap.setKUNNR(output.getString(6));
                sap.setNAME1(output.getString(7));
                sap.setWERKS(output.getString(8));
                sap.setPOSTX(output.getString(9));
                listmat.add(sap);

                System.out.println("------------------------------------------------------------------");
                a++;
            }


        /*
        int n = 0;
        while (n < numrow) {
        output.setRow(n);
        BCSap sap = new BCSap();
        sap.setKDMAT(output.getString("KDMAT"));
        sap.setCOLOR(output.getString("COLOR"));
        sap.setSIZES(output.getString("SIZES"));
        sap.setUPCCODE(output.getString("UPCCODE"));
        sap.setMATNR(output.getString("MATNR"));
        sap.setMAKTX(output.getString("MAKTX"));
        sap.setKUNNR(output.getString("KUNNR"));
        sap.setNAME1(output.getString("NAME1"));
        sap.setWERKS(output.getString("WERKS"));
        listmat.add(sap);
        
        }
        System.out.println("NUMROWS : " + listmat.size());
         */
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listmat;
    }
}