<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        console.log(xml);
                        
                        $(xml).find("item").each(function(){
                                //let name = $(this).find("dutyName").text();
                                //let hvec = $(this).find("hvec").text();
                                var dutyName = $(this).find("dutyName").text() +"<br/>";
                                var hvec = $(this).find("hvec").text() +"<br/>";
                                var hvgc = $(this).find("hvgc").text() +"<br/>";
                                var hvamyn = $(this).find("hvamyn").text() +"<br/>";
                                var dutyTel3 =  $(this).find("dutyTel3").text()+"<br/>";
                                var info = dutyName +"<br/>" + hvgc +"<br/>" +hvamyn +"<br/>" +hvec +"<br/>" +dutyTel3 +"<br/>" ;
                                $('#sel').append(info);
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