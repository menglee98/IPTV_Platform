<%@ Page Language="c#" Inherits="Ndapn.leaf_redirector" CodeFile="leaf_redirector.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	   <title>無標題文件</title>
	   <meta http-equiv="Content-Type" content="text/html; charset=big5" />
		
	</head>
	<body bgcolor="#999966" onload="<%=onload%>" >
		<form method="post" id="Form1" runat="server">
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td nowrap width="15">&nbsp;</td>
					<td class="logo" noWrap colSpan="2" height="60"><br>
						設定顯示內容物件類型</td>
					<td width="100%">&nbsp;</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="4"><img height="1" alt="" src="mm_spacer.gif" width="1" border="0"></td>
				</tr>
				<tr bgcolor="#a4c2c2">
					<td noWrap width="15">&nbsp;</td>
					<td class="navText" id="navigation" height="36"><a href="javascript:;"></a></td>
					<td>&nbsp;</td>
					<td width="100%">&nbsp;</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="4"><img height="1" alt="" src="mm_spacer.gif" width="1" border="0"></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td valign="middle" width="15"><img height="1" alt="" src="mm_spacer.gif" width="15" border="0"></td>
					<td valign="middle" width="35"><img height="1" alt="" src="mm_spacer.gif" width="35" border="0"></td>
					<td valign="middle" width="710" align="center"><br>
						<table id="calendar" cellspacing="1" cellpadding="2" width="710" border="0">
							<tr>
								<td class="subHeader" colspan="6" align="left">&nbsp;</td>
							</tr>
							<tr>
								<td class="subheader" colspan="6" align="left">請選擇此顯示內容物件類型
									<asp:textbox id="txtID" runat="server" visible="False" width="40px"></asp:textbox>
									<asp:textbox id="txtParamters" runat="server" visible="False" width="40px"></asp:textbox>
									<asp:textbox id="txtName" runat="server" visible="False" width="40px"></asp:textbox>
									<asp:label id="labAlert" runat="server" visible="False" forecolor="Red" font-size="X-Small">無法新增，因為目前已存在一個未過期的跑馬文字選項</asp:label></td>
							</tr>
							<tr id="calheader" bgcolor="#cccc99">
								<td colspan="6" align="left" valign="middle" class="calendarText" height="82">
									<asp:radiobuttonlist id="rblistItemKind" runat="server" width="566px" repeatcolumns="4" repeatdirection="Horizontal">
										<asp:listitem value="3" selected="True">影片</asp:listitem>
									</asp:radiobuttonlist>&nbsp;</td>
							</tr>
							<tr id="calheader">
								<td width="92" align="left" valign="middle" class="calendarText" colspan="6">
									<asp:button id="Button1" runat="server" text="確定" onclick="Button1_Click"></asp:button></td>
							</tr>
						</table>
						<br>
						<br>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="15">&nbsp;</td>
					<td width="35">&nbsp;</td>
					<td width="710">&nbsp;</td>
					<td width="100%">&nbsp;</td>
				</tr>
			</table>
		</form>
	</body>
</html>
