<%@ Page language="c#" Inherits="Ndapn.top" CodeFile="top.aspx.cs" %>
<%@ Import Namespace="System.Net" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>top</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" Content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<link rel="stylesheet" href="css/content_style.css" type="text/css" media="all" />
		<link rel="stylesheet" href="css/main_style.css" type="text/css" media="all" />
		
		<link rel="stylesheet" href="css/top_content_style.css" type="text/css" media="all" />
	</head>
	<body>
	<%
        System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
	%>
		<div id="logo">
			<img src="images/logo.jpg" alt="" style="width:1080; height:60" />
		</div>
		<div id="buttonlist">
			<ul>
				<li><a href="javascript:void(0);" onclick="top.location.href='http://'+document.domain+'/ndapn/default.htm?Flag=nodeadd';">新增目錄或影音項目</a></li>
<%
if(Session["userGroup"]!=null){
	if(Session["userGroup"].ToString()=="P100000"){
	   Response.Write("<li><a href='Support/default.aspx' target='_parent'>報表系統</a></li>");
           Response.Write("<li><a href='logout.aspx'>登出</a></li>");
           for (int i = 1; i <= 2; i++)
              Response.Write("<li><a></a></li>");
	}
	else{
           Response.Write("<li><a href='logout.aspx'>登出</a></li>");
           for (int i = 1; i <= 6; i++)
              Response.Write("<li><a></a></li>");
	}
}
else{
    Response.Write("<li><a href='logout.aspx'>登出</a></li>");
    for (int i = 1; i <= 6; i++)
        Response.Write("<li><a></a></li>");
}
%>
			</ul>
		</div>
	</body>
</html>
