<%@ Page language="c#" Inherits="Ndapn.VideoMgm" CodeFile="VideoMgm.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<SCRIPT src="ftiens4.js"></SCRIPT>
<SCRIPT src="ua.js"></SCRIPT>
<SCRIPT Language="javascript">
//function DoReload()
//{	
//	setTimeout('location.reload();',1500);
//}
USETEXTLINKS = 1  //replace 0 with 1 for hyperlinks

// Decide if the tree is to start all open or just showing the root folders
STARTALLOPEN = 0 //replace 0 with 1 to show the whole tree

HIGHLIGHT = 1

<%=MakeMenu()%>


	
</SCRIPT>

<HTML>
	<HEAD>
		<title>Video Management</title> 
		<!--#include file="./welcome.htm"! -->
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="mm_lodging1.css" type="text/css" rel="stylesheet">
		<!--<meta http-equiv="PRAGMA" content="NO-CACHE">-->
		<%--<meta http-equiv=refresh content=15 url="./VideoMgm.aspx">--%>
	</HEAD>
	<body onkeydown="keycheck();" >
		<FONT face="新細明體">
		<!--
			<form id="Form0" action="doUL.aspx" method="post" encType="multipart/form-data" >
				<P><INPUT id="VideoUpload" style="WIDTH: 280px; HEIGHT: 22px" type="file" name="VideoUpload"
						runat="server"  ></P>
				<P><INPUT onclick="window.close();" type="button" value="取消"> <INPUT type="submit" value="上傳影片" >
			</form>
			20120210 Kenny--> 
			<form id="Form1" runat="server" action="VideoMgm.aspx" encType="multipart/form-data" method="post">
				<%--<P><asp:listbox id="VideoLs" ondblclick="FeedBack.click();" runat="server" Height="200px" Width="300px"></asp:listbox></P>--%>
				
				<P>
				<SCRIPT>initializeDocument()</SCRIPT>
	            <NOSCRIPT>A tree for site navigation will open here if you enable JavaScript in your browser.
	            </NOSCRIPT>
		        </P>
            <%--<P><INPUT id="FeedBack" onclick="window.close();" type="button" value="設為播放項目"></P>--%>
             <p><asp:TextBox ID="vpath" runat="server" Width="176px"></asp:TextBox><p>
            <P><INPUT id="FeedBack" onclick="window.returnValue.value = vpath.value ;window.close();"
						type="button" value="設為播放項目">
						<%--<INPUT type="button" value="刪除影片" onclick="Delclicked()">--%></P>
            
<%--				<P><INPUT id="FeedBack" onclick="if(VideoLs.selectedIndex==-1){alert('未選擇項目');return;}window.returnValue.value = escape(VideoLs.options[VideoLs.selectedIndex].text);window.close();"
						type="button" value="設為播放項目"><INPUT type="button" value="刪除影片" onclick="Delclicked()"></P>--%>
		</FONT></FORM>
		<script language="JavaScript">
//clay
function path_insert(path){
    document.getElementById("vpath").value = path;
}
<!--
window.onload = initWindow;
function initWindow() {
	//checkFile();
	window.returnValue = window.dialogArguments;
}

function keycheck(evt){
//alert(event.keyCode);
	if(event.keyCode == 27)
		window.close();
	else if (event.keyCode == 13)
		Form1.FeedBack.click();
}
function getURLParam(strParamName)
{
	var strReturn = "";
	var strHref = window.location.href;
	if ( strHref.indexOf("?") > -1 )
	{
		var strQueryString = strHref.substr(strHref.indexOf("?")).toLowerCase();
		var aQueryString = strQueryString.split("&");
	    for ( var iParam = 0; iParam < aQueryString.length; iParam++ )
		{
			if( 
			aQueryString[iParam].indexOf(strParamName.toLowerCase() + "=") > -1 )
			{
				var aParam = aQueryString[iParam].split("=");
				strReturn = aParam[1];
				break;
			}
		}
	}
	return unescape(strReturn);
} 
function Delclicked()
{
	var File = Form1.VideoLs.options[Form1.VideoLs.selectedIndex].text;
	//alert(File);
	if(confirm('確定刪除"'+File+'"?'))
	{
		File = escape(File);
		window.open('./doDel.aspx?FN='+File+'&GC=true',
		'',
		'height=1px,width=1px',
		'');
	}
	else
		return;
}

// -->
		</script>
	</body>
</HTML>
