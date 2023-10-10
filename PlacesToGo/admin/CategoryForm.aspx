<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CategoryForm.aspx.cs" Inherits="admin_CategoryForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <h1>Place Category Form</h1>
        <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="forms-sample">

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">

                                <div class="form-group">
                                    <label for="txtcategoryName">Enter Place Category</label>
                                    <asp:TextBox ID="txtcategoryName" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                 <div class="form-group">
                                    <label for="categoryImage">Upload Place Category Image</label>
                                     <asp:FileUpload ID="categoryImage" runat="server" class="form-control" AllowMultiple="true"/>
                                </div>
                            </div>
                        </div>

                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="btn btn-gradient-primary me-2" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_Click" class="btn btn-gradient-primary me-2" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="btn btn-gradient-primary me-2" />

                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12 col-sm-12 col-md-12 col-12">
            <div class="table-responsive">
                <table class="table" style="background-color: #fff;">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Category Name</th>
                            <th scope="col">Category Image</th>
                            <th scope="col">status</th>
                            <th scope="col">Edit</th>
                            <th scope="col">Delete</th>
                            <th scope="col">Change Status</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:HiddenField ID="hdnvalue" runat="server" />
                        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnItemEditing="ListView1_ItemEditing" OnItemDeleting="ListView1_ItemDeleting">
                            <ItemTemplate>
                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblcategoryName" runat="server" Text='<%# Eval("categoryName") %>' Visible="false"></asp:Label>
                                <asp:FileUpload ID="lblcategoryImage" runat="server" Text='<%#Eval("categoryImage") %>' Visible="false" />
                                <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                                <tr class="">

                                    <td><%# Eval("id") %></td>
                                    <td><%# Eval("categoryName") %></td>
                                    <td>
                                        <img src="assets/Images/CategoryImages/<%# Eval("categoryImage") %>" /></td>
                                    <td><%# Eval("status") %></td>
                                    <td>
                                        <asp:Button ID="EditBtn" runat="server" Text="Edit" CommandName="edit" class="btn btn-gradient-primary me-2" />
                                    </td>

                                    <td>
                                        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CommandName="delete" class="btn btn-gradient-primary me-2" />
                                    </td>

                                    <td>
                                        <span id="Span1" runat="server" visible='<%# Eval("status").ToString() == "1" ? true : false %>'>
                                            <asp:Button ID="Active" runat="server" Text="Deactive" CommandName="Deactive" class="btn btn-gradient-primary me-2" />
                                        </span>

                                        <span id="Span2" runat="server" visible='<%# Eval("status").ToString() == "0" ? true : false %>'>
                                            <asp:Button ID="Deactive" runat="server" Text="Active" CommandName="Active" class="btn btn-gradient-primary me-2" />
                                        </span>
                                    </td>


                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

