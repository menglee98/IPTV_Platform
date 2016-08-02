<%@ Page language="c#" Inherits="DatePicker.WebForm2" CodeFile="Calendar.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>請選擇日期</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Calendar id="Calendar" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
				BackColor="White" Width="200px" DayNameFormat="FirstLetter" ForeColor="Black" Height="180px"
				Font-Size="8pt" Font-Names="Verdana" BorderColor="#999999" CellPadding="4" onselectionchanged="Calendar1_SelectionChanged">
				<TodayDayStyle ForeColor="Black" BackColor="#CCCCCC"></TodayDayStyle>
				<SelectorStyle BackColor="#CCCCCC"></SelectorStyle>
				<NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
				<DayHeaderStyle Font-Size="7pt" Font-Bold="True" BackColor="#CCCCCC"></DayHeaderStyle>
				<SelectedDayStyle Font-Bold="True" ForeColor="White" BackColor="#666666"></SelectedDayStyle>
				<TitleStyle Font-Bold="True" BorderColor="Black" BackColor="#999999"></TitleStyle>
				<WeekendDayStyle BackColor="#FFFFCC"></WeekendDayStyle>
				<OtherMonthDayStyle ForeColor="#808080"></OtherMonthDayStyle>
			</asp:Calendar>
		</form>
	</body>
</HTML>
