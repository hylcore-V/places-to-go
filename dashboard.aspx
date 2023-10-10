<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

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
                    <div class="Reveal-dashboard-wrapers">

                        <!-- Row -->
                        <div class="row">
                            <div class="col-lg-12 col-md-6 col-sm-12">
                                <div class="Reveal-dashboard-widget">
                                    <div class="Reveal-dashboard-widget-icon widget-1"><i class="ti-user"></i></div>
                                    <div class="Reveal-dashboard-widget-content">
                                        <h4>

                                            <asp:Label ID="lblapprove" runat="server" Text="Label"></asp:Label>
                                        </h4>
                                        <p>Total Approved Blogs</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-6 col-sm-12">
                                <div class="Reveal-dashboard-widget">
                                    <div class="Reveal-dashboard-widget-icon widget-2"><i class="ti-bookmark"></i></div>
                                    <div class="Reveal-dashboard-widget-content">
                                        <h4>
                                            <asp:Label ID="lblpending" runat="server" Text="Label"></asp:Label>
                                        </h4>
                                        <p>Total Pending Blogs</p>
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

