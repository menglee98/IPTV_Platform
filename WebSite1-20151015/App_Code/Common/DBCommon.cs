using System;
using System.Data;
using System.Data.SqlClient; 

namespace LibraryMOD.Common
{
	
	public class DBCommon
	{
		public static string processMessage = "";
        	public static string strCn = null;
		public DBCommon(){}

		public static string ExecSqlScalar(string strSql)
		{
			
			SqlConnection conn = new SqlConnection(strCn);
			SqlCommand	myCommand = new SqlCommand(strSql, conn);
			string result;
			try{
				conn.Open();
				result = myCommand.ExecuteScalar().ToString();
			}
			catch(Exception e){
				result = e.Message;
			}
			finally	{
				conn = null;
				myCommand	= null;
			}
			return result;
		}
		
		public static string ExecSqlNonQuery(string strSql)
		{
			SqlConnection conn = new SqlConnection(strCn);
			SqlCommand	myCommand = new SqlCommand(strSql, conn);
			string result;
			try{
				conn.Open();
				result = myCommand.ExecuteNonQuery().ToString();
				conn.Close();
			}
			catch(Exception e){
				result = e.Message;
			}
			finally{
				conn = null;
				myCommand	= null;
			}
			return result;
		}

		public static SqlDataReader ExecSqlRd(string strSql)
		{
			SqlConnection conn = new SqlConnection(strCn);
			SqlCommand	myCommand	= new SqlCommand(strSql, conn);
			SqlDataReader		rd;
			try{
				conn.Open();
				rd = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
			}
			catch(Exception e){
				processMessage = e.Message;
				return null;
			}
			return rd;
			
		}

		public static DataSet ExecSqlDs(string strSql)
		{
			SqlDataAdapter	Da	= new SqlDataAdapter(strSql,strCn);
			DataSet			Ds	= new DataSet();
			Da.Fill(Ds, "myTableName");
			return Ds;
		}
	}

	public class DBObj
	{
		public string processMessage = "";
		public string strCn = null;
		public DBObj(string strCn)
		{
			this.strCn = strCn ;
		}

		public string ExecSqlScalar(string strSql)
		{
			
			SqlConnection conn = new SqlConnection(strCn);
			SqlCommand	myCommand = new SqlCommand(strSql, conn);
			string result;
			try{
				conn.Open();
				result = myCommand.ExecuteScalar().ToString();
			}
			catch(Exception e){
				result = e.Message;
			}
			finally{
				conn = null;
				myCommand	= null;
			}
			return result;
		}
		
		public string ExecSqlNonQuery(string strSql)
		{
			SqlConnection conn = new SqlConnection(strCn);
			SqlCommand	myCommand = new SqlCommand(strSql, conn);
			string result;
			try{
				conn.Open();
				result = myCommand.ExecuteNonQuery().ToString();
			}
			catch(Exception e){
				result = e.Message;
			}
			finally{
				conn = null;
				myCommand	= null;
			}
			return result;
		}

		public SqlDataReader ExecSqlRd(string strSql)
		{
			SqlConnection conn = new SqlConnection(strCn);
			SqlCommand	myCommand	= new SqlCommand(strSql, conn);
			SqlDataReader		rd;
			try{
				conn.Open();
				rd = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
			}
			catch(Exception e){
				processMessage = e.Message;
				return null;
			}
			return rd;
			
		}

		public DataSet ExecSqlDs(string strSql)
		{
			SqlDataAdapter	Da	= new SqlDataAdapter(strSql,strCn);
			DataSet			Ds	= new DataSet();
			Da.Fill(Ds, "myTableName");
			return Ds;
		}
	}
}

