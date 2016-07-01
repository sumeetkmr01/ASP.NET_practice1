using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_frm_ProdCatg : System.Web.UI.Page
{
    DataTable dt;
    string CatID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrd();
        }
    }


    public void alertmsg(string msg)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('"+msg+"');", true);
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtCatg.Text == "")
        {
            clsUsers.Show("Please Enter");
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('');", true);
            return;
        }
        //string Catg = clsConnection.OneFieldWithCond("CATEGORY", "CATEGORY", "WHERE CATEGORY='" + txtCatg.Text.Trim() + "' AND ID!='" + hfId.Value + "'");
        ////if (hfId.Value != "")
        ////{
        //    if (Catg == txtCatg.Text.Trim())
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('This Category already Exists. Please Enter another Category');", true);
        //        return;
        //    }
        //}
        if (txtDescription.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Enter Description');", true);
            return;
        }
        Save();
        clsConnection.ClearInputs(Page.Controls);
        FillGrd();
    }

    private void Save()
    {
        DataSet ds = new DataSet();
        ds = clsConnection.DsFill("CATEGORY");
        DataRow dr = ds.Tables[0].NewRow();
        dr["CATEGORY"] = txtCatg.Text.Trim().ToUpper();
        dr["DESCRIPTION"] = txtDescription.Text.Trim().ToUpper();
     //   dr["ISDEL"] = 0;
        ds.Tables[0].Rows.Add(dr);
        clsConnection.Save(ds, "CATEGORY");
        CatID = clsConnection.OneFieldWithCond("CATID", "CATEGORY", "WHERE CATEGORY='" + txtCatg.Text.Trim() + "'");
        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Your product is registered under this '" + CatID + "');", true);
       
    }

    private void FillGrd()
    {
        DataTable dtFill = clsConnection.DtFill("CATEGORY WHERE ISDEL=0 OR ISDEL IS NULL ORDER BY CATID");
        grd.DataSource = dtFill;
        grd.DataBind();
    }

    protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlCommand cmd = new SqlCommand("UPDATE CATEGORY SET ISDEL=1 WHERE CATID='" + grd.Rows[e.RowIndex].Cells[3].Text.Trim() + "'", clsConnection.Connect());
        cmd.ExecuteNonQuery();
        FillGrd();
    }

    protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grd.EditIndex = e.NewEditIndex;
        FillGrd();
    }

    protected void grd_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string a = grd.Rows[e.RowIndex].Cells[1].Text.Trim();
        string dd = grd.Rows[e.RowIndex].Cells[1].Text.Trim();
        TextBox b = (TextBox)grd.Rows[e.RowIndex].Cells[2].Controls[0];
        string s = b.Text;
        TextBox c = (TextBox)grd.Rows[e.RowIndex].Cells[1].Controls[0];
        string sssss = c.Text;
        string DDDDDDDDDDDDDDDDDDDDDDDDD = System.DateTime.Now.ToShortDateString();
      SqlCommand cmd = new SqlCommand("UPDATE CATEGORY SET CATEGORY=@cat,DESCRIPTION=@desc,ISDEL=@del,MDATE=@md WHERE CATID=@catid", clsConnection.Connect());
       //SqlCommand cmd = new SqlCommand("UPDATE CATEGORY SET CATEGORY=@cat,DESCRIPTION=@desc,ISDEL=@del WHERE CATID=@catid", clsConnection.Connect());
       cmd.Parameters.AddWithValue("@cat", ((TextBox)(grd.Rows[e.RowIndex].Cells[1].Controls[0])).Text.Trim());
       cmd.Parameters.AddWithValue("@desc", ((TextBox)(grd.Rows[e.RowIndex].Cells[2].Controls[0])).Text.Trim());
       cmd.Parameters.AddWithValue("@del",1);
       cmd.Parameters.AddWithValue("@md", System.DateTime.Now.Date);
       cmd.Parameters.AddWithValue("@catid", grd.Rows[e.RowIndex].Cells[3].Text.Trim());
       cmd.ExecuteNonQuery();
       grd.EditIndex = -1;
       grd.DataSource = clsConnection.DtFill("CATEGORY ORDER BY CATID");
       grd.DataBind();
    }

    protected void grd_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grd.EditIndex = -1;
        FillGrd();
    }
}