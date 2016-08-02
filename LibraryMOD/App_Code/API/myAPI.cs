using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.SessionState;
using System.Drawing.Imaging;
using System.Drawing;
using System.Text.RegularExpressions;

namespace LibraryMOD.API
{
	public class myAPI
	{
		private string CnStr ;
		private Common.DBObj dbc;
		public myAPI(string DBName)
		{
			this.CnStr = System.Configuration.ConfigurationSettings.AppSettings["WebDBConn"]; 
			dbc = new LibraryMOD.Common.DBObj(CnStr);
		}

		public DataTable GetUserPD(string UserID)
		{
			string strsql = "SELECT UserPW,PortalName,GroupName FROM Users Where UserSN = '" + UserID + "'";//奕誠(clay)改

			return dbc.ExecSqlDs(strsql).Tables[0];
		}

		public bool Check_User(string user_id)
		{
			SqlDataReader myDataReader = Create_Rd("Select * from UserID where UserSN = '" + user_id + "'");
			if(myDataReader.Read())	{
				myDataReader.Close();
				return true;
			}
			else
				return false;
		}

		public void Update_View_Content_Log(string user_id, string content_id, string user_ip, string session_id)		//DEVIN 070424 add View_SessionID
		{
			DateTime dt = DateTime.Now;
			string start_time = dt.ToString("yyyy-MM-dd HH:mm:ss");
			Edit_Data("Insert into View_Content_Log(View_UserID,View_ContentID,View_StartTime,View_UserIP,View_SessionID)values('" + user_id + "'," + content_id + ",'" + start_time + "','" + user_ip + "','" + session_id + "')");
		}

		public int SetSTB()
		{	
			
			if(HttpContext.Current.Request.UserAgent.IndexOf("MSIE")!=-1)
				return 1;
			else
				return 2;		
		}

		//新增、刪除、修改資料的函式
		public void Edit_Data(string SQLcmd)
		{	
			dbc.ExecSqlNonQuery(SQLcmd);
		}
		public SqlDataReader Create_Rd(string SQLcmd) 
		{
			SqlDataReader rd = dbc.ExecSqlRd(SQLcmd);
			return rd;
		}
	
		public string GetPortalName()
		{
			string SelCmd = "Select DISTINCT GroupN.PortalMapping,Users.PortalName from Users,GroupN where GroupN.PortalName=Users.PortalName order by Users.PortalName DESC";
			SqlDataReader myDataReader = Create_Rd(SelCmd);
			string ReturnScript="";

			while(myDataReader.Read())
			ReturnScript+=myDataReader["PortalName"].ToString()+",";
			
                        return ReturnScript;
                         //return "P100000";
		}

		public string GetPortalMapping()
		{
			string SelCmd = "Select DISTINCT GroupN.PortalMapping,Users.PortalName from Users,GroupN where GroupN.PortalName=Users.PortalName order by Users.PortalName DESC";
			SqlDataReader myDataReader = Create_Rd(SelCmd);
			string ReturnScript="";

			while(myDataReader.Read())
				ReturnScript+=myDataReader["PortalMapping"].ToString()+",";
			
			return ReturnScript;
                        //return "Manager";
		}


        public string str_recombination(string old_str, char split_char, string join_char)
        {
            string str = "";
            if (old_str.IndexOf(split_char) > -1)
            {
                string[] temp_arr = old_str.Split(split_char);
                string[] new_arr = new string[temp_arr.GetUpperBound(0)];
                for (int i = 0; i <= temp_arr.GetUpperBound(0); i++){
                    if (!string.IsNullOrEmpty(temp_arr[i]))
                        new_arr[i] = temp_arr[i];
                }

                str = string.Join(join_char, new_arr);
            }
            return str;
        }


	public string GetMenuScript(string ParentID,string Portal)
	{
            string uid_str = "";
            string sql1 = "select * from GroupN";
            SqlDataReader myDataReader1 = Create_Rd(sql1);
            while (myDataReader1.Read())
                uid_str += "'" + myDataReader1["UID"].ToString() + "',";
            
            myDataReader1.Close();

            uid_str = str_recombination(uid_str, ',', ",");
            string UserID_ = "1234";
	    string ReturnScript, SelCmd, NowDate;
	    NowDate = DateTime.Today.ToShortDateString();
	    ReturnScript = "<script>\n var arrMenu = new Array() ;\n";
            
            if (Portal == "P100000" && ParentID == "1")	{
	       SelCmd = 
			"declare @myarea int "+	"set @myarea = 1 "+
			"IF (@myarea=1) "+"BEGIN "+
			"SELECT Cate_UID, Cate_Name, Cate_ImgUrl, Cate_ShowMode "+
			"FROM CategoryTemplate "+"Where "+
			"(Cate_ShowArea= 1 OR Cate_ShowArea= 3 OR Cate_ShowArea= 0) "+
                        "AND Cate_ParentUID IN (" + uid_str + ")" +
			"AND ('" + NowDate + "' BETWEEN Cate_StartDate AND Cate_EndDate) "+ 
			"AND Cate_ShowMode != 6 ORDER BY Cate_SortNum , Cate_UID DESC "+
			"END "+	"ELSE IF (@myarea=2) "+
			"BEGIN "+
			"SELECT Cate_UID, Cate_Name, Cate_ImgUrl, Cate_ShowMode "+
			"FROM CategoryTemplate "+
			"Where "+
			"(Cate_ShowArea= 2 OR Cate_ShowArea= 0) "+
			"AND Cate_ParentUID = "+ParentID+" "+
			"AND ('" + NowDate + "' BETWEEN Cate_StartDate AND Cate_EndDate) "+
			"AND Cate_ShowMode != 6 ORDER BY Cate_SortNum , Cate_UID DESC "+
			"END";
	    }
            else if (Portal == "P100000"){
                SelCmd =
                    "declare @myarea int " +
                    "set @myarea = 1 " +
                    "IF (@myarea=1) " +
                    "BEGIN " +
                    "SELECT Cate_UID, Cate_Name, Cate_ImgUrl, Cate_ShowMode " +
                    "FROM CategoryTemplate " +
                    "Where " +
                    "(Cate_ShowArea= 1 OR Cate_ShowArea= 3 OR Cate_ShowArea= 0) " +
                    "AND Cate_ParentUID = " + ParentID + " " +
                    "AND ('" + NowDate + "' BETWEEN Cate_StartDate AND Cate_EndDate) " +
                    "AND Cate_ShowMode != 6 ORDER BY Cate_SortNum , Cate_UID DESC " +
                    "END " +
                    "ELSE IF (@myarea=2) " +
                    "BEGIN " +
                    "SELECT Cate_UID, Cate_Name, Cate_ImgUrl, Cate_ShowMode " +
                    "FROM CategoryTemplate " +
                    "Where " +
                    "(Cate_ShowArea= 2 OR Cate_ShowArea= 0) " +
                    "AND Cate_ParentUID = " + ParentID + " " +
                    "AND ('" + NowDate + "' BETWEEN Cate_StartDate AND Cate_EndDate) " +
                    "AND Cate_ShowMode != 6 ORDER BY Cate_SortNum , Cate_UID DESC " +
                    "END";
            }
	    else { 
	       SelCmd = 
		    "declare @myarea int "+
		    "set @myarea = 1 "+
		    "IF (@myarea=1) "+
		    "BEGIN "+
		    "SELECT Cate_UID, Cate_Name, Cate_ImgUrl, Cate_ShowMode "+
		    "FROM CategoryTemplate "+
		    "Where "+
		    "(Cate_ShowArea= 1 OR Cate_ShowArea= 3 OR Cate_ShowArea= 0) "+
		    "AND Cate_ParentUID = "+ParentID+" "+
		    "AND ('" + NowDate + "' BETWEEN Cate_StartDate AND Cate_EndDate) "+
                    "AND Cate_ShowMode != 6  and  PortalName = '" + Portal + "' and UserSN='" + UserID_ + "' ORDER BY Cate_SortNum , Cate_UID DESC " +
		    "END "+
		    "ELSE IF (@myarea=2) "+
		    "BEGIN "+
		    "SELECT Cate_UID, Cate_Name, Cate_ImgUrl, Cate_ShowMode "+
		    "FROM CategoryTemplate "+
		    "Where "+
		    "(Cate_ShowArea= 2 OR Cate_ShowArea= 0) "+
		    "AND Cate_ParentUID = "+ParentID+" "+
		    "AND ('" + NowDate + "' BETWEEN Cate_StartDate AND Cate_EndDate) "+
                    "AND Cate_ShowMode != 6 and  PortalName = '" + Portal + "' and UserSN='" + UserID_ + "' ORDER BY Cate_SortNum , Cate_UID DESC " +
		    "END";
	 }

	SqlDataReader myDataReader = Create_Rd(SelCmd);
	while(myDataReader.Read()){
		ReturnScript += "myObj = new Object() ;\n myObj.UID = " +  myDataReader["Cate_UID"].ToString() + ";\n myObj.Title = '" +  myDataReader["Cate_Name"].ToString() +"';\n ";
                ReturnScript += "myObj.ImgUrl = '" +  myDataReader["Cate_ImgUrl"].ToString() + "';\n myObj.ShowMode = " +  myDataReader["Cate_ShowMode"].ToString() +";\n";
		ReturnScript += "arrMenu.push(myObj);";
	}
			
                        
         ReturnScript += "\n</script>\n";
        //HttpContext.Current.Response.Write("SelCmd="+SelCmd);
	return ReturnScript;
     }

	public string GetContentScript(string ParentID)
	{
		string ReturnScript, SelCmd, NowDate;
		NowDate = DateTime.Today.ToShortDateString();
		ReturnScript = "<script>\n var arrMenu = new Array() ;\n";

		SelCmd = "SELECT * FROM MediaListTemplate Where ML_PID = " + ParentID;
		SelCmd += " AND ('" + NowDate + "' BETWEEN ML_StartDate AND ML_EndDate) ORDER BY ML_UID DESC ";
		SqlDataReader myDataReader = Create_Rd(SelCmd);
			
		while(myDataReader.Read()){
			ReturnScript += "myObj = new Object() ;\n myObj.UID = " +  myDataReader["ML_UID"].ToString() + ";\n myObj.Title = '" +  myDataReader["ML_Title"].ToString() +"';\n ";
                        ReturnScript += "myObj.ImgUrl = '" + myDataReader["ML_Note1"].ToString() + "';\n myObj.Content = '" + myDataReader["ML_Content"].ToString().Replace("\r\n", "") + "';\n";
			ReturnScript += "myObj.SDate = '" +  myDataReader["ML_StartDate"].ToString().Replace("\r\n","<br>").Substring(0,10) + "';\n myObj.EDate = '" +  myDataReader["ML_EndDate"].ToString().Substring(0,10) +"';\n";
			ReturnScript += "myObj.OrderYN = '" +  myDataReader["ML_OrderYN"].ToString().Replace("\r\n","<br>") + "';\n";
			ReturnScript += "myObj.Description = '" +  myDataReader["ML_Description"].ToString().Replace("\r\n","<br>") + "';\n myObj.Times = '" +  myDataReader["ML_Note2"].ToString() +"';\n";
			ReturnScript += "myObj.MediaStart = '" +  myDataReader["ML_MediaStart"].ToString() +"';\n myObj.MediaEnd = '" +  myDataReader["ML_MediaEnd"].ToString() +"';\n";
			ReturnScript += "arrMenu.push(myObj);";
		}
			
		ReturnScript += "\n</script>\n";
		return ReturnScript;
		
	}
        
       		
		
	public DataTable Getuid(string Portal)
	{
            string strsql;
	    strsql="select *  from GroupN where PortalName ='" + Portal +"'";
	
            return dbc.ExecSqlDs(strsql).Tables[0];
        }
       

        public string Margin(string type)
        {
            string SelCmd = "";
            string ReturnScript = "";
            SelCmd = "SELECT * FROM template Where type = '" + type + "'";
            SqlDataReader myDataReader = Create_Rd(SelCmd);
            if (myDataReader.Read())
                ReturnScript = myDataReader["margin"].ToString();
            myDataReader.Close();
            return ReturnScript;
        }

    }
	
}
