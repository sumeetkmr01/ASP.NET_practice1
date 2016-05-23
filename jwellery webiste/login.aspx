    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
          
         <%: Scripts.Render("~/bundles/jquery") %>
         <%: Styles.Render("~/bundles/css") %>
   
    <title>
    </title>
    <%-- <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>--%>
    <script type="text/javascript">
        
        //    function onlogin() {
              
        //        var user = {};
        //        user.Username = $("#txtEmail").val();
        //        user.Password = $("#txtPassword").val();
        //        var formData = new FormData();
        //        formData.append('IdentificationId', 0);
        //        alert("a");
        //        $.ajax({
        //            type: 'GET',
        //            url: "http://localhost:2468/proj/login.aspx/Authenticate",
        //            data: '',
        //            processData: false,
        //            contentType: "application/json; charset=utf-8",
        //            cash: false,
        //            success: function (result) {
        //                if (result.Error != undefined) {

        //                }
                      
        //            }
        //       });     
        //}
</script>
</head>
<body>
    <div class="Container">
    <div class="row">
       <div class="col-md-4 col-md-offset-4">
           <div class="login-panel panel panel-default">
               <div class="panel-heading">
                   <h3 class="panel-title" >Please Sign In</h3>
              </div>
                <div class="panel-body">
                    <form id="form1" runat="server" role="form">
                   
                  <fieldset>
                   <div class="form-group">
                  <%--<input class="form-control" placeholder="E-mail" name="Email" runat="server"  id="txtEmail" />--%>
                       <asp:TextBox runat="server"  id="txtEmail" placeholder="E-mail" name="Email" class="form-control"></asp:TextBox>
               </div>
                      <div class="form-group">
                          <%--<input class="form-control" placeholder="Password" type="password" name="Password" id="txtPassword"  runat="server"/>--%>
                          <asp:TextBox placeholder="Password" type="password" name="Password" id="txtPassword"  runat="server" class="form-control"></asp:TextBox>
                      </div>
                      <div class="checkbox">
                           <label>
                          <input type="checkbox" name="Remember"  value="Remembeer Me" />Remember Me
                     </label>
                                </div>
                    <button  id="btnSubmit" class ="btn btn-lg btn-success btn-block" onserverclick="btnSubmit_Click" runat="server" >Submit</button>
                  <%--<asp:Button ID ="v" OnClick="v_Click"--%>
                   
                       </fieldset>
              </form>
                </div>   
            
           </div>
       </div>
    </div>

    </div>
    
</body>
</html>
