<%@ Page language="c#" Inherits="LibraryMOD.msplayer.msplayer" CodeFile="msplayer.aspx.cs" %>
<%@ Import Namespace="System.Net" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>(���I��U�Ϋ�Alt+Enter��H���ù�)</TITLE>
		<META CONTENT="text/html; charset=big5" HTTP-EQUIV="Content-Type">
		<META NAME="Generator" CONTENT="PhotoImpact">
		<script type="text/javascript" language="javascript" src="keymap.js"></script>
		<script language="javascript" src="KeyObj.js"></script>
<%
	Application.Contents.Remove("User_IP_");
    System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
   
%>
		<script language="JavaScript">
//20090514 ������ �s�W

var video_server='<%=(sever_ip.ToString())%>';
var play_times=parseInt('<%=(Session["play_times"])%>');
var user_ip=('<%=(Session["User_IP_"])%>');
var time_diff='<%=(Session["time_diff"])%>';
var time_diff_val = 0;


if(time_diff != ""){
    var time_diff_arr = time_diff.split("#");
    time_diff_val = parseInt(time_diff_arr[0]);
}

eval(top.LockKeyStr);

setTimeout("window.focus();",3000);
var cgi=location.search;
var len = cgi.length;
var file=cgi.slice(1,len);
var browser_type=BrowserType();
var Video;
if(browser_type == "CT7010"){
    if(file.substring(file.lastIndexOf("."),len)==".wsx"){
	    Video = media_player(browser_type, "wsx");
    }
    else if(file.indexOf("http://") > -1){
	    Video = media_player(browser_type, "http");
    }
    else{
	    Video = media_player(browser_type, "");
    }
}
else{
    if(file.substring(file.lastIndexOf("."),len)==".wsx"){
        Video = media_player(browser_type, "wsx");
    }
    else if(file.indexOf("http://") > -1){
        Video = media_player(browser_type, "http");
    }
    else{
        Video = media_player(browser_type, "");
    }
}

alert(Video);

function media_player(device,type){
     
    var media_obj = '<div align="center"><object id="MPlyr" width="720" height="480" type="video/x-ms-wmv">';
    var wsx_ = '<param name="Filename" value="mms://' + '120.96.183.21' + '/media/' + file + '">';
    var http_ = '<param name="Filename" value="' + file + '">';
    var common_ = '<param name="Filename" value="mms://' + '120.96.183.21' + '/video/' + file + '">';    
    var common2_ = '<param name="Filename" value="mms://' + '120.96.183.21' + '/video/' + file + '">';//�v�����񦸼ƹL�h�ϥ� 
    var common3_ = '<param name="Filename" value="mms://' + '120.96.183.21' + '/video/' + file + '">';//��user_ip��m�ϥ�
    var control_true = '<param name="ShowControls" value="false"><param name="EnableContextMenu" value="true">';
    var control_false = '<param name="ShowControls" value="false"><param name="EnableContextMenu" value="false">';
    
    
    if(device == "CT7010"){
        if(type == "wsx"){
            media_obj += wsx_ + control_false;
        }
        else if(type == "http"){
            media_obj += http_ + control_false;
        }
        else{     
               
            if(user_ip == "120.96.183.21"){
                media_obj += common_ + control_false;   
            }
            else{
                if(play_times>=100){media_obj += common2_ + control_false;}
                else{media_obj += common_ + control_false;}
            }
        }
    }
    else{
        if(type == "wsx"){
            media_obj += wsx_ + control_true;
        }
        else if(type == "http"){
            media_obj += http_ + control_false;
        }
        else{
            //media_obj += common_ + control_true;
            if(user_ip == "120.96.183.22"){
                  media_obj += common_ + control_true;
            }
            else{
                if(play_times>=100){media_obj += common2_ + control_true;}
                else{media_obj += common_ + control_true;}
            }
        }
    }
    
    media_obj += '</object></div>';
    
    return media_obj;
}

function mediatime(){
	var mediaObj = document.getElementById("MPlyr");
	if(mediaObj.playState == 0)
		if(time_diff_val > 0)
			BroadBack();
		else
			GoBack();

	setTimeout("mediatime()",1000);
}

//����B�z
function KEY_HANDLER(e) 
{
	//alert("KEY_HANDLER");
	
	eval(top.KeyHandlerStr);
	//top.MediaFrame.log(KCode);
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
			//alert("POWER");
			return true;
			
		case key.BACK:	
			hitory.back();
			return true;
		
		default:
			return false;					
	}
	return true;
}

function GoBack()
{
	history.back();
	history.back();
}
function BroadBack(){
	location.href="../main.aspx";
}
		</script>
	</HEAD>
	<body onkeydown="keymap()" oncontextmenu="window.event.returnValue=false" onunload="clean_ip();" valign="middle" bgcolor="#000000" leftMargin="0" topMargin="100" rightMargin="0" bottomMargin="0">
		<div align="center" id="abc">
		<TABLE align="center" BORDER="0" CELLPADDING="0" CELLSPACING="0" id="abcd">
			<TR>
				<TD WIDTH="720" HEIGHT="480"><script>document.write(Video);</script></TD>
			</TR>
			<TR>
				<TD><a href="#" onclick="GoBack()"><font color="#FFFFFF">Back</font></a></TD>
			</TR>
		</TABLE>
		</div>
		<form>
		<input id="user_ip" type="hidden" value="<%=(Session["User_IP_"])%>" />
				
        <script LANGUAGE = "JScript"  FOR = MPlyr EVENT = playStateChange(NewState)> //Eddy & Kong �� for �Ϭq����
           if(BrowserType()=='CT7010'){
              if(file.substring(file.lastIndexOf("."),len)==".wsx"){
                 if(NewState==2){   //2 means paused in mediaplayer state
                    history.back();
                    history.back(); 
                 }
              } 
           }
        </script>
		
		</form>
		<script>mediatime();</script>
	</body>
</HTML>