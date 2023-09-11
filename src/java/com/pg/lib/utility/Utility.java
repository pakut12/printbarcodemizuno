/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.utility;

import com.pg.lib.model.BCDetailBox;
import java.text.SimpleDateFormat;

import java.util.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author pakutsing
 */
public class Utility {

    public static String Chacknull(String txt) {

        if (txt == null) {
            txt = "";
        } 


        return txt;
    }

    public static String subsize(String cm) {
        String des = "";
        if (cm.contains(".")) {
            des = cm.substring(0, 11);
        } else {
            des = cm.substring(0, 10);
        }

        return des;

    }

    public static List<String> getallsize(String cm, List<BCDetailBox> listbox) {
        List<String> size = new ArrayList<String>();
        if (cm.equals("MUS") || cm.equals("MCL") || cm.equals("MOC")) {
            size.add("XXS");
            size.add("XS");
            size.add("S");
            size.add("M");
            size.add("L");
            size.add("XL");
            size.add("XXL");
            size.add("XXXL");

        } else {

            List<String> s = new ArrayList<String>();
            s.add("SS");
            s.add("S");
            s.add("M");
            s.add("L");
            s.add("O");
            s.add("XO");
            s.add("2XO");
            s.add("3XO");
            s.add("2XO-4");
            s.add("4XO-5");
            s.add("6XO-6");
            s.add("8XO-7");
            s.add("120");
            s.add("130");
            s.add("140");
            s.add("150");
            s.add("160");
            s.add("XL");
            s.add("2XL");
            s.add("3XL-8");
            s.add("4XL-8");
            s.add("6XL-8");
            s.add("8XL-8");
            s.add("XSS");
            s.add("XS");
            s.add("XXL");
            s.add("XXXL");



            for (BCDetailBox l : listbox) {
                if (!size.contains(l.getCustomer_size()) && size.size() < 8) {
                    size.add(l.getCustomer_size());
                }
            }

            for (String z : s) {
                if (!size.contains(z) && size.size() < 8) {
                    size.add(z);
                }
            }


        }
        return size;

    }

    public static String groupnumberbypo(List<BCDetailBox> grouppo) {
        String group = "";
        try {
            List<String> sp = new ArrayList<String>();

            for (BCDetailBox zx : grouppo) {
                String txt = zx.getPo() + "#" + zx.getFirstdigit() + "#" + zx.getBoxno().replace(zx.getFirstdigit(), "");
                sp.add(txt);
            }


            Map<String, List<Integer>> groupedData = new HashMap<String, List<Integer>>();

            for (String item : sp) {
                String[] parts = item.split("#");
                String prefix = parts[0];
                String type = parts[1];
                int number = Integer.parseInt(parts[2]);
                String key = prefix + "*" + type;

                if (!groupedData.containsKey(key)) {
                    groupedData.put(key, new ArrayList<Integer>());
                }

                groupedData.get(key).add(number);
            }

            for (Map.Entry<String, List<Integer>> entry : groupedData.entrySet()) {
                String key = entry.getKey();
                List<Integer> numbers = entry.getValue();

                int start = numbers.get(0);
                int end = numbers.get(0);
                List<String> ranges = new ArrayList<String>();

                for (int i = 1; i < numbers.size(); i++) {
                    if (numbers.get(i) == end + 1) {
                        end = numbers.get(i);
                    } else {
                        ranges.add(start == end ? String.valueOf(start) : start + "-" + end);
                        start = end = numbers.get(i);
                    }
                }

                ranges.add(start == end ? String.valueOf(grouppo.get(0).getFirstdigit() + start) : grouppo.get(0).getFirstdigit() + start + "-" + grouppo.get(0).getFirstdigit() + end);

                StringBuilder result = new StringBuilder(key);
                result.append("*");
                for (int j = 0; j < ranges.size(); j++) {
                    if (j > 0) {
                        result.append(", ");
                    }
                    result.append(ranges.get(j));
                }

                System.out.println(result.toString());

                group += "#" + result.toString();
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return group;
    }

    public static String groupnumber(List<BCDetailBox> grouppo) {
        String group = "";
        try {
            List<String> sp = new ArrayList<String>();

            for (BCDetailBox zx : grouppo) {
                String txt = zx.getPo() + "#" + zx.getFirstdigit() + "#" + zx.getBoxno().replace(zx.getFirstdigit(), "");
                sp.add(txt);
            }


            Map<String, List<Integer>> groupedData = new HashMap<String, List<Integer>>();

            for (String item : sp) {
                String[] parts = item.split("#");
                String prefix = parts[0];
                String type = parts[1];
                int number = Integer.parseInt(parts[2]);
                String key = prefix + " " + type;

                if (!groupedData.containsKey(key)) {
                    groupedData.put(key, new ArrayList<Integer>());
                }

                groupedData.get(key).add(number);
            }

            for (Map.Entry<String, List<Integer>> entry : groupedData.entrySet()) {
                String key = entry.getKey();
                List<Integer> numbers = entry.getValue();

                int start = numbers.get(0);
                int end = numbers.get(0);
                List<String> ranges = new ArrayList<String>();

                for (int i = 1; i < numbers.size(); i++) {
                    if (numbers.get(i) == end + 1) {
                        end = numbers.get(i);
                    } else {
                        ranges.add(start == end ? String.valueOf(start) : start + "-" + end);
                        start = end = numbers.get(i);
                    }
                }

                ranges.add(start == end ? String.valueOf(grouppo.get(0).getFirstdigit() + start) : grouppo.get(0).getFirstdigit() + start + "-" + grouppo.get(0).getFirstdigit() + end);

                StringBuilder result = new StringBuilder(key);
                result.append(" ");
                for (int j = 0; j < ranges.size(); j++) {
                    if (j > 0) {
                        result.append(", ");
                    }
                    result.append(ranges.get(j));
                }

                System.out.println(result.toString());

                group = result.toString().replace(grouppo.get(0).getPo() + " " + grouppo.get(0).getFirstdigit(), "");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return group;
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
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.ENGLISH);

        // Format the current date and time
        String formattedDate = outputDateFormat.format(currentDate);

        // Display the formatted date and time


        return formattedDate;
    }
}
