<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<title>Update Categories</title>
	<style>
		input.none {border:none}
		select.none {border:none}
	</style>
</head>

<body>
	<h2>Update Categories</h2>

	<form action="/saveCategory" method = "post">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>Category ID</th>
				<th>Category Name</th>
			</tr>
			<tr>
				<td><input class = "none" type="text" name="cid" value = "${category.cid}" readonly = "readonly"/></td>
				<td><input class = "none" type="text" name="cname" value = "${category.cname}"/></td>
			</tr>
		</table>
		<br>
		<input type = "submit" value = "Update"/>
		&nbsp;
		<input type = "button" value = "Cancel" onclick="window.location.href='/showCategories'"/>
	</form>

</body>
</html>