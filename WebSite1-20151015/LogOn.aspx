<%@ Page language="c#" Inherits="LibraryMOD.LogOn" CodeFile="LogOn.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>LogOn</title>
		<META http-equiv="Content-Type" content="text/html; charset=big5">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
		</script>
		<script language="javascript">
               if(top.STBVersion=="CT7010")
                    document.write("<body width='720' height='480' bgColor='black' leftMargin='0' topMargin='0' rightMargin='0' bottomMargin='0' background='Images/sys_img/BG_LOGON_PC.jpg' onunload='UnInit()'>");
               else
                    document.write("<body bgColor='black' leftMargin='0' topMargin='0' rightMargin='0' bottomMargin='0' background='Images/sys_img/usc2.jpg' onunload='UnInit()'>");
	                
		</script>
                
	</HEAD>
	<body>
		<form method="post" runat="server">
			<table width="720" height="480" cellSpacing="0" cellPadding="0" border="0">
				<tr>
					<td>
						<DIV id="div1" style="BORDER-RIGHT: lightgrey 1px solid; BORDER-TOP: lightgrey 1px solid; Z-INDEX: 101; LEFT: 171px; BORDER-LEFT: lightgrey 1px solid; WIDTH: 352px; BORDER-BOTTOM: lightgrey 1px solid; POSITION: absolute; TOP: 178px; HEIGHT: 120px"
							align="center" name="div1">
							<table style="WIDTH: 100%; HEIGHT: 88px" cellSpacing="0" cellPadding="0">
								<TR>
									<TD align="center" colSpan="3"><FONT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #ffffff; FONT-FAMILY: 細明體">系統 
											─ 登入</FONT></TD>
								</TR>
								<TR>
									<TD style="FONT-SIZE: 10pt; WIDTH: 100px; COLOR: #ffffff; FONT-FAMILY: 細明體" align="right">User 
										Name&nbsp;:&nbsp;</TD>
									<TD style="WIDTH: 224px"><asp:textbox id="txtUserID" runat="server" name="txtUserID" Font-Size="10pt" Font-Names="細明體"
											Font-Name="Arial" Width="100%" value="" ></asp:textbox></TD>
									<TD><asp:requiredfieldvalidator id="rfvUserID" runat="server" ControlToValidate="txtUserID" Display="Static" ErrorMessage="*"></asp:requiredfieldvalidator></TD>
								</TR>
								<TR>
									<TD style="FONT-SIZE: 10pt; WIDTH: 100px; COLOR: #ffffff; FONT-FAMILY: 細明體" align="right">Password 
										:&nbsp;</TD>
									<TD style="WIDTH: 224px"><asp:textbox id="txtUserPwd" runat="server" Font-Size="10pt" Font-Names="細明體" Font-Name="Arial"
											Width="100%" value="" TextMode="Password" ></asp:textbox></TD>
									<TD><asp:requiredfieldvalidator id="rfvUserPwd" runat="server" ControlToValidate="txtUserPwd" Display="Static" ErrorMessage="*"></asp:requiredfieldvalidator></TD>
								</TR>
								<TR>
									<TD style="FONT-SIZE: 10pt; WIDTH: 100px; COLOR: #ffffff; FONT-FAMILY: 細明體; HEIGHT: 21px"
										align="right">PortalName :&nbsp;</TD>
									<TD style="WIDTH: 224px"><asp:DropDownList ID="se" runat="server" onselectedindexchanged="se_SelectedIndexChanged">
										</asp:DropDownList></TD>
									<TD><FONT face="新細明體"></FONT></TD>
								</TR>
							</table>
							<asp:Label id="lblMsg" runat="server" ForeColor="red" Font-Names="細明體" Font-Size="10pt"></asp:Label>
							<br>
							<asp:button id="btnLogOn" runat="server" text="登入" CssClass="barBtn" Width="54px" Font-Names="細明體"
								Font-Size="10pt" onclick="btnLogOn_Click"></asp:button></DIV>
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</HTML>