<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="change-password.aspx.cs" Inherits="change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-1-d-none {
            display: none !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- ============================ Page Title Start================================== -->
    <div class="image-cover page-title" style="background: url(assets/img/banner-3.jpg) no-repeat;" data-overlay="6">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">

                    <h2 class="ipt-title">Hello, <%= Session["UserName"].ToString() %></h2>
                    <span class="ipn-subtitle text-light">Edit & View Your Profile</span>

                </div>
            </div>
        </div>
    </div>
    <!-- ============================ Page Title End ================================== -->

    <!-- ============================ Dashboard Start ================================== -->
    <section class="gray">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-3 col-md-4 col-sm-12">
                    <div class="Reveal-dashboard-navbar">

                        <div class="Reveal-d-user-avater">
                            <%=uimage %>
                            <h4><%= Session["UserName"].ToString() %></h4>
                            <span><%=uaddress %></span>
                        </div>

                        <div class="Reveal-dash-navigation">
                            <ul>
                                <li class="active"><a href="dashboard.aspx"><i class="ti-dashboard"></i>Dashboard</a></li>
                                <li><a href="my-profile.aspx"><i class="ti-user"></i>My Profile</a></li>
                                <li><a href="my-blogs.aspx"><i class="ti-layers"></i>My Blogs</a></li>
                                <li><a href="add-blogs.aspx"><i class="ti-plus"></i>Add Blogs</a></li>
                                <li><a href="change-password.aspx"><i class="ti-unlock"></i>Change Password</a></li>
                                <li>
                                    <asp:LinkButton ID="LinkButton1" OnClick="BtnLogOut_Click" runat="server"><i class="ti-power-off"></i>Log Out</asp:LinkButton>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>

                <div class="col-lg-9 col-md-8 col-sm-12">
                    <div class="dashboard-wraper">

                        <!-- Basic Information -->
                        <div class="form-submit">
                            <h4>Change Your Password</h4>
                            <div class="submit-section">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>New Password</label>
                                        <asp:TextBox ID="txtpassword" runat="server" class="form-control" type="password" OnTextChanged="txtpassword_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                        <asp:Label ID="lblpassword" CssClass="asplbl" runat="server" Text="" Visible="false"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label>Confirm password</label>
                                    <asp:TextBox ID="txtconfirmpassword" runat="server" class="form-control" type="password" OnTextChanged="txtconfirmpassword_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                    <asp:Label ID="lblconfirmpassword" CssClass="asplbl" runat="server" Text="" Visible="false"></asp:Label>
                                </div>
                            </div>
                            <asp:Label ID="lblbtn" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                            <div class="form-group col-lg-12 col-md-12">
                                <asp:LinkButton ID="BtnRegister" OnClick="BtnRegister_Click" runat="server" Text="submit" type="submit" class="btn btn-theme" value="Login">Save Changes</asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        </div>
        </div>
    </section>
    <!-- ============================ Dashboard End ================================== -->
</asp:Content>

