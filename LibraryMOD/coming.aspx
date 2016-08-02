<%@ Page language="c#" Inherits="LibraryMOD.coming" CodeFile="coming.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<META http-equiv="Content-Type" content="text/html; charset=big5">
		<meta content="MODE=online; TOOLBAR=off; NOSCROLL" name="ncbrowsermode">
		<meta http-equiv="PRAGMA" content="NO-CACHE">
		<script>
//鎖住按鍵
eval(top.LockKeyStr);
		</script>
		<script> 
//預載圖片             
eval(top.PreloadStr);
Preload('./Images/sys_img/bg_<%=Request.Cookies["ModPlatform"].Values["SWidth"]%>_coming.jpg');	
		</script>
		<script>
//按鍵處理
function KEY_HANDLER(e) 
{
	eval(top.KeyHandlerStr);
	
	switch (KCode) 
	{	
		case key.BACK:
			if(parent.IsHavingHistoryUrlArr())
			{
				var previous_url = parent.HistoryUrlArr[parent.HistoryUrlArr.length-1].url;
				//alert("pop before = " + parent.HistoryUrlArr.length);
				parent.HistoryUrlArr.pop();
				//alert("pop after = " + parent.HistoryUrlArr.length);
				parent.FrameGo(previous_url);
				
			}
			return false;
		case key.KEY_HOME:
			parent.FrameGo('./Main.aspx') ;
			parent.LoadFlag=1;
			return false;	
	}	
	
}

function clickback()
{
	var previous_url = parent.HistoryUrlArr[parent.HistoryUrlArr.length-1].url;
	parent.HistoryUrlArr.pop();
	parent.FrameGo(previous_url);
}
		</script>
	</HEAD>
	<body bgcolor='black' leftMargin="0" topMargin='<%=Request.Cookies["ModPlatform"].Values["MainTopMargin"]%>' rightMargin="0" bottomMargin="0"
		onload="Init()" onUnload="UnInit()">
		<form id="Form1" method="post" runat="server">
			<table width="720" height="480" border="0" align="center" cellpadding="0" cellspacing="0" background='./Images/sys_img/bg_720_coming.jpg'>
   					  <TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="134"></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="134"></TD>
						<TD WIDTH="99" BORDER="0" HEIGHT="134"></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="134"></TD>
						<TD WIDTH="25" BORDER="0" HEIGHT="134"></TD>
						<TD WIDTH="40" BORDER="0" HEIGHT="134"></TD>
						<TD WIDTH="79" BORDER="0" HEIGHT="134"></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="40"></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD WIDTH="40" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="6"></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="40"></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="6"></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="40"></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="6"></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="40"></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="6"></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="40"></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD WIDTH="204" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
						<TD WIDTH="40" BORDER="0" HEIGHT="40"></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD HEIGHT="74" colspan="7" valign="bottom" BORDER="0"><table width="720" height="30"  border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="180" height="30"></td>
                            <td width="180"></td>
                            <td width="192"></td>
                            <td width="168"><img src="Images/sys_img/space.gif" alt=" " width="168" height="30" style="cursor:pointer; "onClick="javascript:clickback();"></td>
                          </tr>
                        </table></TD>
					</TR>
					<TR>
						<TD WIDTH="69" BORDER="0" HEIGHT="25"></TD>
						<TD COLSPAN="5"></TD>
						<TD></TD>
					</TR>
					<TR>
					<TD WIDTH="69" BORDER="0" HEIGHT="23"></TD>
					<TD COLSPAN="5"></TD>
					<TD></TD>
				</TR>
   		 </table>
		</form>
		<script>
//頁面起始化
function Init()
{	
	//alert("Init");
    eval(top.SetKeyStr);
    
	parent.FrameShow() ;
}

//頁面離開
function UnInit()
{	
	//alert("UnInit");
}
		</script>
	</body>
</HTML>

