<%-- 
    Document   : footer
    Created on : 25 ม.ค. 2566, 14:51:21
    Author     : pakutsing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<script>
    
    $('input:not(#formlogin input, #formadduser input, #formedituser input,input[type=date])').keyup(function(e) {
        var regex = /[ก-๙]/;
       
        if(regex.test(this.value)){
            this.value = this.value.replace(regex,"").trim();
        }else{
            this.value = this.value.toUpperCase().trim();
        }
        
    });
    
</script>
<div id="footer-style">
    <p class="text-center mt-3" >Copyright © People's garment public Co.Ltd. 666 Rama3 Bangpongpang Yannawa Bangkok 10120 Tel. 02-685-6500 Fax. 02-294-5159</p>
</div>
