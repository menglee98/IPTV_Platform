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

namespace Ndapn
{
	public partial class welcome : System.Web.UI.Page
	{
		public string onload = "";
		public string DBName = "";
		protected void Page_Load(object sender, System.EventArgs e)
		{
			try{
				DBName = Session["DBName"].ToString();
			}
			catch{
				onload = "alert('�Х��n�J');top.location.href='./default.aspx';";
			}
		}

		#region Web Form �]�p�u�㲣�ͪ��{���X
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent(){}
		#endregion
	}
}
