<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="my-blogs.aspx.cs" Inherits="my_blogs" %>


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

                        <div class="Reveal-gravity-list">

                            <h4>Approved Blogs List</h4>
                            <ul>
                                <asp:ListView ID="lv_blogs" runat="server">
                                    <ItemTemplate>
                                        <li class="Reveal-pending-booking">
                                            <div class="Reveal-list-box-listing bookings">
                                                <div class="Reveal-Reveal-list-box-listing-img">
                                                    <img src="assets/Images/PlcaeImages/<%#Eval("placeImage1") %>" class="img-fluid"/>
                                                </div>
                                                <div class="Reveal-Reveal-box-listing-content">

                                                    <div class="inner">
                                                        <h3><%#Eval("blogTitle") %></h3>

                                                        <div class="Reveal-inner-booking-list">
                                                            <h5>Blog Date:</h5>
                                                            <ul class="booking-list">
                                                                <li class="highlighted"><%#Eval("rts") %></li>
                                                            </ul>
                                                        </div>
                                                        <div class="Reveal-inner-booking-list">
                                                            <h5>Blog Status:</h5>
                                                            <ul class="booking-list">
                                                                <li class="highlighted" id="Approved" runat="server" visible='<%# Eval("status").ToString() == "1" ? true : false %>'>
                                                                    <span class="booking-status">Approved</span>
                                                                </li>
                                                                <li class="highlighted" id="Pending" runat="server" visible='<%# Eval("status").ToString() == "0" ? true : false %>'>
                                                                    <span class="booking-status unpaid">Pending</span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <asp:LinkButton ID="btnDeleteBlog" OnClick="btnDeleteBlog_Click" runat="server" class="rate-review"><i class="ti-close"></i>Delete Blog</asp:LinkButton>
                                                    </div>

                                                </div>
                                            </div>

                                        </li>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ============================ Dashboard End ================================== -->
</asp:Content>

