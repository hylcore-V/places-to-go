<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Monitor.aspx.cs" Inherits="admin_Monitor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Pending Blogs</h4>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Blog<br />Id</th>
                            <th>Author<br />Id</th>
                            <th>Show </th>
                            <th>Approve</th>
                            <th>Reject</th>
                            <th>Auto-Approve</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:HiddenField ID="hdnvalue" runat="server" />
                        <asp:ListView ID="lv_show" runat="server" OnItemCommand="lv_show_ItemCommand" OnItemDeleting="lv_show_ItemDeleting" OnItemEditing="lv_show_ItemEditing">
                            <ItemTemplate>
                                <tr>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>

                                    <td><%#Eval("id") %></td>
                                    <td><%#Eval("blogAuthorId") %></td>
                                    <td class="">
                                        <asp:LinkButton ID="btnShow" runat="server" CommandName="Show" OnClick="btnShow_Click" Text="Show" class="btn btn-sm btn-outline-primary btn-icon-text">Show <i class="mdi mdi-file-check btn-icon-prepend"></i>
                                        </asp:LinkButton>
                                    </td>
                                    <td class="">
                                        <span id="SpanAccept" runat="server" visible='<%# Eval("status").ToString() == "0" ? true : false %>'>
                                            <asp:LinkButton ID="btnAccept" runat="server" CommandName="Active" OnClick="btnAccept_Click" Text="Approve" class="btn btn-sm btn-outline-danger btn-icon-text">Approve <i class="mdi mdi-checkbox-marked-circle"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </td>
                                    <td class="">
                                        <asp:LinkButton ID="btnReject" runat="server" CommandName="Delete" OnClick="btnReject_Click" Text="Reject" class="btn btn-sm btn-outline-warning btn-icon-text">Reject <i class="mdi mdi-close-circle"></i>
                                        </asp:LinkButton>
                                    </td>
                                    <td class="form-check form-check-primary">
                                        <label class="form-check-label">
                                            <asp:CheckBox ID="chk_autoapprove" runat="server" Text="" />
                                            Auto Approve<i class="input-helper"></i>
                                        </label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body" style="overflow: scroll;">
                <h4 class="card-title">Blog :-</h4>
                <table class="table">

                    <tbody>
                        <asp:ListView ID="lv_monitor" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <th>Blog Image</th>
                                    <td>
                                        <img src="assets/Images/BlogImages/<%#Eval("blogImage") %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>Author<br />Id</th>
                                    <td><%#Eval("blogAuthorId") %></td>
                                </tr>
                                <tr>
                                    <th>Blog Title</th>
                                    <td><%#Eval("blogTitle") %></td>
                                </tr>

                                <tr>
                                    <th style="vertical-align: top;">Blog Description</th>
                                    <td style="width: 50%;"><%#Eval("blogDescription") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Pending Reviews</h4>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Reviews<br />Id</th>
                            <th>User<br />Id</th>
                            <th>Reviews</th>
                            <th>Show</th>
                            <th>Approve</th>
                            <th>Reject</th>
                            <th>Auto-Approve</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:HiddenField ID="hv" runat="server" />
                        <asp:ListView ID="lv_pendingReviews" runat="server" OnItemCommand="lv_pendingReviews_ItemCommand" OnItemDeleting="lv_pendingReviews_ItemDeleting" OnItemEditing="lv_pendingReviews_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("userid") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblreview" runat="server" Text='<%# Eval("review") %>' Visible="false"></asp:Label>
                                <tr>

                                    <td><%#Eval("id") %></td>
                                    <td><%#Eval("userid") %></td>
                                    <td><%#Eval("review") %></td>
                                    <td class="">
                                        <asp:LinkButton ID="btnShowReviews" OnClick="btnShowReviews_Click" runat="server" CommandName="Show" class="btn btn-sm btn-outline-primary btn-icon-text">Show <i class="mdi mdi-file-check btn-icon-prepend"></i>
                                        </asp:LinkButton>
                                    </td>
                                    <td class="">
                                        <span id="SpanAccept" runat="server" visible='<%# Eval("status").ToString() == "0" ? true : false %>'>
                                            <asp:LinkButton ID="btnAccept" runat="server" CommandName="Active" OnClick="btnAccept_Click" Text="Approve" class="btn btn-sm btn-outline-danger btn-icon-text">Approve <i class="mdi mdi-checkbox-marked-circle"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </td>
                                    <td class="">
                                        <asp:LinkButton ID="btnReject" runat="server" CommandName="Delete" OnClick="btnReject_Click" Text="Reject" class="btn btn-sm btn-outline-warning btn-icon-text">Reject <i class="mdi mdi-close-circle"></i>
                                        </asp:LinkButton>
                                    </td>
                                    <td class="form-check form-check-primary">
                                        <label class="form-check-label">
                                            <asp:CheckBox ID="chk_autoapprove" runat="server" Text="" />
                                            Auto Approve<i class="input-helper"></i>
                                        </label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body" style="overflow: scroll;">
                <h4 class="card-title">Reviews:-</h4>

                <table class="table">
                    <thead>
                        <tr>
                            <th>Reviews<br />Id</th>
                            <th>User<br />Id</th>
                            <th>Reviews</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lv_showPendingReviews" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("id") %></td>
                                    <td><%#Eval("userid") %></td>
                                    <td><%#Eval("review") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>

            </div>
        </div>
    </div>

</asp:Content>

