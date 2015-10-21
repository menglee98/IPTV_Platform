<%@ Page language="c#" Inherits="LibraryMOD.Default" CodeFile="Default.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>Smart iTV</title>
   <meta content="MODE=online; TOOLBAR=off; NOSCROLL" name="ncbrowsermode" />
   <meta http-equiv="PRAGMA" content="NO-CACHE" />
<script type="text/javascript" language="javascript" src="./JS/KeyObj.js"></script>       
<script type="text/javascript" language="javascript" src="./JS/FrameCtrl.js"></script>
<script type="text/javascript"> var space = "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@";</script>
<script type="text/javascript" language="javascript" src="./JS/cookieUtility.js"></script>
		
<script type="text/javascript">
alert("hhhh");
var ObjTemp = new Object(); 	
var ArraryTemp = new Array();
var UserID = new Object();		

var LoadFlag = 1 ;
var PlayFlag = false ;
var HistoryFlag = -1;

var HistoryUrlArr = new Array();

function PushHistoryUrlArr(url_str)
{
	var ObjUrlTemp = new Object();
	ObjUrlTemp.url=url_str;
	HistoryUrlArr.push(ObjUrlTemp);
}

function IsHavingHistoryUrlArr()
{
	if(HistoryUrlArr.length>0)	
		return true;
	else
		return false;
}

</script>
		
<script type="text/javascript">eval(top.PreloadStr);</script>
		
<script type="text/javascript">

function UpdateContentLog(content_id)
{	
	ifrHidden.location.href="./update_content_log.aspx?content_id=" + content_id + "&UserID="+getCookie('UserID');		
	setTimeout('ifrHidden.location.href="./Blank.htm";',3000);
}

function PlayMovie( MediaName )
{		
	var MediaUrl;
	if(top.STBVersion=="MSIE"||"GOOGLE")
	{	
		var chasm = screen.availWidth;
		var mount = screen.availHeight;
		var w = 800;
		var h = 600;
		MediaUrl =  './msplayer/msplayer.aspx?' + MediaName ;		
		
		ifrMain.location.href = MediaUrl; 
	}
	else
	{
		MediaUrl = location.href + '580/jsvideo.html?' + MediaName;			
		ifrMain.location.href = MediaUrl;
	}	
}

function StopMovie() {top.StopStream();}

function Init()
{	
	if(top.STBVersion=="MSIE")
	{
		alert('lee');
		ifrMain.location.href="./main.aspx";
	}
	else
	{	
		alert('meng');
		setTimeout('ifrMain.location.href="./main.aspx";',3000);  
	} 
	var cmd = './Images/sys_img/Loading_720.jpg';
    Preload(cmd); 
}

function UnInit(){}

</script>

</head>

<body oncontextmenu=window.event.returnValue=false bottomMargin=0 bgColor=#000000 leftMargin=0 topMargin=50 onload=Init() rightMargin=0 onunload=UnInit()>
   <form id="Form1" method="post" runat="server">
      <center> 
         <iframe id=Iframe1 tabIndex=-1 name=ifrMain src="Blank.htm" frameBorder=0 scrolling=yes height=683 width=1024></iframe>
	 <iframe id="ifrHidden" tabIndex="-1" name="ifrHidden" src="Blank.htm" frameBorder="0" width="0" scrolling="yes" height="0"></iframe>
      </center>
   </form>
</body>
</html>
