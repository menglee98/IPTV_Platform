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
using System.IO;
using System.Net;
using System.Data.SqlClient;
using Ndapn.MyTool;

namespace Ndapn
{
	/// <summary>
	/// doUL ���K�n�y�z�C
	/// </summary>
	public partial class doUL : System.Web.UI.Page
	{
//2007/9/22	�_���p	private string videoPath = @"D:\WEB_SITE\www.modlife.com.tw\wfsroot";
		//private string videoPath = @"D:\Inetpub\wwwroot\Smart-iTV_V2.3\video";
		//private string videoPath = @"C:\Inetpub\wwwroot\Smart-iTV_V2.4\video";
        System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
        private string videoPath = @"\\";
		public string onload = "window.opener=null;window.open('','_self');window.close();";
		string filename = null;
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// �b�o�̩�m�ϥΪ̵{���X�H��l�ƺ���
            string name;
            name = Session["UserID"].ToString();
            string link = Request.Form["link"];
            videoPath += sever_ip + "\\WMPub\\WMRoot\\1234\\"+link;
            //videoPath += sever_ip + "\\WMPub\\WMRoot\\1234";
			try
			{
				string [] split = Request.Files[0].FileName.Split('\\');
				filename = split[split.Length-1];
				if(!videoPath.EndsWith("\\"))
					videoPath+="\\";
				Request.Files[0].SaveAs(videoPath+ filename);

			}
            catch { onload = "alert('"+videoPath+"');" + onload; return; }
			onload = "alert('�W�Ǧ��\');" +onload;
            InsertFile1(filename, name);
			//VideoMgm.a = "history.go(0);";
        }
		private void Existschk()
		{
			if(!Directory.Exists(videoPath))
			{
				onload= "alert('�ϥΪ̥ؿ����s�b');"+ onload;
				return;
			}
			string tmp = filename;
			int i =1;
			while(File.Exists(videoPath+tmp))
			{
				string [] split = filename.Split('.');
				string ext = split[split.Length-1];
				tmp = filename.Replace("."+ext,"("+i.ToString()+")."+ext);
				i++;
			}
		}

        private void InsertFile1(string di,string UserSN)
        {
            API myAPI = null;
            myAPI = new API("Smart-iTV_V2_5");
            string WhereCmd1;
            string InsertCmd1 = "Insert into TreeTemplate(Tree_UID,Tree_Name,Tree_ParentUID,Tree_TypeOfNode,Tree_SortNum,PortalName,UserSN)";
            //WhereCmd1 = "Values('112',N'" + di + "','416','3','1', 'P200000',N'" + UserSN + "')";
            WhereCmd1 = "Values('112',N'" + di + "','416','3','1', 'P200000','1234')";
            myAPI.Edit_Data(InsertCmd1 + WhereCmd1);
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
