<%@ Page language="c#" Inherits="LibraryMOD.main" CodeFile="main.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<HTML>
	<HEAD>
		<TITLE></TITLE>
		<meta content="MODE=online; TOOLBAR=off; NOSCROLL" name="ncbrowsermode">
		<meta http-equiv="PRAGMA" content="NO-CACHE">
		<script language="javascript" src="./JS/KeyObj.js"></script>
		<script language="javascript" src="./JS/ButtonMenu.js"></script>
		<script language="javascript" src="./JS/keymap.js" type="text/javascript"></script>
		<script>
                alert('huang');
//������
eval(top.LockKeyStr);
		</script>

		<%=GetMenuScript()%>

		<script> 
//���JCSS
var cssStr= '<LINK href="./CSS/' + top.STBVersion + '.css" type="text/css" rel="stylesheet">' ;	
document.write(cssStr);	
		</script>

		<script>
//����B�z
function KEY_HANDLER(e) 
{	
	eval(top.KeyHandlerStr);
	switch (KCode) 
	{  
		case key.RED:
			if(top.STBVersion=="MSIE")
			{
				alert("PC�ϥΪ̤����Ѫ����W�D�\��, �Ш���");
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
			
		//��V��
		
		case key.ARROW_LEFT:// ��	
		case key.ARROW_UP:// ��			
			return menuScrollUp();
			return false;
		case key.ARROW_RIGHT:// ��
		case key.ARROW_DOWN:// ��
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

		<script>
//************************* GLOBAL VARIABLE *****************************************
var leftAmount =4;//�C�����s�e�q 0-3 = 4
var leftAmount_tmp = leftAmount;//�p�G������,menu�ƶq����5��(�Ҧp�u�l2��),�h���Ʒ|�K�� 2, �ΥH����ϥΪ̩��U�����3��btn
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
				eval('document.forms[0].btnLeft' + i + '.value="";');//menu�S�F,�ɪŭȵ��Ѿl��btn
			leftAmount_tmp = j;
		}
		else{
			eval('document.forms[0].btnLeft' + i + '.value="' + arrMenu[j].Title + '";');
			
			}
	}
}

function Init()
{	
	alert(arrMenu.length);
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
	
	if(SelFlag == 0 && CurPage==0)//���W�S��item�F	
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

	if(SelFlag == leftAmount_tmp && CurPage == MaxPages) //�p�G�ثe�ҿ�ܪ�btn�����̫�@��item,�åB�ثe�b�̫�@��	
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
	var getArrIndex = (leftAmount+1) * CurPage ; //�] array �� 0 ��_,�G�[�@
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
			parent.FrameGo("./main.aspx?ParentID=" + arrMenu[tmpArrIndex].UID);
			break;
		case 3:
			parent.FrameGo("./info.aspx?ParentID=" + arrMenu[tmpArrIndex].UID);
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

		<script>						
function pc_menu_scroll()
{
	var str='';
	str+='<table>';
		
	for(i=0;i<arrMenu.length;i+=1) 
        {
        str+= '<tr><TD HEIGHT="13"></TD></tr><tr><td>'+ButtonMaker("btnLeft"+i,219,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag="+(i)+";btnOnFocus();","","eventCalled();")+'</td></tr>';
	}
	str+='</table>';
	return str;
}	
		</script>

                <script>						
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
 
</HEAD>

<BODY oncontextmenu="window.event.returnValue=false" bottomMargin="0" bgColor="white" leftMargin="0" topMargin="0" onLoad="Init()" rightMargin="0" onUnload="UnInit()">
<form id="Form1" method="post" runat="server">
<TABLE id="test" height="683" cellSpacing="0" cellPadding="0" width="1024" align="top" style="background:url('Images/sys_img/IPTV_NBG.jpg')">
        <TR>
		<TD height="155" colspan="6"></TD>
	</TR>
	<TR>
		<TD height="423" width="710"></TD>
		<TD height="423" colspan="3">				    
			<DIV id="settopbox_menu_list" style=" DISPLAY:none ; WIDTH: 245px; HEIGHT: 280px;BACKGROUND-COLOR:" align="center">
			   <script>
				if(BrowserType()=='CT7010')
				{
				   document.getElementById("test").style.background="url('Images/sys_img/BG_720.jpg')";
				   document.getElementById("settopbox_menu_list").style.display='block';
        		           document.getElementById("pc_menu_list").innerHTML=" ";
              
	    			}
			   </script>
				<TABLE id="Table1" height="280" cellSpacing="1" cellPadding="1" width="245" border="0">
					<TR>
						<TD width="180" colSpan="2" height="62">
							<script>document.write(ButtonMaker("btnLeft0",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=0;btnOnFocus();","","eventCalled();"));</script>
							<FONT face="�s�ө���"></FONT>
						</TD>
						<TD height="62"><IMG id="main_up" style="CURSOR: pointer" onClick="javascript:menuScrollUp();" height="41" src="Images/sys_img/space.gif" width="40" name="main_up"></TD>
					</TR>
					<TR>
						<TD width="180" colSpan="2" height="54">
							<script>document.write(ButtonMaker("btnLeft1",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=1;btnOnFocus();","","eventCalled();"));</script>
							<FONT face="�s�ө���"></FONT>
						</TD>
						<TD height="54"></TD>
					</TR>
					<TR>
						<TD width="180" colSpan="2" height="56">
							<script>document.write(ButtonMaker("btnLeft2",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=2;btnOnFocus();","","eventCalled();"));</script>
							<FONT face="�s�ө���"></FONT>
						</TD>
						<TD height="56"></TD>
					</TR>
					<TR>
						<TD width="180" colSpan="2" height="56">
							<script>document.write(ButtonMaker("btnLeft3",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=3;btnOnFocus();","","eventCalled();"));</script>
							<FONT face="�s�ө���"></FONT>
						</TD>
						<TD height="56"></TD>
					</TR>
					<TR>
						<TD width="180" colSpan="2">
							<script>document.write(ButtonMaker("btnLeft4",180,37,"","./Images/sys_img/main.jpg","./Images/sys_img/space.gif","list","SelFlag=4;btnOnFocus();","","eventCalled();"));</script>
							<FONT face="�s�ө���"></FONT>
						</TD>
						<TD><IMG id="main_down" style="CURSOR: pointer" onClick="javascript:menuScrollDown();"  src="Images/sys_img/main_down.jpg" height="43" width="40" name="main_down"></TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV id="pc_menu_list" style=" DISPLAY: none; OVERFLOW: auto; WIDTH: 245px; HEIGHT: 280px; BACKGROUND-COLOR:" >
			<script>
				if(BrowserType()!='CT7010')
				{
      					document.getElementById("pc_menu_list").style.display='block';
					document.getElementById("pc_menu_list").innerHTML=pc_menu_scroll();
					document.getElementById("settopbox_menu_list").innerHTML="";
	
				}
			</script>
	  	        </DIV>			
		</TD>
		<TD width="500" height="423"><img src="Images/sys_img/space.jpg" alt="sa" name="imgA" width="325" height="250" id="imgA"></TD>
		<TD width="522" height="423"></TD>
	</TR>
	<TR>
		<TD height="51" colspan="6"><input class="QM" type="button" id="btnQM" name="btnQM" borderimage="./Images/sys_img/space.gif" value=" " tabIndex="-1" style="BACKGROUND-IMAGE: url(./Images/sys_img/space.gif); WIDTH:954px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 40px; BACKGROUND-COLOR: transparent; BORDER-BOTTOM-STYLE: none"></TD>
	</TR>
	<TR>
		<TD width="40" height="48"></TD>
		<TD width="154">&nbsp;</TD>
		<TD width="143">
			<script>
			if(parent.IsHavingHistoryUrlArr())
			{
				document.write("<img name='main_back' src='Images/sys_img/main_back.jpg' alt=' ' width=80 height=30 style='cursor:pointer;' onClick='javascript:popHistoryArr();'>");
		        }
			</script>
		</TD>
		<TD width="168"><script>
			if(parent.IsHavingHistoryUrlArr())
			{
				document.write("<img name='main_back' src='Images/sys_img/main_home.jpg' alt=' ' width=80 height=30 style='cursor:pointer;' onClick='javascript:popToMain();'>");
			}
			</script></TD>
		<TD></TD>
		<TD width="48" height="43"></TD>
	</TR>
	<TR>
		<TD height="48" colspan="6"></TD>
	</TR>
</TABLE>
</form>
</BODY>
</html>


