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
	/// doDel ���K�n�y�z�C
	/// </summary>
	public partial class doDel : System.Web.UI.Page
	{
//2007/9/22 �_���p		private string videoPath = @"D:\WEB_SITE\www.modlife.com.tw\wfsroot";
		//private string videoPath = @"D:\Inetpub\wwwroot\Smart-iTV_V2.3\video";
		//private string videoPath = @"C:\Inetpub\wwwroot\Smart-iTV_V2.4\video";
        System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
        private string videoPath = @"\\";
		public string onload = "window.opener=null;window.open('','_self');window.close();";
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// �b�o�̩�m�ϥΪ̵{���X�H��l�ƺ���
            string name;
            name = Session["UserID"].ToString();
            videoPath += sever_ip + "\\WMPub\\WMRoot\\"+name;
			string FN = Request.Params["FN"];
			if(!videoPath.EndsWith("\\"))
				videoPath+="\\";
			if(!Directory.Exists(videoPath) || !File.Exists(videoPath+FN))
			{
				onload = "alert('�䤣����|');" + onload;
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
			onload = "alert('�R������');" + onload;
		}

		#region Web Form �]�p�u�㲣�ͪ��{���X
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: ���� ASP.NET Web Form �]�p�u��һݪ��I�s�C
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����]�p�u��䴩�ҥ�������k - �ФŨϥε{���X�s�边�ק�
		/// �o�Ӥ�k�����e�C
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
	}
}
