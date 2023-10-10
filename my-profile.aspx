<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="my-profile.aspx.cs" Inherits="my_profile" %>


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
                            <%=uimage1 %>
                            <h4><%= Session["UserName"].ToString() %></h4>
                            <span><%=uaddress1 %></span>
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
                            <h4>My Account</h4>
                            <div class="submit-section">
                                <div class="form-row">

                                    <div class="form-group col-md-6">
                                        <label>Your Name</label>
                                        <asp:TextBox ID="uname" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Your Photo</label>
                                        <asp:FileUpload ID="uimage" runat="server" class="form-control" />
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Email</label>
                                        <asp:TextBox ID="uemail" runat="server" type="email" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Mobile</label>
                                        <asp:TextBox ID="umobile" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Address</label>
                                        <asp:TextBox ID="uaddress" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>City</label>
                                        <asp:TextBox ID="ucity" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Country</label>
                                        <asp:TextBox ID="ucountry" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Zip</label>
                                        <asp:TextBox ID="uzipcode" runat="server" type="text" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label>About</label>
                                        <asp:TextBox ID="uabout" runat="server" type="" class="form-control"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="form-submit">
                            <div class="submit-section">
                                <div class="form-row">
                                    <div class="form-group col-lg-12 col-md-12">
                                        <asp:LinkButton ID="btnSaveChanges" OnClick="btnSaveChanges_Click" runat="server" class="btn btn-theme">Save Changes</asp:LinkButton>
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



