using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Common;
using System.Web;
using System;
using System.Web.SessionState;
using System.Drawing.Imaging;
using System.Drawing;
using System.Text.RegularExpressions;

using System.IO;
using System.Collections;
using System.ComponentModel;

namespace Ndapn.MyTool
{
	
	public class API
	{
		private string m_DBConnString = null; 
				
		public API(string DBName)
		{
			this.m_DBConnString = ConfigurationSettings.AppSettings["WebDBConn"];
		}

		public DataTable GetUserPD(string UserID)	
		{
			string strsql = "SELECT UserPW,PortalName,GroupName FROM Users Where UserSN = '" + UserID + "'";//«³¸Û(clay)§ï

			MyTool.DBCommon.strCn = this.m_DBConnString;
			return MyTool.DBCommon.ExecSqlDs(strsql).Tables[0];
		}

		public bool IsNum(string str) 
		{
			char[] temp = str.ToCharArray();

			for(int i=0;i<temp.Length;i++){ 
				if ( !char.IsDigit( temp[i] ) )
					return false;
			}

			return true;
		}

		public string Check_Is_Good_Str(string str)
		{
			string goodstr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_";
			string new_str = "" ;
			for (int i=0 ; i<str.Length ; i++){
				if (goodstr.IndexOf(str[i].ToString()) != -1){
					new_str += str[i].ToString();
				}				
			}
			return new_str ;
		}
		public bool SessionIsNull()
		{
			
			if(HttpContext.Current.Session["PartnerSN"]==null || HttpContext.Current.Session["PartnerChName"]==null)
				return true;
			else
				return false;
			
		}

        public string str_recombination(string old_str, char split_char, string join_char)
        {
            string str = "";
            if (old_str.IndexOf(split_char) > -1)
            {
                string[] temp_arr = old_str.Split(split_char);
                string[] new_arr = new string[temp_arr.GetUpperBound(0)];
                for (int i = 0; i <= temp_arr.GetUpperBound(0); i++){
                    if (!string.IsNullOrEmpty(temp_arr[i])){
                        new_arr[i] = temp_arr[i];
                    }
                }

                str = string.Join(join_char, new_arr);
            }
            return str;
        }
		public string GetPortalName()
		{
			string SelCmd = "Select DISTINCT GroupN.PortalMapping,Users.PortalName from Users,GroupN where GroupN.PortalName=Users.PortalName order by Users.PortalName DESC";
			SqlDataReader myDataReader = Create_Rd(SelCmd);
			string ReturnScript="";

			while(myDataReader.Read()){
				ReturnScript+=myDataReader["PortalName"].ToString()+",";
			}
			return ReturnScript;
		}
		public string GetPortalMapping()
		{
			string SelCmd = "Select DISTINCT GroupN.PortalMapping,Users.PortalName from Users,GroupN where GroupN.PortalName=Users.PortalName order by Users.PortalName DESC";
			SqlDataReader myDataReader = Create_Rd(SelCmd);
			string ReturnScript="";

			while(myDataReader.Read()){
				ReturnScript+=myDataReader["PortalMapping"].ToString()+",";
			}
			return ReturnScript;
		}

		public void Edit_Data(string SQLcmd)
		{	
			SqlConnection conn = new SqlConnection(m_DBConnString) ;

			conn.Open() ;
			SqlCommand cmd = new SqlCommand(SQLcmd, conn) ;
			cmd.ExecuteNonQuery() ;
			conn.Close() ;
		}
		  
		public string Check_Str(string str)
		{
			string new_str = "" ;
			for (int i=0 ; i<str.Length ; i++){
				if (str[i].ToString() == "'"){
					new_str +="''" ;
				}
				else{
					new_str += str[i].ToString () ;
				}
			}
			return new_str ;
		}
		  
		public SqlDataReader Create_Rd(string SQLcmd) 
		{
			SqlConnection myConnection = new SqlConnection(m_DBConnString);
			SqlCommand myCommand = new SqlCommand(SQLcmd, myConnection);
			myConnection.Open();
			SqlDataReader myReader=null;
			try{
				myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
			}
			catch (Exception ex){
				string GetSqlString = ex.ToString();
			}
			return myReader;			
			
		}
		  
		public DataTable Create_Table(string SQLcmd, string TabName) 
		{
			SqlConnection conn = new SqlConnection(m_DBConnString) ;
			conn.Open() ;
			DataSet myDataSet = new DataSet() ;
			SqlDataAdapter myAdapter ;
			myAdapter = new SqlDataAdapter(SQLcmd, conn) ;
			myAdapter.Fill(myDataSet, TabName) ;
			conn.Close() ;
			return myDataSet.Tables[TabName] ;
		}
		public string SqlExeSca(string strcmd)
		{
			SqlConnection conn = new SqlConnection(m_DBConnString);
			SqlCommand cmd = new SqlCommand(strcmd,conn);
			conn.Open();
			string s1 = cmd.ExecuteScalar().ToString();
			conn.Close();
			cmd = null;
			return s1;
		}
	}
}
