<%@ Page language="c#" Inherits="Ndapn.VideoZone" CodeFile="VideoZone.aspx.cs" %>
<%@ Import Namespace="System.Net" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>VideoZone</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script language="JavaScript">
			//黃奕誠新增
			if(window.dialogArguments.Form1.ChooseVideo.value.indexOf("點擊選擇影音") > -1 ||window.dialogArguments.Form1.ChooseVideo.value==""){
				alert("請先選擇影片");
				window.close();
			}
		</script>
		<style type="text/css">
			#Form1 table {
				width: 100%;
				text-align: center;
				border-top: 1px dashed #FF9900;
				border-bottom: none;
				border-left: none;
				border-right: 1px dashed #FF9900;
			}
			#Form1 td {
				width: 80%;
				text-align: center;
				border-top: none;
				border-bottom: 1px dashed #FF9900;
				border-left: 1px dashed #FF9900;
				border-right: none;
				font-size: 80%;
				color: #000000;
			}
		</style>
	</HEAD>
	<body bottomMargin="0">
	<%
        System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
	%>
		<script language="JavaScript">
		var  Video='<object id="myplayer" width="320" height="240" classid="CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6">'+
			'<param name="URL" value="mms://'+'<%=(sever_ip.ToString())%>'+'/video/'+window.dialogArguments.Form1.ChooseVideo.value+'">'+
			'<param name="autoStart" value="1">'+
			'<param name="balance" value="0">'+
			'<param name="currentPosition" value="0">'+
			'<param name="currentMarker" value="0">'+
			'<param name="defaultFrame" value="0">'+     
			'<param name="enabled" value="1">'+
			'<param name="enableErrorDialogs" value="0">'+
			'<param name="enableContextMenu" value="1">'+               
			'<param name="fullScreen" value="0">'+    
			'<param name="invokeURLs" value="1">'+
			'<param name="mute" value="0">'+
			'<param name="playCount" value="1">'+   
			'<param name="rate" value="1">'+
			'<param name="stretchToFit" value="0">'+
			'<param name="uiMode" value="full">'+
			'<param name="volume" value="100">'+
			'<param name="windowlessVideo" value="1">'+
			'</object>';
			
		function Timeset(id,time){
			document.getElementById(id).value=time;
		}
		</script>
		<form id="Form1" method="post" runat="server">
			<FONT face="新細明體">
				<TABLE id="Table1" cellSpacing="0" width="320" border="1" align="center">
					<TR>
						<TD colSpan="3"><script>document.write(Video);</script></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 130px">
							目前時間位置：</TD>
						<TD style="WIDTH: 160px">
							<asp:TextBox id="time" runat="server" Width="130px" ReadOnly="True"></asp:TextBox></TD>
						<TD style="WIDTH: 80px">
							<br>
						</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 130px">
							影片開始時間：</TD>
						<TD style="WIDTH: 160px">
							<asp:TextBox id="time_start" runat="server" Width="130px" ReadOnly="True"></asp:TextBox></TD>
						<TD style="WIDTH: 80px">
							<input type="button" value="設定" onClick="Timeset('time_start',document.getElementById('time').value)">
						</TD>
					</TR>
					<TR>
						<TD style="WIDTH: 130px">
							影片結束時間：</TD>
						<TD style="WIDTH: 160px">
							<asp:TextBox id="time_end" runat="server" Width="130px" ReadOnly="True"></asp:TextBox></TD>
						<TD style="WIDTH: 80px">
							<input type="button" value="設定" onClick="Timeset('time_end',document.getElementById('time').value)">
						</TD>
					</TR>
				</TABLE>
			</FONT>
			<div align="center"><input type="button" value="加入時間" onClick="if(document.getElementById('time_start').value==''){alert('未設定開始時間');return;}else if(document.getElementById('time_end').value==''){alert('未設定結束時間');return;}else if(document.getElementById('time_start').value > document.getElementById('time_end').value){alert('開始時間不可大於結束時間');return;}insert();window.close();"></div>
		</form>
		<script>
			//黃奕誠新增
			function mediatime(){
				var mediaObj = document.getElementById("myplayer");
				if(mediaObj != null){
				    document.getElementById("time").value=mediaObj.controls.currentPositionString;
				    setTimeout("mediatime()",500);
				}
				else{
				    alert("請將瀏覽器的預設播放器設定成Window Media Player！");
				}
			}
			//黃奕誠新增
			function insert(){
				var insert_start=document.getElementById('time_start').value;
				var insert_end=document.getElementById('time_end').value;
				var insert_form=window.dialogArguments.Form1;

				if(insert_start.indexOf(":") < insert_start.lastIndexOf(":")){
					insert_form.txtVideoTimeStartHour.value=insert_start.substring(0,insert_start.indexOf(":"));
					insert_form.txtVideoTimeStartMin.value=insert_start.substring(insert_start.indexOf(":")+1,insert_start.lastIndexOf(":"));
					insert_form.txtVideoTimeStartSec.value=insert_start.substring(insert_start.lastIndexOf(":")+1,insert_start.length);
					insert_form.txtVideoTimeEndHour.value=insert_end.substring(0,insert_end.indexOf(":"));
					insert_form.txtVideoTimeEndMin.value=insert_end.substring(insert_end.indexOf(":")+1,insert_end.lastIndexOf(":"));
					insert_form.txtVideoTimeEndSec.value=insert_end.substring(insert_end.lastIndexOf(":")+1,insert_end.length);
				}
				else{
					insert_form.txtVideoTimeStartHour.value="00";
					insert_form.txtVideoTimeStartMin.value=insert_start.substring(0,insert_start.indexOf(":"));
					insert_form.txtVideoTimeStartSec.value=insert_start.substring(insert_start.indexOf(":")+1,insert_start.length);
					insert_form.txtVideoTimeEndHour.value="00";
					insert_form.txtVideoTimeEndMin.value=insert_end.substring(0,insert_end.indexOf(":"));
					insert_form.txtVideoTimeEndSec.value=insert_end.substring(insert_end.indexOf(":")+1,insert_end.length);
				}
			}
		</script>
		<script>mediatime()</script>
	</body>
</HTML>
