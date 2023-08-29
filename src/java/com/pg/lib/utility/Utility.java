/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.utility;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author pakutsing
 */
public class Utility {

    public static String CoverDate(String txt) {

        String[] date = txt.split("-");
        String coverdate = date[2] + "/" + date[1] + "/" + date[0];

        //String[] date = txt.split("/");
        //String coverdate = date[2] + "-" + String.format("%2s", date[1]).replace(' ', '0') + "-" + String.format("%2s", date[0]).replace(' ', '0');
        return coverdate;
    }

    public static String GetDateNow() {

        Date currentDate = new Date();

        // Create a SimpleDateFormat instance with the desired pattern
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

        // Format the current date and time
        String formattedDate = outputDateFormat.format(currentDate);

        // Display the formatted date and time
        
        
        return formattedDate;
    }
}
