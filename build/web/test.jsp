<%-- 
    Document   : test
    Created on : 12 ก.ย. 2566, 8:02:46
    Author     : pakutsing
--%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            try {
                List<String> sp = new ArrayList<String>();
                sp.add("Y111-02#Y#1");
                sp.add("Y111-02#Y#4");
                sp.add("Y111-02#Y#5");
                sp.add("Y111-02#Y#6");
                sp.add("Y111-02#Y#7");
                sp.add("Y111-02#Y#8");
                sp.add("Y111-02#Y#9");
                sp.add("Y111-02#Y#10");

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

                    Collections.sort(numbers); // เรียงลำดับตัวเลข

                    int start = numbers.get(0);
                    int end = numbers.get(0);
                    List<String> ranges = new ArrayList<String>();

                    for (int i = 1; i < numbers.size(); i++) {
                        if (numbers.get(i) == end + 1) {
                            end = numbers.get(i);
                        } else {
                            if (start == end) {
                                ranges.add("Y" + start);
                            } else {
                                ranges.add("Y" + start + "-" + "Y" + end);
                            }

                            start = end = numbers.get(i);
                        }
                    }

                    ranges.add(start == end ? "Y" + start : "Y" + start + "-" + "Y" + end);

                    StringBuilder result = new StringBuilder(key);
                    result.append(" ");
                    for (int j = 0; j < ranges.size(); j++) {
                        result.append(ranges.get(j));
                        if (j < ranges.size() - 1) {
                            result.append(", ");
                        }
                    }

                    System.out.println(result.toString());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }





        %>
    </body>
</html>
