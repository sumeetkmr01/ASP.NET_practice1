using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frm_ForgetPsd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Fill UserName');", true);
            return;
        }
        string UsernName = clsConnection.OneFieldWithCond("UserName", "Login", "Where UserName='" + txtUserName.Text.Trim() + "' AND UPDATECOLUMN IS NULL");
        if (UsernName == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('This UserName Does Not Exist');", true);
            return;
        }
        if (txtOldPsd.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Fill Old Password');", true);
            return;
        }

        string Psd = clsConnection.OneField("PASSWORD","LOGIN");
        DataTable dtPsd = clsConnection.dtCondition("SELECT PASSWORD FROM LOGIN WHERE USERNAME='" + txtUserName.Text.Trim() + "'AND UPDATECOLUMN IS NULL");
        if (txtOldPsd.Text.Trim() != dtPsd.Rows[0][0].ToString().Trim())
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Fill Correct Old Password');", true);
            return;
        }
        if (txtNewPsd.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Fill Password');", true);
            return;
        }
       
        if (txtConfirmPsd.Text!=txtNewPsd.Text)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Password do not match');", true);
            return;
        }
        Save();
    }

    public void Save()
    {
        DataTable dtCheck = clsConnection.dtCondition("SELECT DISTINCT USERNAME,ID FROM LOGIN WHERE USERNAME ='" + txtUserName.Text.Trim() + "'");
        if (dtCheck.Rows.Count > 0)
        {
            clsConnection.ExcCom("UPDATE LOGIN SET UPDATECOLUMN='0' WHERE USERNAME='" + txtUserName.Text.Trim() + "' AND ID='" + dtCheck.Rows[0][1].ToString().Trim() + "'AND UPDATECOLUMN IS NULL");
        }
        DataSet ds = new DataSet();
        ds = clsConnection.DsFill("LOGIN");
        DataRow dr = ds.Tables[0].NewRow();
        string Name = clsConnection.OneFieldWithCond("Name", "Login", "Where UserName='" + txtUserName.Text.Trim() + "'AND UPDATECOLUMN IS NULL");
        dr["Name"] = Name;
        dr["USERNAME"] = txtUserName.Text.Trim();
        dr["PASSWORD"] = txtNewPsd.Text.Trim();
        ds.Tables[0].Rows.Add(dr);
        clsConnection.Save(ds, "LOGIN");
        clsConnection.ExcCom("DELETE FROM LOGIN WHERE USERNAME='" + txtUserName.Text.Trim() + "' AND ID='" + dtCheck.Rows[0][1].ToString().Trim() + "' AND UPDATECOLUMN ='0'");
       // ClearText(this);
    }
}