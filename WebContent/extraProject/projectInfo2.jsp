<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../projectInc/header.jsp"%>

<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>

						  
						<table class="table table-hover">
		    				<colgroup>
		    					<col width = "10%"/>
		    					<col width = "15%"/>
		    					<col width = "60%"/>
		    					<col width = "15%"/>
		    				</colgroup>
						  <thead>
						    <tr>
								<th scope="col">병원명</th>
								<th scope="col">응급실</th>
								<th scope="col">입원실</th>
								<th scope="col">구급차</th>
								<th scope="col">전화</th>
						    </tr>
						    
						  </thead>
						  <tbody id="table_body">
						 
						  </tbody>
						</table>	
						<%for(int i=1;i<=21;i++){ %>
						[<a href="javascript:call('i')"><%=i %></a>]
						<%} %>
						 <script>
						  
						  var address = encodeURIComponent('http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire?serviceKey=s5f25rkgZmeg3PC1sixLX7%2B6iWHyi5W7jVhufWw0NYq%2BY2HbEP7J4FhyMqcfxQYsa8g0yvJVPujXtpVAMtUoWg%3D%3D&STAGE1=&STAGE2=&pageNo=1&numOfRows=20&');
				            
				            // console.log(address);
				            
				        
				            $.ajax({
				                url : 'projectProxy.jsp?url='+address,
				                type : 'GET',
				                dataType : 'xml',
				                error : function(){
				                    alert('error');
				                },
				                success : function(xml){
										
				                	
				                	let message = "";
				                	  $(xml).find("item").each(function(){  
				                		  message += "<tr>";
			                                var dutyName = $(this).find("dutyName").text();
			                                var hvec = $(this).find("hvec").text();
			                                var hvgc = $(this).find("hvgc").text();
			                                var hvamyn = $(this).find("hvamyn").text();
			                                var dutyTel3 =  $(this).find("dutyTel3").text(); 
			                                message += "<td>"+dutyName+"</td>";
			                                message += "<td>"+hvec+"</td>";
			                                message += "<td>"+hvgc+"</td>";
			                                message += "<td>"+hvamyn+"</td>";
			                                message += "<td>"+dutyTel3+"</td>";
			                                message += "</tr>";
				                	  });   
				                	  
				                	  $("#table_body").empty();
				                	  $("#table_body").append(message);
				                	  
			                               
				                }    
	    
			                                
				                
				            });  
				            
				            function call(p){
				            	 var address = encodeURIComponent('http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire?serviceKey=s5f25rkgZmeg3PC1sixLX7%2B6iWHyi5W7jVhufWw0NYq%2BY2HbEP7J4FhyMqcfxQYsa8g0yvJVPujXtpVAMtUoWg%3D%3D&STAGE1=&STAGE2=&pageNo='+p+'&numOfRows=20&');
						            
						         
				            	$.ajax({
					                url : 'projectProxy.jsp?url='+address,
					                type : 'GET',
					                dataType : 'xml',
					                error : function(){
					                    alert('error');
					                },
					                success : function(xml){
											
					                	
					                	let message = "";
					                	  $(xml).find("item").each(function(){  
					                		  message += "<tr>";
				                                var dutyName = $(this).find("dutyName").text();
				                                var hvec = $(this).find("hvec").text();
				                                var hvgc = $(this).find("hvgc").text();
				                                var hvamyn = $(this).find("hvamyn").text();
				                                var dutyTel3 =  $(this).find("dutyTel3").text(); 
				                                message += "<td>"+dutyName+"</td>";
				                                message += "<td>"+hvec+"</td>";
				                                message += "<td>"+hvgc+"</td>";
				                                message += "<td>"+hvamyn+"</td>";
				                                message += "<td>"+dutyTel3+"</td>";
				                                message += "</tr>";
					                	  });   
					                	  
					                	  $("#table_body").empty();
					                	  $("#table_body").append(message);
					                	  
				                               
					                }    
		    
				                                
					                
					            });  
					            
				            }
						  </script>