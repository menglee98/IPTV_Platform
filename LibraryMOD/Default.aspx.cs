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

using MPLibrary;
using System.Data.SqlClient;
using System.Configuration;

using LibraryMOD.API;

namespace LibraryMOD
{
	/// <summary>
	/// WebForm1 ���K�n�y�z�C
	/// </summary>
	public partial class Default : System.Web.UI.Page
	{
		private string IPAddr;
		private string MdNum;
		private string STB;
		private string NetWork;
		myAPI myAPI = null;
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(Session["DBName"]==null) Response.Redirect ("LogOn.aspx");
			Session["DBName"]="ndapn";
			myAPI =new myAPI(Session["DBName"].ToString() );
			
			
			#region �s������

			#endregion
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
		{  }
		#endregion
	}
}