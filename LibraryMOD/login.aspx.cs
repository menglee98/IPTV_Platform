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
using System.Data.SqlClient;

using LibraryMOD.API;

namespace LibraryMOD
{
	/// <summary>
	/// login ���K�n�y�z�C
	/// </summary>
	public partial class login : System.Web.UI.Page
	{
		public string MovieName, LoginStatus, ContentID, ParentID;
		protected void Page_Load(object sender, System.EventArgs e)
		{
		
			// �b�o�̩�m�ϥΪ̵{���X�H��l�ƺ���
	
				if(Request.Params["ContentID"]!=null && Request.Params["MovieName"]!=null && Request.Params["ParentID"]!=null)
				{
					MovieName = Request.Params["MovieName"].ToString();
					ContentID = Request.Params["ContentID"].ToString();
					ParentID = Request.Params["ParentID"].ToString();

					if(Request.Params["UserSN"]!=null)//user had entered the ID --> to open db to check
					{
						myAPI myAPI = null;

						if(Session["DBName"]==null) Response.Redirect ("LogOn.aspx");
						myAPI =new myAPI(Session["DBName"].ToString() );
						
						if(myAPI.Check_User(Request.Params["UserSN"].ToString().Trim()))
						{	
							//20090813 clay����
							//myAPI.Update_View_Content_Log(Request.Params["UserSN"].ToString(), ContentID, Request.UserHostAddress.ToString(),Session.SessionID);
							LoginStatus = "1";//logon
						}
						else
						{
							LoginStatus = "0";//login failed
						}
					}					
						
				}
				else
					Response.Redirect("main.aspx");

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
