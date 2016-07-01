using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;

/// <summary>
/// Summary description for clsUsers
/// </summary>
public class clsUsers
{
    public string Username { get; set; }
    public string Password { get; set; }

	public clsUsers()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void Show(string message)
    {
        string cleanMessage = message.Replace("'", "\'");
        Page page = HttpContext.Current.CurrentHandler as Page;
        string script = string.Format("alert('{0}');", cleanMessage);
        if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
        {
            page.ClientScript.RegisterClientScriptBlock(page.GetType(), "alert", script, true /* addScriptTags */);
        }
    } 


}