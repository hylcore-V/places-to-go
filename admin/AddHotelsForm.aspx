<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddHotelsForm.aspx.cs" Inherits="admin_AddHotelsForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <h1>Place Information Form</h1>
        <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="forms-sample">
                        <div id="dd_lists" runat="server" class="row">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="ddcontinentid">Select Continent</label>
                                    <asp:DropDownList ID="ddcontinentid" runat="server" class="form-control form-control-lg" DataTextField="continent_name" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddcontinentid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select Continent" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="ddcountryid">Select Country</label>
                                    <asp:DropDownList ID="ddcountryid" runat="server" class="form-control form-control-lg" DataTextField="name" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddcountryid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select Country" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <asp:Label ID="lblddsid" for="ddsid" runat="server" Text="">Select State</asp:Label>
                                    <asp:DropDownList ID="ddsid" runat="server" class="form-control form-control-lg" DataTextField="state_title" DataValueField="state_id" AutoPostBack="true" OnSelectedIndexChanged="ddsid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select State" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <asp:Label ID="lbldddid" for="dddid" runat="server" Text="">Select District</asp:Label>
                                    <asp:DropDownList ID="dddid" runat="server" class="form-control form-control-lg" DataTextField="district_title" DataValueField="districtid" AutoPostBack="true" OnSelectedIndexChanged="dddid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select District" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtcity">Enter Hotel City Name</label>
                                    <asp:TextBox ID="txtcity" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txthotelname">Enter Hotel Name</label>
                                    <asp:TextBox ID="txthotelname" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txthoteladdress">Enter Hotel Address</label>
                                    <asp:TextBox ID="txthoteladdress" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txthotelimg">Enter Hotel Image</label>
                                    <asp:FileUpload ID="txthotelimg" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="hoteldescription">Enter Hotel Description</label>
                                    <div>
                                        <CKEditor:CKEditorControl ID="hoteldescription" BasePath="/ckeditor/" runat="server">
                                        </CKEditor:CKEditorControl>
                                    </div>
                                </div>
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
                        <th scope="col">Cont.
                            <br />
                            ID</th>
                        <th scope="col">Country<br />
                            Id</th>
                        <th scope="col">sid</th>
                        <th scope="col">did</th>
                        <th scope="col">Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Address</th>
                        <th scope="col">status</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Delete</th>
                        <th scope="col">Change Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:HiddenField ID="hdnvalue" runat="server" />
                    <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnItemEditing="ListView1_ItemEditing">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("hotel_id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblcontinentid" runat="server" Text='<%# Eval("continent_id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblcountryid" runat="server" Text='<%# Eval("country_id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblsid" runat="server" Text='<%# Eval("state_id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbldid" runat="server" Text='<%# Eval("district_id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblhotel_city" runat="server" Text='<%# Eval("hotel_city") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblhotel_name" runat="server" Text='<%# Eval("hotel_name") %>' Visible="false"></asp:Label>
                            <asp:FileUpload ID="lblhotel_image" runat="server" Text='<%# Eval("hotel_image") %>' Visible="false" />
                            <asp:Label ID="lblhotel_address" runat="server" Text='<%# Eval("hotel_address") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblhotel_details" runat="server" Text='<%# Eval("hotel_details") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                            <tr class="">
                                <td><%# Eval("hotel_id") %></td>
                                <td><%# Eval("continent_id") %></td>
                                <td><%# Eval("country_id") %></td>
                                <td><%# Eval("state_id") %></td>
                                <td><%# Eval("district_id") %></td>
                                <td><%# Eval("hotel_name") %></td>
                                <td>
                                    <img src="assets/Images/HotelImages/<%# Eval("hotel_image") %>" /></td>
                                <td><%# Eval("hotel_address") %></td>
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
</asp:Content>

