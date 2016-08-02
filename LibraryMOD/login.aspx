<%@ Page Language="c#" Inherits="LibraryMOD.login" CodeFile="login.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<script>
		var ParentID = '<%=ParentID%>';
		var MovieName = '<%=MovieName%>';
		var ContentID = '<%=ContentID%>';
		var LoginStatus = '<%=LoginStatus%>';
		
		//LoginStatus = "1";//logon
		//LoginStatus = "0";//login failed
		//LoginStatus = '2';//re-enter password
		
		eval(top.LockKeyStr);
		var cssStr= '<LINK href="./CSS/' + top.STBVersion + '.css" type="text/css" rel="stylesheet">' ;	
		document.write(cssStr);	
		function KEY_HANDLER(e) 
		{
			//alert("KEY_HANDLER");
			eval(top.KeyHandlerStr);
			switch (KCode) 
			{  
				case key.NUMBER_0:
				case 96:
					EnterNum(0);return false;
				case key.NUMBER_1:
				case 97:
					EnterNum(1);return false;
				case key.NUMBER_2:
				case 98:
					EnterNum(2);return false;
				case key.NUMBER_3:
				case 99:
					EnterNum(3);return false;
				case key.NUMBER_4:
				case 100:
					EnterNum(4);return false;
				case key.NUMBER_5:
				case 101:
					EnterNum(5);return false;
				case key.NUMBER_6:
				case 102:
					EnterNum(6);return false;		
				case key.NUMBER_7:
				case 103:
					EnterNum(7);return false;
				case key.NUMBER_8:
				case 104:
					EnterNum(8);return false;
				case key.NUMBER_9:	
				case 105:
					EnterNum(9);return false;	
				case key.RED:					
					return false;	
				case key.GREEN:
					//return eventCalled("GREEN");
					return false;	
				case key.YELLOW:
					//return eventCalled("YELLOW");
					return false;	
				case key.BLUE:
					return false;						
				//方向鍵
				
				case key.ARROW_LEFT:// ←				
					ClearWord();
					return false;
						
				case key.SELECT:
					PlayMoive();
					return true;
					
				case key.POWER:
					//alert("POWER");
					return true;
					
				case key.BACK:
					BackByHistory();
					return false;	
					
				case key.PAUSE:
					//alert("hi");
					location.reload();
					return false;		
					
				case key.STOP:
					location.reload();
					parent.location.reload();
					return false;	
					
				case key.KEY_HOME:
					location.href = "./main.aspx";
					return true;
					
				default:
					return false;					
			}
			return true;
		}
		
		function PlayMoive()
		{
			if(parent.PlayFlag==true)
			{
			   parent.PushHistoryUrlArr(location.href);
			   parent.PlayMovie(MovieName);
			   if(top.STBVersion=="MSIE")
			   {
					parent.HistoryUrlArr.pop();
					BackByHistory();
			   }
			}
			else  // 使用者已輸入好密碼,送回 cs 去判斷
			{
				var tmp_sn = document.forms[0].txtSN.value;
				parent.FrameGo("./login.aspx?ContentID=" + ContentID + "&MovieName=" + MovieName + "&UserSN=" + tmp_sn +"&ParentID=" + ParentID);
			}
		}
		function UnInit()
		{
			parent.PlayFlag=false;
		}		
		function BackByHistory()
		{
			//alert("./Info.aspx?ParentID=" + ParentID);
			parent.FrameGo("./Info.aspx?ParentID=" + ParentID + "&from=login");
					
		}
		//{
			//var tmp_history = parent.HistoryFlag;
			//parent.HistoryFlag=-1;
			//history.go(tmp_history);
		//}
		function ClearWord() //清除使用者輸入的文字
		{	
			if(LoginStatus=='0')	
			{
				document.forms[0].txtSN.value = '';
				LoginStatus = '2';//re-enter password
			}
			else
			{
				var tmp_sn = document.forms[0].txtSN.value;
				document.forms[0].txtSN.value = tmp_sn.substring(0,tmp_sn.length-1);
			}
		}
		function EnterNum(Num)
		{
			if(LoginStatus=='0')	
			{
				document.forms[0].txtSN.value = '';
				LoginStatus = '2';//re-enter password
			}
			document.forms[0].txtSN.value += Num;
		}
		function Init()
		{	
			eval(top.SetKeyStr);
			//if(parent.PlayFlag==true)//已播放過, 要回metadata page
			//{
				//parent.PlayFlag=true;
				//var tmp_history = parent.HistoryFlag;
				//parent.HistoryFlag=-1;
				//parent.PlayFlag=false;  //20061114 modify
				//history.go(tmp_history);
			//}
			
			if(LoginStatus=='1') //登入成功
			{
				parent.PlayFlag=true;
				parent.HistoryFlag--;
				document.forms[0].txtSN.value = '帳號認證成功,請再按播放鍵開始播放';
				
				//parent.PlayMovie(MovieName);
				
				//parent.FrameGo("./Info.aspx?LoginStatus=" + LoginStatus + "&MovieName=" + MovieName +"&ParentID=" + ParentID);
				
				
				
			}
			else if(LoginStatus=='0')
			{
				parent.HistoryFlag--;
				document.forms[0].txtSN.value = '帳號錯誤,請重新輸入,或洽管理員';
			}
			else
				document.forms[0].txtSN.value = '';
			parent.FrameShow();
		}
		
		</script>
		<META CONTENT="text/html; charset=big5" HTTP-EQUIV="Content-Type">
	</HEAD>
	<body oncontextmenu="window.event.returnValue=false" bgcolor='black' leftMargin="0" topMargin='<%=Request.Cookies["ModPlatform"].Values["MainTopMargin"]%>' rightMargin="0" bottomMargin="0" onLoad="Init()" onunload="UnInit()">
		<form name="frm" id="frm">
			<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" background="Images/sys_img/BG_720_login.jpg">
				<TR>
					<TD width="245" border="0" height="160"></TD>
					<TD WIDTH="345" BORDER="0" HEIGHT="160"></TD>
					<TD WIDTH="130" BORDER="0" HEIGHT="160"></TD>
				</TR>
				<TR>
					<TD WIDTH="245" BORDER="0" HEIGHT="41"></TD>
					<TD valign="top">
						&nbsp; &nbsp;&nbsp;&nbsp; <INPUT id="txtSN" name="txtSN" class="login" type="button" maxLength="25" style="WIDTH: 325px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 30px; BACKGROUND-COLOR: transparent; BORDER-BOTTOM-STYLE: none; text-valign: top">
					</TD>
					<TD></TD>
				</TR>
				<TR>
					<TD WIDTH="245" BORDER="0" HEIGHT="279"></TD>
					<TD HEIGHT="279" colspan="2" align="right" valign="bottom" BORDER="0"><table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="39%" height="50">&nbsp;</td>
								<td width="23%"><img src="Images/sys_img/space.gif" width="87" height="37" style="CURSOR:pointer" onClick="javascript:PlayMoive();"></td>
								<td width="26%"><img src="Images/sys_img/space.gif" width="122" height="37" style="CURSOR:pointer" onClick="javascript:BackByHistory();"></td>
								<td width="12%">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4">&nbsp;</td>
							</tr>
						</table>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
