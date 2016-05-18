using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand co = new SqlCommand();
        co.Connection = clsConnection.Connect();
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    private static string ValidateUser(clsUsers user)
    {
        int userId = 0;
       // string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        //using (SqlConnection con = new SqlConnection(clsConnection.Connect()))
        //{
            using (SqlCommand cmd = new SqlCommand("Validate_Admin"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", user.Username);
                cmd.Parameters.AddWithValue("@Password", user.Password);
                cmd.Connection = clsConnection.Connect();
                //con.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                //con.Close();
            }
        //}
        string IsValidate = string.Empty;
        switch (userId)
        {
            case -1:
                IsValidate = "Username and/or password is incorrect.";
                break;
            case -2:
                IsValidate = "Account has not been activated.";
                break;
            case -3:
                IsValidate = "Login Successfully.";
                break;
        }

        return IsValidate;
    }
    protected void btnSubmit_ServerClick(object sender, EventArgs e)
    {
       // ValidateUser(a);
    }
   
}