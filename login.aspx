<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-1-d-none {
            display: none !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ============================ Login Start================================== -->
    <section class="gray">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-10">
                    <div class="loving-modern-login">

                        <div class="text-center mb-4">
                            <img src="assets/img/logo-icon.png" class="img-fluid" alt="" />
                        </div>
                        <div class="row main_login_form">
                            <div class="login_form_dm">
                                <div id="edd_login_form" class="edd_form" method="post">
                                    <fieldset>
                                        <p class="edd-login-username">
                                            <label>User or Email</label>
                                            <asp:TextBox ID="txtusername" class="form-control" type="text" placeholder="Your Username or Email" runat="server" required></asp:TextBox>
                                        </p>
                                        <p class="edd-login-password">
                                            <label>Password</label>
                                            <asp:TextBox ID="txtpassword" class="form-control" type="password" placeholder="*******" runat="server" required></asp:TextBox>
                                        </p>
                                        <p class="edd-login-remember">
                                            <asp:CheckBox ID="remember" runat="server" class="checkbox-custom" name="remember" />
                                            <label for="remember" class="checkbox-custom-label">Remember Me</label>
                                        </p>
                                        <p class="edd-lost-password">
                                            <a href="forgot">Lost Password?</a>
                                        </p>
                                        <p class="edd-login-submit">
                                            <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:LinkButton ID="BtnLogIn" runat="server" OnClick="BtnLogIn_Click" Text="Login" class="btn btn-md btn-theme full-width">Login</asp:LinkButton>
                                        </p>
                                        <p class="already-login">
                                            Have't Account?  <a href="login.aspx" class="theme-cl"> Sign Up</a>
                                        </p>

                                        <div class="modal-divider"><span>Or login via</span></div>
                                        <div class="social-login mb-3">
                                            <ul>
                                                <li><a href="#" class="btn fb"><i class="ti-facebook"></i></a></li>
                                                <li><a href="#" class="btn google"><i class="ti-google"></i></a></li>
                                                <li><a href="#" class="btn twitter"><i class="ti-twitter"></i></a></li>
                                            </ul>
                                        </div>

                                    </fieldset>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ============================ Login End ================================== -->
</asp:Content>

