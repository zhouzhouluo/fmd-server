<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员注册</title>
</head>

<body>
	<form action="fmd-server/member/save">
		<table>
			<tr style="padding-top: 20px;">
				<td><label for="userid">用户ID:</label></td>
				<td><input id="userid" name="userid" placeholder="用户ID" type="text" value="173507"/></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr style="padding-top: 20px;">
				<td><label for="account_name">姓名:</label></td>
				<td><input id="account_name" name="account_name" placeholder="姓名" type="text" /></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr style="padding-top: 20px;">
				<td><label for="referee_id">推荐人:</label></td>
				<td><input id="referee_id" name="referee_id" placeholder="推荐人" type="text" /></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td><label for="node_id">节点人:</label></td>
				<td><input id="node_id" name="node_id" placeholder="节点人" type="text" /></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td><label for="area">业务区域:</label></td>
				<td><input id="area" name="area" placeholder="业务区域" type="text" /></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td><label for="QQ">QQ:</label></td>
				<td><input id="qq" name="qq" placeholder="qq" type="text" /></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td><label for="phone_number">联系电话:</label></td>
				<td><input id="phone_number" name="phone_number" placeholder="联系电话" type="text" /></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td><input type="button"></td>
				<td><input id="phone_number" name="phone_number" placeholder="联系电话" type="text" /></td>
			</tr>
		</table>



	</form>
</body>
</html>