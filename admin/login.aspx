<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Login</title>
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo">
                  <img src="assets/Images/Logo/Places To Go Logo.jpg">
                </div>
                <h4>Hello! let's get started</h4>
                <h6 class="font-weight-light">Log in to continue.</h6>
                <div class="pt-3">
                  <div class="form-group">
                      <asp:TextBox ID="txtusername" runat="server" class="form-control form-control-lg" placeholder="Username"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <asp:TextBox ID="txtuserpassword" type="password" runat="server" class="form-control form-control-lg" placeholder="Password"></asp:TextBox>
                  </div>
                  <div class="mt-3">
                      <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Violet" Visible="false"></asp:Label>
                      <asp:Button ID="BtnSignin" OnClick="BtnSignin_Click" runat="server" Text="LOG IN" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    </form>
</body>
</html>
