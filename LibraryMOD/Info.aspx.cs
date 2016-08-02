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
using LibraryMOD.API;

namespace LibraryMOD
{
	public partial class Info : System.Web.UI.Page
	{
		myAPI myAPI = null;
        public string ParentID, LoginStatus;  
		protected void Page_Load(object sender, System.EventArgs e)
		{
                     
           Session["DBName"] = "ndapn";
			myAPI =new myAPI(Session["DBName"].ToString() );

			if(Request.Params["LoginStatus"]!=null) 
				LoginStatus = Request.Params["LoginStatus"].ToString();
            
			if(Request.Params["ParentID"]==null)
				Response.Redirect("./main.aspx");
			else
				ParentID = Request.Params["ParentID"].ToString();
		}

		public string GetReferUrl()
		{
			return Request.UrlReferrer.ToString();
		}

		public string GetContentScript()
		{
			return myAPI.GetContentScript(ParentID);			
		}
        
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent(){ }
	}
}
