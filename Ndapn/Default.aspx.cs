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
	/// <summary>
	/// _Default ??????
	/// </summary>
	public partial class _Default : System.Web.UI.Page
	{
	
		public string permission;

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			se_GetPortalMapping();
			try
			{
				string s = Session.Contents[0].ToString();
				Response.Redirect("default.htm");
			}
			catch{}
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion


		protected void btnLogOn_Click(object sender, System.EventArgs e)
		{

			
			if (this.IsValid==true)
			{
				string userUserID=txtUserID.Text;
				string userPwd=txtUserPwd.Text;
				string userGroup=se.SelectedItem.Value;//??(clay)?
					
				MyTool.API myAPI = new MyTool.API("ndapn");

				
				if ( userUserID != null)
				{

					//need check pwd
					DataTable dt0 = myAPI.GetUserPD(userUserID);
					if(dt0.Rows.Count==0)
					{
						ShowMsg("????");
						se.Items.Clear();
						se_GetPortalMapping();//??(clay)?
						return;
					}

					if (userPwd == dt0.Rows[0].ItemArray.GetValue(0).ToString() )
					{
						//pwd correct
						if ( dt0.Rows[0].ItemArray.GetValue(1).ToString() == userGroup)
						{
							//string permission = userUserID;
							//devin 070424 "1"????
							//Response.Cookies.Add(new System.Web.HttpCookie("UserID",userUserID));
							Response.Cookies["UserID"].Value = userUserID;
                            Session["UserID"] = userUserID;
							//string fxxk = Request.Cookies["UserID"].Value;
						
							Session["DBName"] = dt0.Rows[0].ItemArray.GetValue(2).ToString();
							string s = Session["DBName"].ToString();
							Session["userGroup"]=userGroup;
							Response.Redirect ("default.htm");
						
						}
						else
						{
							// incorrect
							ShowMsg("????");
							se.Items.Clear();
							se_GetPortalMapping();//??(clay)?
						}
						
					}
					else
					{
						//pwd incorrect
						ShowMsg("????,?????");
						se.Items.Clear();
						se_GetPortalMapping();//??(clay)?
					}

				}
				else	// not available user name 
				{
					ShowMsg("????,?????");
					se.Items.Clear();
					se_GetPortalMapping();//??(clay)?
				}

			}
			
		}

		private void ShowMsg(string msgStr)
		{
			lblMsg.Text=msgStr;
		}
		//20081009??(clay)????
		private void se_GetPortalMapping()
		{
			MyTool.API myAPI = new MyTool.API("ndapn");

			string[] PortalMapping;
			string[] PortalName;
			PortalMapping = myAPI.GetPortalMapping().Split(',');
			PortalName = myAPI.GetPortalName().Split(',');
			for(int i=PortalMapping.GetLowerBound(0);i <= PortalMapping.GetUpperBound(0);i++)
			{
				if(PortalMapping[i]!="")
				{
					se.Items.Insert(0,new ListItem(PortalMapping[i],PortalName[i]));
				}
			}

		}
		//20081009??(clay)????
	}
}		
