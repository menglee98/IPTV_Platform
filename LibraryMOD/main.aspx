<%@ Page language="c#" Inherits="LibraryMOD.main" CodeFile="main.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
	<head>
		<title></title>
		<meta content="MODE=online; TOOLBAR=off; NOSCROLL" name="ncbrowsermode" />
		<meta http-equiv="PRAGMA" content="NO-CACHE" />
		<script type="text/javascript" language="javascript" src="./JS/KeyObj.js"></script>
		<script type="text/javascript" language="javascript" src="./JS/ButtonMenu.js"></script>
		<script language="javascript" src="./JS/keymap.js" type="text/javascript"></script>
		<script type="text/javascript">
                //alert('huang');
//鎖住按鍵
eval(top.LockKeyStr);
		</script>

		<%=GetMenuScript()%>

		<script type="text/javascript"> 
//載入CSS
var cssStr= '<link href="./CSS/' + top.STBVersion + '.css" type="text/css" rel="stylesheet">' ;	
document.write(cssStr);	
                //alert('hello');
		</script>

		<script type="text/javascript">
//按鍵處理
function KEY_HANDLER(e) 
{	
	eval(top.KeyHandlerStr);
	switch (KCode) 
	{  
		case key.RED:
			if(top.STBVersion=="MSIE")
			{
				alert("PC使用者不提供直播頻道功能, 請見諒");
				return;
			}
			parent.PlayChannel();
			return false;	
		case key.GREEN:
			parent.PushHistoryUrlArr(location.href);
			parent.FrameGo("./main.aspx?ParentID=150");			
			return false;	
		case key.YELLOW:
			parent.PushHistoryUrlArr(location.href);
			parent.PlayMovie('csmuintro.ts2');
			return false;	
		case key.BLUE:
			return false;	
			
		//方向鍵
		
		case key.ARROW_LEFT:// ←	
		case key.ARROW_UP:// ↑			
			return menuScrollUp();
			return false;
		case key.ARROW_RIGHT:// →
		case key.ARROW_DOWN:// ↓
			return menuScrollDown();
			return false;	
				
		case key.SELECT:			
			return true;
			
		case key.POWER:
			return true;
			
		case key.BACK:		
			popHistoryArr()	;			
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

function popHistoryArr()
{
	if(parent.IsHavingHistoryUrlArr())
		{
			var previous_url = parent.HistoryUrlArr[parent.HistoryUrlArr.length-1].url;
			parent.HistoryUrlArr.pop();
			parent.FrameGo(previous_url);	
		}
}

function popToMain()
{
	if(parent.IsHavingHistoryUrlArr())
		{
			for(var i = parent.HistoryUrlArr.length ; i>=0; i--)
				parent.HistoryUrlArr.pop();
			parent.FrameGo("./main.aspx");
		}
}
		</script>

		<script type="text/javascript">
//************************* GLOBAL VARIABLE *****************************************
var leftAmount =4;//每頁按鈕容量 0-3 = 4
var leftAmount_tmp = leftAmount;//如果換頁時,menu數量不足5個(例如只餘2個),則此數會便為 2, 用以限制使用者往下換到第3個btn
var SelFlag = 0;
var CurPage = 0;
var MaxPages = 0;

if(BrowserType()!='CT7010')
{
    leftAmount = arrMenu.length;
}

if(arrMenu.length>(leftAmount+1))
{
	MaxPages =  Math.floor(arrMenu.length / (leftAmount+1));
	if(arrMenu.length == MaxPages*(leftAmount+1))
		MaxPages--;
}

function ShowMenuText()
{
	var tmpArrIndex = GetArrayIndex();
	var j=0, i=0;	
	leftAmount_tmp = leftAmount;	
	for(i=0 ; i<=leftAmount; i++)
	{
		j = tmpArrIndex + i;
		if(j==arrMenu.length)
		{
			j=i-1;
			for(i;i<=leftAmount;i++)
				eval('document.forms[0].btnLeft' + i + '.value="";');//menu沒了,補空值給剩餘的btn
			leftAmount_tmp = j;
		}
		else{
			eval('document.forms[0].btnLeft' + i + '.value="' + arrMenu[j].Title + '";');
			
			}
	}
}

function Init()
{	
	//alert(arrMenu.length);
    eval(top.SetKeyStr);
	parent.FrameShow();
	focusToLeftButton(0);
	
	parent.LoadFlag=1;
	if(arrMenu.length){ShowMenuText();}
	else
	{
		parent.HistoryFlag = -2;
		parent.FrameGo("./coming.aspx");
		return;
	}
}

function menuScrollUp()
{
	if (SelFlag == 1 && CurPage==0)
	eval("document.main_up.src='./Images/sys_img/space.gif';");
	
	if(SelFlag == 0 && CurPage==0)//往上沒有item了	
		return false
	else
	{	
		eval("document.main_down.src='./Images/sys_img/main_down.jpg';");
		if(SelFlag == 0 )
		{
			CurPage--;
			ShowMenuText();
			focusToLeftButton(leftAmount);
		}
		else
		    focusToLeftButton(SelFlag-1);
	}
}

function menuScrollDown()
{
	if(SelFlag+1 == leftAmount_tmp && CurPage == MaxPages)
	   eval("document.main_down.src='./Images/sys_img/space.gif';");	

	if(SelFlag == leftAmount_tmp && CurPage == MaxPages) //如果目前所選擇的btn為當頁最後一個item,並且目前在最後一頁	
		return false
	else
	{
		eval("document.main_up.src='./Images/sys_img/main_up.jpg';");
		if(SelFlag ==(leftAmount_tmp))//on last btn --> change next page
		{
			CurPage++;
			ShowMenuText();
			focusToLeftButton(0);
		}
		else
		    focusToLeftButton(SelFlag+1);
	}

	return false;
}

function btnOnFocus()
{	
	var tmpArrIndex = GetArrayIndex();
	tmpArrIndex += SelFlag;
	
	if(arrMenu[tmpArrIndex].ImgUrl.indexOf(".")==-1)
		eval("document.imgA.src='./Images/sys_img/space.gif';");
	else
		eval("document.imgA.src='./Images/" + arrMenu[tmpArrIndex].ImgUrl + "';");
}

function GetArrayIndex()
{
	var getArrIndex = (leftAmount+1) * CurPage ; //因 array 由 0 算起,故加一
	if(getArrIndex>=arrMenu.length)
		return arrMenu.length -1;
	else
		return getArrIndex;		
}


function eventCalled()
{
	var tmpArrIndex = GetArrayIndex();
	tmpArrIndex += SelFlag;
	parent.PushHistoryUrlArr(location.href);
	switch( arrMenu[tmpArrIndex].ShowMode )
	{
		case 0:
			parent.FrameGo("./coming.aspx");
			break;
        case 1:
            //alert("lmh");
			parent.FrameGo("./main.aspx?ParentID=" + arrMenu[tmpArrIndex].UID);
			break;
        case 3:
            //alert("mengmeng=" + arrMenu[tmpArrIndex].UID);
            window.location.href = "./info.aspx?ParentID=" + arrMenu[tmpArrIndex].UID;
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

function focusToLeftButton( i )
{
	eval("document.forms[0].btnLeft" + i + ".focus();");
}

function UnInit()
{	
	parent.stopSlide();
}
</script>

<script type="text/javascript" >						
function pc_menu_scroll()
{
	var str='';
	str+='<table>';
		
	for(i=0;i<arrMenu.length;i+=1) 
    {
        str+= '<tr><td HEIGHT="13"></td></tr><tr><td>'+ButtonMaker("btnLeft"+i,219,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag="+(i)+";btnOnFocus();","","eventCalled();")+'</td></tr>';
	}
	str+='</table>';
	return str;
}	
</script>

 <script type="text/javascript">						
function settopboxmenu()
{
 	var stb='';
	stb+='<table>';	
	for(b=0;b<leftAmount+1;b+=1) 
    {
	   stb+= '<tr><TD HEIGHT="10"></TD></tr><tr><td>'+ButtonMaker("btnLeft"+b,219,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag="+(b)+";btnOnFocus();","","eventCalled();")+'</td><td><IMG id="a'+b+'" onclick=menuScrollDown();></td></tr>';   
	}
	stb+='</table>';
	return stb;
  
} 
</script>
 
</head>

<body onload="Init()" onunload="UnInit()">
<form id="Form1" method="post" runat="server">
<table id="test" height="683" cellspacing="0" cellpadding="0" width="1024" align="top" style="background:url('Images/sys_img/IPTV_NBG.jpg')">
     <tr>
		<td height="155" colspan="6"></td>
	</tr>
	<tr>
		<td height="423" width="710"></td>
		<td height="423" colspan="3">				    
			<div id="settopbox_menu_list" style=" display:none ; width: 245px; height: 280px;background-color:" align="center">
			   <script type="text/javascript">
				if(BrowserType()=='CT7010')
				{
				   document.getElementById("test").style.background="url('Images/sys_img/BG_720.jpg')";
				   document.getElementById("settopbox_menu_list").style.display='block';
        		   document.getElementById("pc_menu_list").innerHTML=" ";
	    		}
			   </script>
				<table id="Table1" style="height:280 ; width:245" cellspacing="1" cellpadding="1" border="0">
					<tr>
						<td style="height:62 ; width:180"  colspan="2">
							<script type="text/javascript">document.write(ButtonMaker("btnLeft0",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=0;btnOnFocus();","","eventCalled();"));</script>
							<font face="新細明體"></font>
						</td>
						<td height="62"><img id="main_up" style="cursor: pointer" alt="sorry for the image" onclick="javascript:menuScrollUp();" height="41" src="Images/sys_img/space.gif" width="40" name="main_up" /></td>
					</tr>
					<tr>
						<td width="180" colspan="2" height="54">
							<script type="text/javascript">document.write(ButtonMaker("btnLeft1",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=1;btnOnFocus();","","eventCalled();"));</script>
							<font face="新細明體"></font>
						</td>
						<td height="54"></td>
					</tr>
					<tr>
						<td width="180" colspan="2" height="56">
							<script type="text/javascript">document.write(ButtonMaker("btnLeft2",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=2;btnOnFocus();","","eventCalled();"));</script>
							<font face="新細明體"></font>
						</td>
						<td height="56"></td>
					</tr>
					<tr>
						<td style="width:180; height:56" colspan="2">
							<script type="text/javascript">document.write(ButtonMaker("btnLeft3",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=3;btnOnFocus();","","eventCalled();"));</script>
							<font face="新細明體"></font>
						</td>
						<td height="56"></td>
					</tr>
					<tr>
						<td width="180" colspan="2">
							<script type="text/javascript">document.write(ButtonMaker("btnLeft4",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=4;btnOnFocus();","","eventCalled();"));</script>
							<font face="新細明體"></font>
						</td>
						<td><img id="main_down" style="cursor: pointer" alt="sorry for the image" onclick="javascript:menuScrollDown();"  src="Images/sys_img/main_down.jpg" height="43" width="40" name="main_down" /></td>
					</tr>
				</table>
			</div>
			<div id="pc_menu_list" style=" DISPLAY: none; OVERFLOW: auto; WIDTH: 245px; HEIGHT: 280px; BACKGROUND-COLOR:" >
			<script type="text/javascript">
				if(BrowserType()!='CT7010')
				{
      				document.getElementById("pc_menu_list").style.display='block';
					document.getElementById("pc_menu_list").innerHTML=pc_menu_scroll();
					document.getElementById("settopbox_menu_list").innerHTML="";
				}
			</script>
	  	    </div>			
		</td>
		<td style="width:500 ; height:423"><img src="Images/sys_img/space.jpg" alt="sa" name="imgA" width="325" height="250" id="imgA" /></td>
		<td style="width:522 ; height:423"></td>
	</tr>
	<tr>
		<td style="height:51" colspan="6"><input class="QM" type="button" id="btnQM" name="btnQM" borderimage="./Images/sys_img/space.gif" value=" " tabindex="-1" style="BACKGROUND-IMAGE: url(./Images/sys_img/space.gif); WIDTH:954px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 40px; BACKGROUND-COLOR: transparent; BORDER-BOTTOM-STYLE: none" /></td>
	</tr>
	<tr>
		<td style="width:40 ; height:48"></td>
		<td style="width:154">&nbsp;</td>
		<td style="width:143">
			<script type="text/javascript">
			if(parent.IsHavingHistoryUrlArr())
			{
				document.write("<img name='main_back' src='Images/sys_img/main_back.jpg' alt=' ' width=80 height=30 style='cursor:pointer;' onClick='javascript:popHistoryArr();'>");
		    }
			</script>
		</td>
		<td width="168">
            <script type="text/javascript">
			if(parent.IsHavingHistoryUrlArr())
			{
				document.write("<img name='main_back' src='Images/sys_img/main_home.jpg' alt=' ' width=80 height=30 style='cursor:pointer;' onClick='javascript:popToMain();'>");
			}
			</script>
        </td>
		<td></td>
		<td width="48" height="43"></td>
	</tr>
	<tr>
		<td height="48" colspan="6"></td>
	</tr>
</table>
</form>
</body>
</html>


