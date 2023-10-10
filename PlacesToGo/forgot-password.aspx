<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="forgot-password.aspx.cs" Inherits="login" %>

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
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <p class="edd-login-username">
                                                    <label>Username or Email</label>
                                                    <asp:TextBox ID="txtusername" class="form-control" type="text" runat="server" required></asp:TextBox>
                                                </p>
                                                <p class="edd-login-password">
                                                    <label>OTP</label>
                                                    <asp:TextBox ID="txtotp" class="form-control" runat="server" required></asp:TextBox>
                                                </p>
                                                <p class="edd-login-submit">
                                                    <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                                                    <asp:LinkButton ID="BtnSubmit" OnClick="BtnSubmit_Click" runat="server" type="submit" class="text-white btn btn-md btn-theme full-width" Text="Submit"></asp:LinkButton>
                                                </p>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
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

