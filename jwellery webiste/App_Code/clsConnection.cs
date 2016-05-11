using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for clsConnection
/// </summary>
public class clsConnection
{
 
   public static SqlConnection Connect()
   {
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
       try
       {
           con.Open();
       }
       catch
       {
           con.Close();
       }
       return con;

   }
	public clsConnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
}