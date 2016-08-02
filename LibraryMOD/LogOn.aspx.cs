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
	/// <summary>
	/// LogOn 的摘要描述。
	/// </summary>
	public partial class LogOn : System.Web.UI.Page
	{
	
		public string permission;
		

		protected void Page_Load(object sender, System.EventArgs e)
		{
                	se_GetPortalMapping();
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
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
				string userGroup=se.SelectedItem.Value;
				Session["userGroup"]=userGroup;
	
				//myAPI myAPI = new myAPI("Smart-iTV_V2_5");
                myAPI myAPI = new myAPI("ndapn");
				
                if ( userUserID != null)
				{
		         	DataTable dt0 = myAPI.GetUserPD(userUserID);
					if(dt0.Rows.Count==0)
					{
						ShowMsg("無此帳號");
						se.Items.Clear();
						se_GetPortalMapping();
						return;
					}
					if (userPwd == dt0.Rows[0].ItemArray.GetValue(0).ToString() )
					{
		
						if ( dt0.Rows[0].ItemArray.GetValue(1).ToString() == userGroup)
						{
						       Response.Cookies["UserID"].Value = userUserID;
						       Session["DBName"] = dt0.Rows[0].ItemArray.GetValue(2).ToString();
						       Session["User_Name_"]=userUserID;
						       Session["User_IP_"]=Request.ServerVariables["REMOTE_ADDR"];

						       myAPI API2 = new myAPI(Session["DBName"].ToString());
							   
						       Response.Redirect ("default.aspx");
						}
						else
						{
							ShowMsg("權限錯誤");
							se.Items.Clear();
							se_GetPortalMapping();
						}
						
					}
					else
					{
						ShowMsg("密碼錯誤，請重新輸入");
						se.Items.Clear();
						se_GetPortalMapping();
					}
				}
				else	 
				{
					ShowMsg("帳號錯誤，請重新輸入");
					se.Items.Clear();
					se_GetPortalMapping();
				}
			}
			
		}

		private void ShowMsg(string msgStr)
		{
			lblMsg.Text=msgStr;
		}
		
		private void se_GetPortalMapping()
		{
			//myAPI myAPI = new myAPI("Smart-iTV_V2_5");
            myAPI myAPI = new myAPI("ndapn");

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
		
		protected void se_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}
	}
}