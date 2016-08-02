using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;

namespace VideoMgm
{
	/// <summary>
	/// doDel 的摘要描述。
	/// </summary>
	public partial class doDel : System.Web.UI.Page
	{
//2007/9/22 柯旭峰		private string videoPath = @"D:\WEB_SITE\www.modlife.com.tw\wfsroot";
		//private string videoPath = @"D:\Inetpub\wwwroot\Smart-iTV_V2.3\video";
		//private string videoPath = @"C:\Inetpub\wwwroot\Smart-iTV_V2.4\video";
        System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
        private string videoPath = @"\\";
		public string onload = "window.opener=null;window.open('','_self');window.close();";
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在這裡放置使用者程式碼以初始化網頁
            string name;
            name = Session["UserID"].ToString();
            videoPath += sever_ip + "\\WMPub\\WMRoot\\"+name;
			string FN = Request.Params["FN"];
			if(!videoPath.EndsWith("\\"))
				videoPath+="\\";
			if(!Directory.Exists(videoPath) || !File.Exists(videoPath+FN))
			{
				onload = "alert('找不到路徑');" + onload;
				return;
			}
			if(!Directory.Exists(videoPath+"RECYCLER"))
				Directory.CreateDirectory(videoPath+"RECYCLER");

			string tmp = FN;
			int i = 1;
			while(File.Exists(videoPath+"RECYCLER\\"+tmp))
			{
				string [] split = FN.Split('.');
				string ext = split[split.Length-1];
				tmp = FN.Replace("."+ext,"("+i.ToString()+")."+ext);
				i++;
			}
			//FN = tmp;
			
			File.Move(videoPath+FN ,videoPath+"RECYCLER\\"+tmp);
			onload = "alert('刪除完成');" + onload;
		}

		#region Web Form 設計工具產生的程式碼
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 此為 ASP.NET Web Form 設計工具所需的呼叫。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 此為設計工具支援所必須的方法 - 請勿使用程式碼編輯器修改
		/// 這個方法的內容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
	}
}
