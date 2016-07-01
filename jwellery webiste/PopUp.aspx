﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PopUp.aspx.cs" Inherits="PopUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $("[id*=btnModalPopup]").live("click", function () {
        $("#modal_dialog").dialog({
            open: function () {
                $(this).load('frm_ProdCatgNew.aspx');
            },
            height: 490,
            width: 900,
            //  title: "jQuery Modal Dialog Popup",
            //buttons: {

            //    Close: function () {
            //        $(this).dialog('close');
            //    }
            //},
            modal: true
        });
        return false;
    });
</script>
   <%--<script type="text/javascript">
       $(function () {
           $("#btnModalPopup").live("click", function () {
               window.open('frm_ProdCatgNew.aspx');
               modal: true
           });
       });
</script> --%>
<div id="dialog">
</div>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
<div id="modal_dialog" >

    <%--This is a Modal Background popup--%>
</div>
<asp:Button ID="btnModalPopup" runat="server" Text="Show Modal Popup" />
    </form>
</body>
</html>
