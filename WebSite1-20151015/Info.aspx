<%@ Page language="c#" Inherits="LibraryMOD.Info" CodeFile="Info.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE></TITLE>
		<meta content="MODE=online; TOOLBAR=off; NOSCROLL" name="ncbrowsermode">
		<meta http-equiv="PRAGMA" content="NO-CACHE">
		<script language="javascript" src="./JS/ButtonMenu.js"></script>
		<script language="javascript" src="./JS/KeyObj.js"></script>
					
		
		
		<script>
//鎖住按鍵
eval(top.LockKeyStr);
		</script>
		<%=GetContentScript()%>
		<script>
var ParentID = '<%=ParentID%>';
var LoginStatus = '<%=LoginStatus%>';
//載入CSS
var cssStr= '<LINK href="./CSS/' + top.STBVersion + '.css" type="text/css" rel="stylesheet">' ;	
document.write(cssStr);	

		</script>
		<script> 
//預載圖片             

eval(top.PreloadStr);
Preload('./Images/sys_img/bg_<%=Request.Cookies["ModPlatform"].Values["SWidth"]%>_video.jpg');	
		</script>
		<script>
//按鍵處理
function KEY_HANDLER(e) 
{
	//alert("KEY_HANDLER");
	eval(top.KeyHandlerStr);
	
	switch (KCode) 
	{  
		case key.RED:			
			
			return false;
		case key.GREEN:
			return false;
			
		case key.YELLOW:
			return false;
			
		case key.BLUE:
			return false;	
			
		//方向鍵
		
		case key.ARROW_LEFT:// ←	
		case key.ARROW_UP:// ↑
			return false;	
			
		case key.ARROW_RIGHT:// →
		case key.ARROW_DOWN:// ↓
			return false;	
				
				
		case key.SELECT:
			 eventCalled("SELECT");
			return false;
		case key.POWER:
			//alert("POWER");
			return true;
		
		case key.BACK:
			if(parent.IsHavingHistoryUrlArr())
			{
				var previous_url = parent.HistoryUrlArr[parent.HistoryUrlArr.length-1].url;
				parent.HistoryUrlArr.pop();
				parent.FrameGo(previous_url);
				
			}
			return false;
		
		case key.PAUSE:
			location.reload();
			return false;		
			
		case key.STOP:
			location.reload();
			parent.location.reload();
			return false;	
			

		case key.KEY_HOME:
			popToMain();
			return true;
			
		default:
			return false;					
	}
	return true;
}
		</script>
		<script>
function Init()
{	
	
	eval(top.SetKeyStr);
	setTimeout("parent.FrameShow();",2000);
	parent.LoadFlag=1;
	
	var MaxNum = arrMenu.length;
	if(!MaxNum){
		parent.HistoryFlag = -2;
		parent.FrameGo("./coming.aspx");
		return;
	}
	
	if(arrMenu[0].ImgUrl!=""){
		eval("document.video_img.src='./Images/" + arrMenu[0].ImgUrl + "';");
	}
	
	
}
function UnInit()
{	try{parent.stopQMSlide();} 
	catch(e){}
}
		</script>
		
		<script>
//************************* START PAGE FUNCTION *****************************************
//************************* GLOBAL VARIABLE *****************************************
function eventCalled(i)
{
	switch( i )
	{
		case "SELECT":
			if(arrMenu[0].MediaStart==""||arrMenu[0].MediaEnd==""){
				var MovieName = arrMenu[0].Content;
			}
			else{
				var MovieName =  arrMenu[0].Content.substring(0,arrMenu[0].Content.lastIndexOf("."))+"_B_"+arrMenu[0].MediaStart+"_E_"+arrMenu[0].MediaEnd+".wsx";
				var lon =MovieName.length;
				MovieName = MovieName.substring(MovieName.lastIndexOf('/')+1,lon);				
			}
			var ContentID = arrMenu[0].UID;
				//if( arrMenu[0].OrderYN=="1"){
					//parent.FrameGo("./login.aspx?ContentID=" + ContentID + "&MovieName=" + MovieName + "&ParentID=" + ParentID);
				//}
				//else{					
					parent.UpdateContentLog(ContentID);				
					parent.PlayMovie(MovieName);
				//}
			break;
			
		case "RED":
			break;
		case "GREEN":
			break;
		case "YELLOW":
			break;
		case "HOME":
			break;
		default:
			return false;
	}
	return false;
}
function BackByHistory()
{
	if(parent.IsHavingHistoryUrlArr()){
		var previous_url = parent.HistoryUrlArr[parent.HistoryUrlArr.length-1].url;
		parent.HistoryUrlArr.pop();
		parent.FrameGo(previous_url);	
	}
			return false;
}
function popToMain()
{
	if(parent.IsHavingHistoryUrlArr()){
		for(var i = parent.HistoryUrlArr.length ; i>=0; i--){
			parent.HistoryUrlArr.pop();
		}
		parent.FrameGo("./main.aspx");
			
	}
}


//************************* END PAGE FUNCTION *****************************************
		</script>
	</HEAD>
	<body oncontextmenu="window.event.returnValue=false"  bgcolor='black' leftMargin="0" topMargin='<%=Request.Cookies["ModPlatform"].Values["MainTopMargin"]%>' rightMargin="0" bottomMargin="0"
	 onload="Init()" monunload="UnInit()">
		<form id="Form1" method="post" runat="server">
			<table id="test" width="1024" height="683" cellpadding="0" cellspacing="0" style="background:url('Images/sys_img/BG_1024_video.jpg')">
				<TR>
					<TD WIDTH="61" BORDER="0" HEIGHT="41"></TD>
					<TD WIDTH="147" BORDER="0" HEIGHT="41"></TD>
					<TD WIDTH="183" BORDER="0" HEIGHT="41"></TD>
					<TD WIDTH="127" BORDER="0" HEIGHT="41"></TD>
					<TD WIDTH="40" BORDER="0" HEIGHT="41"></TD>
					<TD WIDTH="388" BORDER="0" HEIGHT="41"></TD>
					<TD WIDTH="81" BORDER="0" HEIGHT="41"></TD>
				</TR>
				<TR>
					<TD WIDTH="61" BORDER="0" HEIGHT="63"></TD>
					<TD HEIGHT="63" colspan="3" BORDER="0" class="metadata3"><script>document.write(arrMenu[0].Title);</script></TD>
					<TD WIDTH="40" BORDER="0" HEIGHT="63"></TD>
					<TD WIDTH="388" BORDER="0" HEIGHT="63"></TD>
					<TD WIDTH="81" BORDER="0" HEIGHT="63"></TD>
				</TR>
				<TR>
					<TD WIDTH="61" BORDER="0" HEIGHT="43"></TD>
					<TD WIDTH="147" BORDER="0" HEIGHT="43"></TD>
					<TD WIDTH="183 BORDER="0" HEIGHT="43"></TD>
					<TD WIDTH="127" BORDER="0" HEIGHT="43"></TD>
					<TD WIDTH="40" BORDER="0" HEIGHT="43"></TD>
					<TD WIDTH="388" BORDER="0" HEIGHT="43"></TD>
					<TD WIDTH="81" BORDER="0" HEIGHT="43"></TD>
				</TR>
				<TR>
					<TD WIDTH="61" BORDER="0" HEIGHT="23"></TD>
					<TD colspan="3" rowspan="2" BORDER="0"><img id="video_img" name="video_img" src="Images/sys_img/space.gif" width="457" height="320"></TD>
					<TD WIDTH="40" BORDER="0" HEIGHT="23"></TD>
					<TD WIDTH="388" BORDER="0" HEIGHT="23"></TD>
					<TD WIDTH="81" BORDER="0" HEIGHT="23"></TD>
				</TR>
				<TR>
                                        <TD WIDTH="61" BORDER="0" HEIGHT="320"></TD>
					<TD WIDTH="40" BORDER="0" HEIGHT="320"></TD>
                                       	<TD WIDTH="388" BORDER="0" HEIGHT="320" valign="top" align="justify" class="metadata"><script>document.write(arrMenu[0].Description);</script></TD>
					<TD WIDTH="81" BORDER="0" HEIGHT="320"></TD>
				</TR>
				<TR>
					<TD WIDTH="61" BORDER="0" HEIGHT="101"></TD>
					<TD HEIGHT="101" colspan="3" BORDER="0"><table height="87" width="457" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="96" height="40"></td>
								<td colspan="2" class="metadata2"><script>document.write(arrMenu[0].Times);</script></td>
							</tr>
							<tr>
								<td height="47"></td>
								<td width="32"></td>
								<td width="303" class="metadata2"><script>document.write(arrMenu[0].EDate);</script></td>
							</tr>
						</table>
					</TD>
					<TD WIDTH="40" BORDER="0" HEIGHT="101"></TD>
					<TD WIDTH="388" BORDER="0" HEIGHT="101"></TD>
					<TD WIDTH="81" BORDER="0" HEIGHT="101"></TD>
				</TR>
				<TR>
					<TD WIDTH="61" BORDER="0" HEIGHT="40"></TD>
					<TD WIDTH="147" BORDER="0" HEIGHT="40"><img src="./images/sys_img/info_play.jpg" style="CURSOR:pointer" onClick="javascript:eventCalled('SELECT');"></TD>
					<TD WIDTH="183" BORDER="0" HEIGHT="40"><IMG SRC="./images/sys_img/info_home.jpg" style="CURSOR:pointer" onClick="javascript:popToMain();"></TD>
					<TD HEIGHT="40" colspan="2" BORDER="40"><IMG SRC="./images/sys_img/info_back.jpg" style="CURSOR:pointer" onClick="javascript:BackByHistory();"></TD>
					<TD WIDTH="388" BORDER="0" HEIGHT="40"></TD>
					<TD WIDTH="81" BORDER="0" HEIGHT="40"></TD>
				</TR>
				<TR>
					<TD WIDTH="61" BORDER="0" HEIGHT="54"></TD>
					<TD WIDTH="147" BORDER="0" HEIGHT="54"></TD>
					<TD WIDTH="183" BORDER="0" HEIGHT="54"></TD>
					<TD WIDTH="127" BORDER="0" HEIGHT="54"></TD>
					<TD WIDTH="40" BORDER="0" HEIGHT="54"></TD>
					<TD WIDTH="388" BORDER="0" HEIGHT="54"></TD>
					<TD WIDTH="81" BORDER="0" HEIGHT="54"></TD>
				</TR>
			<script>
				if(BrowserType()=='CT7010'){
				     document.getElementById("test").style.background="url('Images/sys_img/BG_720_video.jpg')";
	    		        }

			</script>

			</table>
		</form>
	</body>
</HTML>
