<%@ Page language="c#" Inherits="Support.Main" CodeFile="Main.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>Main</TITLE>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="PRAGMA" content="NO-CACHE">
		<script language="JScript.Encode" src="./jscripts/calendar/calendar.js"></script>
		<STYLE>A { FONT-SIZE: 12px; COLOR: firebrick; TEXT-DECORATION: none }
	A:hover { FONT-SIZE: 14px; COLOR: lightpink; TEXT-DECORATION: none }
		</STYLE>
	</HEAD>
	<body bgColor=gainsboro onload="<%=oninit%>">
		<form id="Form1" style="COLOR: black; FONT-FAMILY: Arial, Monospace" method="post" runat="server">
			<asp:panel id="AInput" runat="server" BorderWidth="10px" BorderStyle="Groove" BorderColor="Transparent"
				BackColor="LemonChiffon" Width="100%" Height="100%">
				<P><STRONG>
						<asp:Label id="lblTitle" runat="server" Width="152px"></asp:Label></STRONG></P>
				<P><STRONG>
						<asp:Label id="lbl0" runat="server" ></asp:Label></STRONG>&nbsp;
					<asp:DropDownList id="sltCtnType" runat="server" Width="120px" DataTextField="Name" DataValueField="Value"></asp:DropDownList><STRONG></STRONG></P>
				<P><STRONG>起始日期</STRONG>&nbsp;
					<asp:textbox id="txtSDate" onclick="javascript:calendar(this);" runat="server" >2007/03/26</asp:textbox><STRONG>至</STRONG>
					<asp:textbox id="txtEDate" onclick="javascript:calendar(this);" runat="server" >2007/03/26</asp:textbox></P>
				<P>
					<asp:Button id="btnSubmit" runat="server" Height="24px" Width="56px" Text="確定" onclick="btnSubmit_Click"></asp:Button></P>
				<P>
					<asp:Label id="lblProcessMessage" runat="server" Visible="False" Font-Size="Smaller" Font-Names="Arial"
						ForeColor="DarkRed">執行程序正常。</asp:Label></P>
			</asp:panel>
			<P><asp:datagrid id="dgMainList" runat="server" BorderWidth="2px" BorderStyle="None" BorderColor="White"
					BackColor="#E0E0E0" Width="800px" ForeColor="#0000C0" Font-Names="Tahoma" Font-Size="Small"
					AllowPaging="False" PageSize="20" OnPageIndexChanged="Grid_Change" CellPadding="1" CellSpacing="2"
					GridLines="None">
					<AlternatingItemStyle Font-Size="Smaller" Font-Names="Tahoma" BorderWidth="2px" ForeColor="Blue" BorderStyle="None"
						BackColor="Beige"></AlternatingItemStyle>
					<ItemStyle Font-Size="Smaller" Font-Names="Tahoma" ForeColor="Blue" BackColor="PaleGoldenrod"></ItemStyle>
					<HeaderStyle Font-Size="Smaller" Font-Names="Tahoma" BorderWidth="2px" ForeColor="White" BorderStyle="None"
						BackColor="Gray"></HeaderStyle>
					<PagerStyle NextPageText="N" BorderWidth="2px" Font-Size="Smaller" Font-Names="Tahoma" BorderColor="#404040"
						PrevPageText="P" BorderStyle="None" ForeColor="#0000C0" Position="TopAndBottom" BackColor="Silver"
						Mode="NumericPages"></PagerStyle>
				</asp:datagrid></FONT></P>
		</form>
		<script language="javascript">
obj = document.getElementById('sltCtnType');
obj2 = document.getElementById('btnSubmit');
obj2.onclick = 
function aa()
{ 
	if(obj.selectedIndex == 0 )
	{
		top.shake(2);
		alert('沒有選擇項目');
	}	
}

		</script>
	</body>
</HTML>
