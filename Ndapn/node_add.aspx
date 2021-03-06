<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="MyTool/DatePicker.ascx" %>
<%@ Page Language="c#" Inherits="Ndapn.node_add" CodeFile="node_add.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
	<head>
		<title>Lodging - Calendar</title> 
		<!-- DW6 -->
		<!-- Copyright 2005 Macromedia, Inc. All rights reserved. --><link href="mm_lodging1.css" type="text/css" rel="stylesheet">
	</head>
	<body bgcolor="#999966">
		<form method="post" enctype="multipart/form-data" id="Form1" runat="server">
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td nowrap width="15">&nbsp;</td>
					<td class="logo" nowrap colSpan="2" height="60"><br>
						新增目錄或影音</td>
					<td width="100%">&nbsp;</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="4"><img height="1" alt="" src="mm_spacer.gif" width="1" border="0"></td>
				</tr>
				<tr bgcolor="#a4c2c2">
					<td nowrap width="15">&nbsp;</td>
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
					<td valign="middle" width="710" align="center">
						<p align="left">
							<asp:label id="labUserMsg" runat="server" height="26px" width="285px" cssclass="sidebarText"></asp:label></p>
						<table id="calendar" cellspacing="1" cellpadding="2" width="814" border="0">
							<tr>
								<td class="subHeader" colspan="7" align="left">請輸入下列資訊
									<asp:textbox id="txtParentID" runat="server" width="32px" visible="False"></asp:textbox></td>
							</tr>
							<tr id="weekdays" bgcolor="#999966">
								<th class="bodyText" align="center" width="68" height="32">
									類別</th>
								<th class="bodyText" align="center" width="166">
									名稱</th>
								<th class="bodyText" align="center" width="94" valign="middle">
									開始日期</th>
								<th class="bodyText" align="center" width="94" valign="middle">
									終止日期</th>
								<th class="bodyText" align="center" width="76">
									排列</th>
								<th class="bodyText " align="center" width="222">
									圖片</th>
							</tr>
							<tr id="calheader" bgcolor="#cccc99">
								<td class="calendarText" valign="middle" align="center" style="width:68; height:71"><asp:radiobuttonlist id="rbKind1" runat="server" style="width:63px; height:16px">
										<asp:listitem value="1" selected="True">目錄</asp:listitem>
										<asp:listitem value="2">影音</asp:listitem>
									</asp:radiobuttonlist></td>
								<td class="calendarText" valign="middle" align="center" style="width:166; height:71"><label>
										<asp:textbox id="txtName1" runat="server" width="160px"></asp:textbox>
									</label></td>
								<td class="calendarText" valign="middle" align="center" style="width:94; height:71">
									<uc1:DatePicker id="txtStartDate1" runat="server"></uc1:DatePicker></td>
								<td class="calendarText" valign="middle" align="center" style="width:94; height:71">
									<uc1:DatePicker id="txtEndDate1" runat="server"></uc1:DatePicker></td>
								<td class="calendarText" valign="middle" align="center" style="width:76; height:71">
									<asp:textbox id="txtSort1" runat="server" width="40px"></asp:textbox></td>
								<td class="calendarText" valign="middle" align="center" height="71"><label>
										<input type="file" name="file" id="txtFileUp1" runat="server">
									</label></td>
							</tr>
						
						</table>
						<p><font face="新細明體"></font>
							<br>
							<asp:button id="Button1" runat="server" text="取消新增"></asp:button><font face="新細明體">&nbsp;</font>
							<asp:button id="Button2" runat="server" text="確認新增" onclick="Button2_Click"></asp:button>
							<br>
						</p>
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
