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
	public partial class main : System.Web.UI.Page
	{
		myAPI myAPI = null;
		
		protected void Page_Load(object sender, System.EventArgs e)
		{
                        //Session["DBName"]="Smart_iTV_V2_6";
                        Session["DBName"]="ndapn";
			myAPI =new myAPI(Session["DBName"].ToString() );
		}

		public string GetMenuScript()
		{
                        string ParentID;
                      string Portal = "P100000";

                        if(Request.Params["ParentID"]==null){
			   string SelCmd = "SELECT Cate_UID FROM CategoryTemplate Where Cate_TypeOfNode = 0"+
					"AND ( [Cate_ShowArea] = "+myAPI.SetSTB().ToString()+
					"OR [Cate_ShowArea] = 0)"
					+" ORDER BY  Cate_SortNum DESC, Cate_UID DESC";
			   SqlDataReader myDataReader = myAPI.Create_Rd(SelCmd);
			   if(myDataReader.Read())
				ParentID = myDataReader["Cate_UID"].ToString();
			   else
				return null;
			}
			else
			   ParentID = Request.Params["ParentID"].ToString();

			return myAPI.GetMenuScript(ParentID,Portal);			
		}
        
		#region Web Form 設計工具產生的程式碼
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent(){ }
		#endregion
	}
}
