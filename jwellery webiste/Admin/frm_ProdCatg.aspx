<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_ProdCatg.aspx.cs" Inherits="Admin_frm_ProdCatg" EnableEventValidation="false"   %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    var pageIndex = 1;
    var pageCount;
    $(function () {
        //Remove the original GridView header
        $("[id$=grd] tr").eq(0).remove();
    });

    //Load GridView Rows when DIV is scrolled
    $("#dvgrd").on("scroll", function (e) {
        var $o = $(e.currentTarget);
        if ($o[0].scrollHeight - $o.scrollTop() <= $o.outerHeight()) {
            GetRecords();
        }
    });

    //Function to make AJAX call to the Web Method
    function GetRecords() {
        pageIndex++;
        if (pageIndex == 2 || pageIndex <= pageCount) {

            //Show Loader
            if ($("[id$=grd] .loader").length == 0) {
                var row = $("[id$=grd] tr").eq(0).clone(true);
                row.addClass("loader");
                row.children().remove();
                row.append('<td colspan = "999" style = "background-color:white"><img id="loader" alt="" src="103.gif" /></td>');
                $("[id$=grd]").append(row);
            }
            $.ajax({
                type: "POST",
                url: "frm_ProdCatg.aspx/GetCategory",
                data: '{pageIndex: ' + pageIndex + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        }
    }

    //Function to recieve XML response append rows to GridView
    function OnSuccess(response) {
        var xmlDoc = $.parseXML(response.d);
        var xml = $(xmlDoc);
        pageCount = parseInt(xml.find("PageCount").eq(0).find("PageCount").text());
        var customers = xml.find("Customers");
        $("[id$=grd] .loader").remove();
        customers.each(function () {
            var customer = $(this);
            var row = $("[id$=grd] tr").eq(0).clone(true);
            $(".Category", row).html(customer.find("Category").text());
            $(".Description", row).html(customer.find("Description").text());
            $(".CatID", row).html(customer.find("CatID").text());
            $("[id$=grd]").append(row);
        });

        //Hide Loader
        $("#loader").hide();
    }
</script>
    <style type="text/css">
    .Grid td
    {
        background-color: #A1DCF2;
        color: black;
        font-size: 10pt;
        font-family: Arial;
        line-height: 200%;
        cursor: pointer;
        width: 100px;
    }
    .Grid th
    {
        background-color: #3AC0F2;
        color: White;
        font-family: Arial;
        font-size: 10pt;
        line-height: 200%;
        width: 100px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="Wrapper">
        <div class="row" style="display:none">
            <div class="col-xl-6 col-md-offset-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" style="text-align: center">
                                            Product Category</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <%--   <form role="form">--%>
                                                    <div class="form-group">
                                                        <table>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtCatg" runat="server" placeholder="Enter Product Category" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtDescription" runat="server" placeholder="Enter Product Description" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <br />
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="text-align: center">
                                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-outline btn-success" Width="100px" />
                                                                </td>
                                                            </tr>

                                                        </table>


                                                    </div>
                                                    <%--  </form>--%>
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 .col-sm-12 .col-md-12">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
          <div class="col-md-12">
                                                    <%--   <form role="form">--%>
                                                    <div class="form-group">
                               <table class="Grid" cellspacing="0" rules="all" id="gr" style="width:600px;border-collapse:collapse" border="1">
                                   <tr>
                                       <th scope="col" style="width:116px;"></th>
                                       <th scope="col" style="width:200px;">Category</th>
                                       <th scope="col" style="width:200px;">Description</th>
                                       <th scope="col" style="width:200px;">Category ID</th>
                                   </tr>
                               </table>
                                                        <div id="dvgrd" runat="server" style="height: 250px; overflow: auto; width: 617px;text-align:center"  >
               <asp:GridView ID="grd"  runat="server" CssClass="Grid" CellPadding="4" ForeColor="#333333"  Width="600px" AutoGenerateColumns="False" OnRowEditing="grd_RowEditing" OnRowDeleting="grd_RowDeleting" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowUpdating="grd_RowUpdating" OnRowCancelingEdit="grd_RowCancelingEdit" >
                                                          <Columns>
                                                              <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-CssClass="Category" HeaderStyle-Width="200" ItemStyle-Width="200" ></asp:BoundField> 
                                                              <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-CssClass="Description"  HeaderStyle-Width="200" ItemStyle-Width="200"/>
                                                              <asp:BoundField DataField="CatID" HeaderText="Category ID" ReadOnly="true"  ItemStyle-CssClass="CatID" HeaderStyle-Width="200" ItemStyle-Width="200"/>  
                                                          </Columns>
                                                       </asp:GridView>
</div>
                                                    </div>
                                                    <%--  </form>--%>
                                                </div></div></div></div></div></div></div>
    </div>
</asp:Content>

