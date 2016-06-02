using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
/// <summary>
/// Summary description for BundleConfig
/// </summary>
public class BundleConfig
{

    public static void RegisterBundles(BundleCollection bundles)
    {
        bundles.Add(new ScriptBundle("~/bundles/jquery").Include( "~/Scripts/jquery-2.2.3.js", "~/Scripts/bootstrap.js"));

        bundles.Add(new ScriptBundle("~/bundles/ExternalJs").Include("~/Scripts/metisMenu.min.js", "~/Scripts/raphael-min.js", 
        "~/Scripts/morris.min.js", "~/Scripts/morris-data.js", "~/Scripts/sb-admin-2.js"));

        bundles.Add(new ScriptBundle("~/bundles/css").Include("~/Content/bootstrap.css", "~/Content/sb-admin-2.css"));

        bundles.Add(new ScriptBundle("~/bundles/ExternalCss").Include("~/Content/metisMenu.min.css", "~/Content/timeline.css", 
        "~/Content/morris.css", "~/Content/font-awesome.min.css"));

        BundleTable.EnableOptimizations = false;
    }
}