/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.utility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class Utility {

    public static List<String> getRanges(List<String> list) {
        List<String> ranges = new ArrayList<String>();

        if (list.isEmpty()) {
            return ranges;
        }

        int startIdx = 0;
        for (int i = 1; i < list.size(); i++) {
            String current = list.get(i);
            String prev = list.get(i - 1);

            if (!isSuccessive(prev, current)) {
                ranges.add(formatRange(list.get(startIdx), prev));
                startIdx = i;
            }
        }

        ranges.add(formatRange(list.get(startIdx), list.get(list.size() - 1)));
        return ranges;
    }

    public static boolean isSuccessive(String a, String b) {
        int aValue = Integer.parseInt(a.substring(1));
        int bValue = Integer.parseInt(b.substring(1));
        return bValue - aValue == 1;
    }

    public static String formatRange(String start, String end) {
        return start + " - " + end;
    }

    public static String CoverDateFromSql(Date date, int status) {
        String redate = "";
        if (status == 1) {
            SimpleDateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");

            if (date == null) {
                redate = "";
            } else {
                redate = dateformat.format(date);
            }

        } else if (status == 2) {
            SimpleDateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

            if (date == null) {
                redate = "";
            } else {
                redate = dateformat.format(date);
            }
        }

        return redate;
    }

    public static String CoverDate(String txt) {

        String[] date = txt.split("-");
        String coverdate = date[2] + "/" + date[1] + "/" + date[0];

        //String[] date = txt.split("/");
        //String coverdate = date[2] + "-" + String.format("%2s", date[1]).replace(' ', '0') + "-" + String.format("%2s", date[0]).replace(' ', '0');
        return coverdate;
    }

    public static String CoverDatetoInput(String txt) {

        String[] date = txt.split("/");
        String coverdate = date[2] + "-" + date[1] + "-" + date[0];

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
