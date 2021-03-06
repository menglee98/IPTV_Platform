<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="MyTool/DatePicker.ascx" %>
<%@ Page language="c#" Inherits="Ndapn.redirector" CodeFile="redirector.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>redirector</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<link rel="stylesheet" href="MyStyle.css" type="text/css">
		<link href="mm_lodging1.css" type="text/css" rel="stylesheet">
		<meta http-equiv="PRAGMA" content="NO-CACHE" />
	</head>
	<body onload="<%=onload%>" >
		<form id="Form1" method="post" enctype="multipart/form-data" runat="server">
			<table width="100%" height="345" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td height="22" colspan="2"><table cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
								<td nowrap width="15">&nbsp;</td>
								<td class="logo" nowrap colspan="2" height="60">目錄管理</td>
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
								<td valign="middle" width="710" align="center"><br>
									<table id="calendar" cellspacing="1" cellpadding="2" width="639" border="0">
										<tr>
											<td class="subHeader" colspan="3" align="left">目錄資訊
												<asp:linkbutton id="lbNodeAddLink" runat="server" onclick="lbNodeAddLink_Click">&lt;&lt;&lt;新增內含目錄或選項&gt;&gt;&gt;</asp:linkbutton>排列
												<asp:textbox id="txtSort1" runat="server" width="40px"></asp:textbox></td>
										</tr>
								
										<tr id="calheader" bgcolor="#cccc99">
											<td width="103" align="center" valign="middle" class="calendarText" style="height: 4px"><strong>顯示方式：</strong></td>
											<td colspan="2" align="left" valign="middle" class="calendarText" style="height: 4px"><asp:radiobuttonList id="rblistShowMode" runat="server" width="200px" height="8px" repeatdirection="Horizontal">
													<asp:listitem value="1" selected="True">單行 + 圖示</asp:listitem>
													<asp:listitem value="2">雙行無圖示</asp:listitem>
												</asp:radiobuttonlist></td>
										</tr>
										<tr bgcolor="#ededde">
											<td align="center" valign="middle" class="calendarText"><strong>目錄名稱：</strong></td>
											<td style="width:352; height:18" align="left" valign="middle" class="calendarText">
												<div align="left"><asp:textbox id="txtFolderName" runat="server" width="293px"></asp:textbox></div>
											</td>
											<td style="width:168; height:18"  align="left" valign="middle" class="calendarText">&nbsp;
												<asp:textbox id="txtImgName" runat="server" visible="False" width="10px"></asp:textbox>
												<asp:textbox id="txtID" runat="server" visible="False" width="10px"></asp:textbox></td>
										</tr>
										<tr id="calheader" bgcolor="#cccc99">
											<td align="center" valign="middle" class="calendarText">目錄圖片：</td>
											<td colspan="2" align="left" valign="middle" class="calendarText"><div align="left"><font face="新細明體">
														<input id="txtImgUp" style="width: 296px; height: 22px" type="file" size="30" name="txtFileUp"
															runat="server">
														<br>
														<asp:label id="labImgAlert" runat="server" visible="False" forecolor="#C00000" font-size="X-Small">僅接收圖片檔案格式，例如JPG、GIF...等</asp:label>
													</font><font face="新細明體"></font>
												</div>
											</td>
										</tr>
										<tr bgcolor="#ededde">
											<td align="center" valign="middle" class="calendarText">開始日期：</td>
											<td height="18" colspan="2" valign="middle" class="calendarText">
												<uc1:DatePicker id="txtStartDate" runat="server"></uc1:DatePicker>
											</td>
										</tr>
										<tr id="calheader" bgColor="#cccc99">
											<td align="center" valign="middle" class="calendarText">終止日期：</td>
											<td colspan="2" align="left" vAlign="middle" class="calendarText">
												<uc1:DatePicker id="txtEndDate" runat="server"></uc1:DatePicker></td>
										</tr>
										<tr bgcolor="#ededde">
											<td align="center" valign="middle" class="calendarText"><span class="sidebarText">原目錄圖片：</span></td>
											<td height="18" colspan="2" valign="middle" class="calendarText"><div align="left">
													<asp:image id="imgFolder" runat="server" style="width:260px; height:180px"></asp:image>
												</div>
											</td>
										</tr>
										<tr id="calheader" bgcolor="#cccc99">
											<td align="center" valign="middle" class="calendarText">&nbsp;</td>
											<td align="center" valign="middle" class="calendarText">
												<div align="center">
													<asp:button id="btnDel" runat="server" text="刪除" onclick="btnDel_Click"></asp:button>
													<asp:button id="btnSend" runat="server" text="確認" onclick="btnSend_Click"></asp:button>
												</div>
											</td>
											<td align="center" valign="middle" class="calendarText">&nbsp;</td>
										</tr>
										<tr bgcolor="#ededde">
											<td align="center" valign="middle" class="calendarText">&nbsp;</td>
											<td height="18" valign="middle" class="calendarText">&nbsp;</td>
											<td valign="middle" class="calendarText">&nbsp;</td>
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
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
