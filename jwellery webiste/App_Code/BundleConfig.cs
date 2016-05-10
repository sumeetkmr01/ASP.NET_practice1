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
                    "~/Scripts/bootstrap.js","~/Scripts/bootstrap.min.js","~/Scripts/jquery-2.2.3.intellisense.js",
                    "~/Scripts/jquery-2.2.3.js","~/Scripts/jquery-2.2.3.min.js","~/Scripts/jquery-2.2.3.min.map"));

        //bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
        //            "~/Scripts/jquery-ui-{version}.js"));

    }
}