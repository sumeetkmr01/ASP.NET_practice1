using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_frm_ProdCatg : System.Web.UI.Page
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrd();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtCatg.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Enter Category');", true);
            return;
        }
        string Catg = clsConnection.OneFieldWithCond("CATEGORY", "CATEGORY", "WHERE CATEGORY='" + txtCatg.Text.Trim().ToUpper() + "'");
        if (hfId.Value != "")
        {
            if (Catg == txtCatg.Text.Trim().ToUpper())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('This Category already Exists. Please Enter another Category');", true);
                return;
            }
        }
        if (txtDescription.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Enter Description');", true);
            return;
        }
       // Save();
       // ClearText(this.Controls);
        ClearInputs(Page.Controls);
        FillGrd();
        ClearHiddenField();
    }
    private void Save()
    {
        DataSet ds = new DataSet();
        ds = clsConnection.DsFill("CATEGORY");
        DataRow dr = ds.Tables[0].NewRow();
        dr["CATEGORY"] = txtCatg.Text.Trim().ToUpper();
        dr["DESCRIPTION"] = txtDescription.Text.Trim().ToUpper();
        if (hfCatid.Value != "")
        {
            dr["CATID"] = hfCatid.Value;
        }
        ds.Tables[0].Rows.Add(dr);
        clsConnection.Save(ds, "CATEGORY");
        hfCatid.Value = clsConnection.OneFieldWithCond("CATID", "CATEGORY", "WHERE CATEGORY='" + txtCatg.Text.Trim() + "'");
        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Your product is registered under this '" + hfCatid.Value + "');", true);
    }

    private void FillGrd()
    {
        DataTable dtFill = clsConnection.DtFill("CATEGORY");
        grd.DataSource = dtFill;
        grd.DataBind();
    }
    private void ClearText(ControlCollection  con)
    {
        try
        {
            #region 
     

            #endregion
            foreach (Control c in con)
            {
                if (c is TextBox)
                {
                    ((TextBox)c).Text = "";

                }
                //else
                //{
                //    if (cmbCust.SelectedIndex > 0)
                //    {
                //        cmbCust.SelectedIndex = 0;
                //    }
                //}
            }
        }
        catch (Exception)
        {
        }
    }
    void ClearInputs(ControlCollection ctrls)
    {
        foreach (Control ctrl in ctrls)
        {
            if (ctrl is TextBox)
                ((TextBox)ctrl).Text = string.Empty;
            ClearInputs(ctrl.Controls);
        }
    }
    protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string var = e.CommandName.ToString();
        int rowIndex = ((GridViewRow)((Button)e.CommandSource).NamingContainer).RowIndex;
        int index = Convert.ToInt32(grd.Rows[rowIndex].RowIndex);

        switch (var)
        {
            case "Edit":
                    hf1.Value = index.ToString();
                    hffield.Value = "Edit";
                break;
            case "Delete":
                    hf1.Value = index.ToString();
                    hffield.Value = "Delete";
                break;
        }
        ShowData();
    }

    private void ShowData()
    {
        switch (hffield.Value)
        {
            case"Edit":
                dt = new DataTable();
                dt = clsConnection.dtCondition("SELECT ID,CATEGORY,DESCRIPTION,CATID FROM CATEGORY WHERE CATEGORY='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[0].Text.Trim() + "' AND CATID='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[2].Text.Trim() + "'");
                txtCatg.Text = dt.Rows[0][1].ToString().Trim();
                txtDescription.Text = dt.Rows[0][2].ToString().Trim();
                hfId.Value = dt.Rows[0][0].ToString().Trim();
                hfCatid.Value = dt.Rows[0][3].ToString().Trim();
                break;
            case"Delete":
                clsConnection.ExcCom("DELETE FROM CATEGORY WHERE CATEGORY='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[0].Text.Trim() + "' AND CATID='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[2].Text.Trim() + "'");
                FillGrd();
                break;
        }
    }
    protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    private void ClearHiddenField()
    {
        hf1.Value = "";
        hfCatid.Value = "";
        hffield.Value = "";
        hfId.Value = "";
    }
}