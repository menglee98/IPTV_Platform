<%@ Page language="c#" Inherits="Ndapn._Default" CodeFile="Default.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>Default</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script language="vbs">
	sub window_onload()
		  
	end sub 
	sub setFocusToEmail()
		  Document.all("txtUserID").Focus
	end sub
		</script>
		<script language="javascript">
	//parent.FrameShow();
		</script>
	</head>
	<body width="720" height="480" bgcolor="black" leftmargin="0" topmargin='0' rightmargin="0"
		bottommargin="0" background="Images/sys_img/BG_LOGON_PC.jpg" onload="setFocusToEmail"
		onunload="uninit()">
	   <form id="LogOn" method="post" runat="server">
	      <table width="720" height="480" cellspacing="0" cellpadding="0" border="0">
	         <tr>
	            <td>
		       <div id="div1" style="border-right: lightgrey 1px solid; border-top: lightgrey 1px solid; z-index: 101; left: 171px; border-left: lightgrey 1px solid; width: 351px; border-bottom: lightgrey 1px solid; position: absolute; top: 178px; height: 107px; background-color: #ebf4c2"
			    align="center" name="div1">
		          <table style="width: 100%" cellspacing="0" cellpadding="0">
			     <tr>
			        <td style="background-color: #cc3366" align="center" colspan="3"><font style="font-weight: bold; font-size: 12pt; color: #ffffff; font-family: 細明體">系統 ─ 登入</font></td>
			     </tr>
			     <tr>
				<td style="font-size: 10pt; width: 100px; font-family: 細明體" align="right">User Name&nbsp;:&nbsp;</td>
				<td style="width: 224px"><asp:textbox id="txtUserID" runat="server" name="txtUserID" font-size="10pt" font-names="細明體" font-name="Arial" width="100%"></asp:textbox></td>
				<td><asp:requiredfieldvalidator id="rfvUserID" runat="server" controltovalidate="txtUserID" display="Static" errormessage="*"></asp:requiredfieldvalidator></td>
			     </tr>
		             <tr>
				 <td style="font-size: 10pt; width: 100px; font-family: 細明體" align="right">Password:&nbsp;</td>
				 <td style="width: 224px"><asp:textbox id="txtUserPwd" runat="server" font-size="10pt" font-names="細明體" font-name="Arial" width="100%" textmode="Password"></asp:textbox></td>
				 <td><asp:requiredfieldvalidator id="rfvUserPwd" runat="server" controltovalidate="txtUserPwd" display="Static" errormessage="*"></asp:requiredfieldvalidator></td>
		             </tr>
			     <tr>
				 <td style="font-size: 10pt; width: 100px; font-family: 細明體" align="right">PortalName:&nbsp;</td>
				 <td style="width: 224px"><asp:dropdownlist ID="se" runat="server"></asp:dropdownlist></td>
				 <td><font face="新細明體"></font></td>
			     </tr>
			  </table>
			     <asp:Label id="lblMsg" runat="server" ForeColor="red" font-names="細明體" font-size="10pt"></asp:Label>
			     <br>
			     <asp:button id="btnLogOn" runat="server" text="登入" cssclass="barBtn" width="54px" font-names="細明體"
				 font-size="10pt" onclick="btnLogOn_Click"></asp:button>
                       </div>
		    </td>
	         </tr>
	      </table>
	   </form>
      </body>
</html>
