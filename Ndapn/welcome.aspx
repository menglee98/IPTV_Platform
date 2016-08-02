<%@ Page language="c#" Inherits="Ndapn.welcome" CodeFile="welcome.aspx.cs" %>
<%@ Import Namespace="System.Net" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>welcome</title>
		<META http-equiv="Content-Type" content="text/html; charset=big5">
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<BODY TOPMARGIN="0" LEFTMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" onload="<%=onload%>">
	<%
        System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
	%>
		<TABLE width="1076" height="814" CELLPADDING="0" CELLSPACING="0" background="Images/BG_720.jpg">
			<TR>
				<TD WIDTH="41" HEIGHT="32"></TD>
			</TR>
			<TR>
				<TD COLSPAN="6" WIDTH="1033" HEIGHT="22"></TD>
			</TR>
			<TR>
				<TD COLSPAN="2" WIDTH="43" HEIGHT="55"></TD>
				<TD COLSPAN="4" WIDTH="1033" HEIGHT="55"><IMG SRC="images/slice_8.jpg"></TD>
			</TR>
			<TR>
				<TD COLSPAN="2" WIDTH="43" HEIGHT="280"></TD>
				<TD COLSPAN="4" WIDTH="1033" HEIGHT="280"><IMG SRC="images/slice_10.jpg"></TD>
			</TR>
			<TR>
				<TD COLSPAN="2" WIDTH="43" HEIGHT="36"></TD>
				<TD COLSPAN="4" WIDTH="1033" HEIGHT="36"><IMG SRC="images/slice_12.jpg"></TD>
			</TR>
			<TR>
				<TD COLSPAN="6" WIDTH="1033" HEIGHT="325"></TD>
			</TR>
			<TR>
				<TD WIDTH="41" HEIGHT="1"></TD>
				<TD WIDTH="2" HEIGHT="1"></TD>
				<TD WIDTH="119" HEIGHT="1"></TD>
				<TD WIDTH="214" HEIGHT="1"></TD>
				<TD WIDTH="130" HEIGHT="1" style="WIDTH: 130px"></TD>
				<TD WIDTH="424" HEIGHT="1"></TD>
			</TR>
		</TABLE>
		<script>
		function init()
		{
			if(window.frameElement.name.indexOf('basefrm')!=-1)
			{
				document.body.scrollTop= 97;
				var frmObj = frameElement;
			}
		}
		init();
		window.onscroll = init;
		
		</script>
	</BODY>
</HTML>
