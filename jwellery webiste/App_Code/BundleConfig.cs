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
        bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                    "~/Scripts/bootstrap.js",
                    "~/Scripts/jquery-2.2.3.js"));

        //bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
        //            "~/Scripts/jquery-ui-{version}.js"));
        //bundles.Add(new ScriptBundle("~/bundles/css").Include(
        //    "~/Content/bootstrap-theme.css", "~/Content/bootstrap-theme.css.map", "~/Content/bootstrap-theme.min.css", "~/Content/bootstrap-theme.min.css.map", "~/Content/bootstrap.css", "~/Content/bootstrap.css.map", "~/Content/bootstrap.min.css", "~/Content/bootstrap.min.css.map"));

        bundles.Add(new ScriptBundle("~/bundles/ExternalJs").Include("~/Scripts/metisMenu.min.js", "~/Scripts/raphael-min.js", "~/Scripts/jquery.min.js", "~/Scripts/morris.min.js", "~/Scripts/morris-data.js", "~/Scripts/sb-admin-2.js"));
        bundles.Add(new ScriptBundle("~/bundles/css").Include(
         "~/Content/bootstrap.css", "~/Content/sb-admin-2.css"));

        bundles.Add(new ScriptBundle("~/bundles/ExternalCss").Include("~/Content/metisMenu.min.css", "~/Content/timeline.css", "~/Content/morris.css", "~/Content/font-awesome.min.css"));

     

        BundleTable.EnableOptimizations = false;
    }
}