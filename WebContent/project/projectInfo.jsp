<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../projectInc/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
</head>
<script>
   

    $(function(){
            var address = encodeURIComponent('http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire?serviceKey=s5f25rkgZmeg3PC1sixLX7%2B6iWHyi5W7jVhufWw0NYq%2BY2HbEP7J4FhyMqcfxQYsa8g0yvJVPujXtpVAMtUoWg%3D%3D&STAGE1=&STAGE2=&pageNo=1&numOfRows=1000&');
            
            // console.log(address);
            
        $('#btn').click(function(){
            $.ajax({
                url : 'projectProxy.jsp?url='+address,
                type : 'GET',
                dataType : 'xml',
                error : function(){
                    alert('error');
                },
                success : function(xml){
                                               
                        $(xml).find("item").each(function(){
                                //let name = $(this).find("dutyName").text();
                                //let hvec = $(this).find("hvec").text();
                                var datas = xml.getElementsByTagName("dutyName");
                                var datas2 = xml.getElementsByTagName("hvec");
                                var datas3 = xml.getElementsByTagName("hvgc");
                                var datas4 = xml.getElementsByTagName("hvamyn");
                                var datas5 = xml.getElementsByTagName("dutyTel3");
                                var output = "";
                                
                                for(var i=0;i<datas.length;i++){
                                	var total=new XMLSerializer().serializeToString(datas[i])
                                			+ new XMLSerializer().serializeToString(datas2[i])
                                			+ new XMLSerializer().serializeToString(datas3[i])
                                			+ new XMLSerializer().serializeToString(datas4[i])
                                			+ new XMLSerializer().serializeToString(datas5[i]);
                                	document.write(total);
                                	//console.log(new XMLSerializer().serializeToString(datas[0])); 
                                	//document.write(xml.stringify(datas[i])); 
                                	//document.write(datas[i]);
                                }
                                /*
                                var dutyName = $(this).find("dutyName").text() +"<br/>";
                                var hvec = $(this).find("hvec").text() +"<br/>";
                                var hvgc = $(this).find("hvgc").text() +"<br/>";
                                var hvamyn = $(this).find("hvamyn").text() +"<br/>";
                                var dutyTel3 =  $(this).find("dutyTel3").text()+"<br/>";
                                var info = dutyName +"<br/>" + hvgc +"<br/>" +hvamyn +"<br/>" +hvec +"<br/>" +dutyTel3 +"<br/>" ;
                                $('#sel').append(info);*/
                        });    
                }
            });       
        });
    });
</script>
<body>
 <button id = "btn">가져오기</button>
    <div id="sel">

    </div>
</body>
</html>