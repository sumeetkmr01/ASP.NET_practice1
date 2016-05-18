<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
          
         <%: Scripts.Render("~/bundles/jquery") %>
         <%: Styles.Render("~/bundles/css") %>
   
    <title>
    </title>
     <%--<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>--%>
    <script type="text/javascript">
        $(function () {
            $("[id*=btnSubmit]").bind("click", function () {
                var user = {};
                user.Username = $("[id*=txtEmail]").val();
                user.Password = $("[id*=txtPassword]").val();
                $.ajax({
                    type: "POST",
                    url: "login.aspx/ValidateUser",
                    data: '{user: ' + JSON.stringify(user) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                    }
                });
                return false;
            });
        });
</script>
</head>
<body>
    <div class="Container">
<%--<form id="form1" runat="server">--%>
    <div class="row">
       <div class="col-md-4 col-md-offset-4">
           <div class="login-panel panel panel-default">
               <div class="panel-heading">
                   <h3 class="panel-title" >Please Sign In</h3>
              </div>
                <div class="panel-body">
                   <form role="form">
                  <fieldset>
                   <div class="form-group">
                  <input class="form-control" placeholder="E-mail" name="Email"  id="txtEmail"  runat="server"/>
               </div>
                      <div class="form-group">
                          <input class="form-control" placeholder="Password" type="password" name="Password" id="txtPassword" runat="server"/>
                      </div>
                      <div class="checkbox">
                           <label>
                          <input type="checkbox" name="Remember"  value="Remembeer Me" />Remember Me
                     </label>
                                </div>
                       <button  id="btnSubmit" class ="btn btn-lg btn-success btn-block"  runat="server" >Submit</button>
                      
                       </fieldset>
              </form>
                </div>   
            
           </div>
       </div>
    </div>
    <%--</form>--%>
    </div>
    
</body>
</html>
