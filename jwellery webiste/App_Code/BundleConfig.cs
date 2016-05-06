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
                    "~/Scripts/bootstrap.js"));

        //bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
        //            "~/Scripts/jquery-ui-{version}.js"));

    }
}