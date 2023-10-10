<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-1-d-none {
            display: none !important;
        }

        .asplbl {
            color: #e4074e;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ============================ Login Start================================== -->
    <section class="gray">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7 col-md-10">
                    <div class="loving-modern-login">

                        <div class="text-center mb-4">
                            <img src="assets/img/logo-icon.png" class="img-fluid" alt="" />
                        </div>
                        <div class="row main_login_form">
                            <div class="login_form_dm">
                                <div id="edd_login_form" class="edd_form" method="post">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <fieldset>
                                                <p class="edd-login-username">
                                                    <label>User Name</label>
                                                    <asp:TextBox ID="txtusername" runat="server" class="form-control" type="text" placeholder="Username" OnTextChanged="txtusername_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                                    <asp:Label ID="lblusername" CssClass="asplbl" runat="server" Text="" Visible="false"></asp:Label>
                                                </p>
                                                <p class="edd-login-username">
                                                    <label>Your Email</label>
                                                    <asp:TextBox ID="txtemail" runat="server" class="form-control" type="text" placeholder="Your Email" OnTextChanged="txtemail_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                                    <asp:Label ID="lblemail" CssClass="asplbl" runat="server" Text="" Visible="false"></asp:Label>
                                                </p>
                                                <p class="edd-login-password">
                                                    <label>Password</label>
                                                    <asp:TextBox ID="txtpassword" runat="server" class="form-control" type="password" placeholder="Password" OnTextChanged="txtpassword_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                                    <asp:Label ID="lblpassword" CssClass="asplbl" runat="server" Text="" Visible="false"></asp:Label>
                                                </p>
                                                <p class="edd-login-password">
                                                    <label>Confirm Password</label>
                                                    <asp:TextBox ID="txtconfirmpassword" runat="server" class="form-control" type="password" placeholder="Confirm Password" OnTextChanged="txtconfirmpassword_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                                    <asp:Label ID="lblconfirmpassword" CssClass="asplbl" runat="server" Text="" Visible="false"></asp:Label>
                                                </p>
                                                <p class="already-login">
                                                    Have An Account <a href="login.aspx" class="theme-cl">Login Here</a>
                                                </p>
                                                <p class="edd-login-submit">
                                                    <asp:Label ID="lblbtn" Style="text-align: center" CssClass="asplbl" runat="server" Text=""></asp:Label>
                                                    <asp:LinkButton ID="BtnRegister" OnClick="BtnRegister_Click" runat="server" Text="submit" type="submit" class="btn btn-md btn-theme full-width" value="Login"></asp:LinkButton>
                                                </p>

                                            </fieldset>
                                            <div class="modal-divider"><span>Or login via</span></div>
                                            <div class="social-login mb-3">
                                                <ul>
                                                    <li><a href="#" class="btn fb"><i class="ti-facebook"></i></a></li>
                                                    <li><a href="#" class="btn google"><i class="ti-google"></i></a></li>
                                                    <li><a href="#" class="btn twitter"><i class="ti-twitter"></i></a></li>
                                                </ul>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="txtusername" EventName="TextChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="txtemail" EventName="TextChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="txtpassword" EventName="TextChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="txtconfirmpassword" EventName="TextChanged" />
                                            <asp:PostBackTrigger ControlID="BtnRegister" />
                                        </Triggers>
                                    </asp:UpdatePanel>
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

