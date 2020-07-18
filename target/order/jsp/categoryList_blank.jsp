<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String errMsg = (String)session.getAttribute("errMsg");
	session.setAttribute("errMsg",null);
%>
<html>
<head>
	<title>Cuisine Category</title>
</head>

<body>
	<SCRIPT LANGUAGE="JavaScript1.2">
		adTime=5;  //关闭窗口等待的时间
		chanceAd=1;
		var ns=(document.layers);
		var ie=(document.all);
		var w3=(document.getElementById && !ie);
		adCount=0;
		function initAd(){
			if(!ns && !ie && !w3) return;
			if(ie)             adDiv=eval('document.all.sponsorAdDiv.style');
			else if(ns)        adDiv=eval('document.layers["sponsorAdDiv"]');
			else if(w3)        adDiv=eval('document.getElementById("sponsorAdDiv").style');
			randAd=Math.ceil(Math.random()*chanceAd);
			if (ie||w3)
				adDiv.visibility="visible";
			else
				adDiv.visibility ="show";
			if(randAd==1) showAd();
		}
		function showAd(){
			if(adCount<adTime*10){adCount+=1;
				if (ie){documentWidth  =document.body.offsetWidth/2+document.body.scrollLeft-20;
					documentHeight =document.body.offsetHeight/2+document.body.scrollTop-20;}
				else if (ns){documentWidth=window.innerWidth/2+window.pageXOffset-20;
					documentHeight=window.innerHeight/2+window.pageYOffset-20;}
				else if (w3){documentWidth=self.innerWidth/2+window.pageXOffset-20;
					documentHeight=self.innerHeight/2+window.pageYOffset-20;}
				adDiv.left=documentWidth-200;adDiv.top =documentHeight-200;
				setTimeout("showAd()",100);}else closeAd();
		}
		function closeAd(){
			if (ie||w3)
				adDiv.display="none";
			else
				adDiv.visibility ="hide";
		}
		onload=initAd;
	</script>
	<h2>菜品分类</h2>
	<input type = "button" value = "Add Category" onclick="window.location.href='/addCategory'">
	&nbsp;|&nbsp;
	<input type = "button" value = "Main Menu" onclick="window.location.href='/showMenus'">
	<%
		if(errMsg != null && !errMsg.equalsIgnoreCase("")){
			out.println("<div id='sponsorAdDiv'><br><font color=red>" + errMsg + "</font></div>");
	%>
	<%
		}
	%>
	<br><br>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<th>Category ID</th>
			<th>Category Name</th>
			<th>Operations</th>
		</tr>
		<c:forEach items="${categories}" var="category">
			<tr>
				<td align="center">${category.cid}</td>
				<td>${category.cname}</td>
				<td>
					<input type = "button" value = "Delete" onclick="javascript:if(confirm('Confirm${category.cname}?'))window.location.href='/deleteCategory/${category.cid}'">
					<input type = "button" value = "Update" onclick="window.location.href='/editCategory/${category.cid}'">
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>