<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddNearbyPlaces.aspx.cs" Inherits="admin_AddNearbyPlaces" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <h1>Place Information Form</h1>
        <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body p-3">
                    <div class="forms-sample">
                        <div id="subplace_details" runat="server" class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="ddl_mainplace">Select Main Place</label>
                                    <asp:DropDownList ID="ddl_mainplace" runat="server" class="form-control form-control-lg" DataTextField="placeName" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddl_mainplace_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select Main Place" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div id="subplace_details2" runat="server" class="row">
                            <div class="col-lg-2 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtcontinentid">Continent</label>
                                    <asp:TextBox ID="txtcontinentid" ReadOnly="true" class="form-control form-control-lg" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtcountryid">Country</label>
                                    <asp:TextBox ID="txtcountryid" ReadOnly="true" class="form-control form-control-lg" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <asp:Label ID="lbltxtsid" for="txtsid" runat="server" Text="">State</asp:Label>
                                    <asp:TextBox ID="txtsid" ReadOnly="true" class="form-control form-control-lg" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <asp:Label ID="lbltxtdid" for="txtdid" runat="server" Text="">District</asp:Label>
                                    <asp:TextBox ID="txtdid" ReadOnly="true" class="form-control form-control-lg" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtcity">City</label>
                                    <asp:TextBox ID="txtcity" ReadOnly="true" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtplaceCategory">Enter Place Category</label>
                                    <asp:TextBox ID="txtplaceCategory" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtplace">Enter Place Name</label>
                                    <asp:TextBox ID="txtplace" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtplaceMap">Enter Place Map</label>
                                    <asp:TextBox ID="txtplaceMap" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 1st</label>
                                    <asp:FileUpload ID="placeImage1" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 2nd</label>
                                    <asp:FileUpload ID="placeImage2" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 3rd</label>
                                    <asp:FileUpload ID="placeImage3" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 4th</label>
                                    <asp:FileUpload ID="placeImage4" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 5th</label>
                                    <asp:FileUpload ID="placeImage5" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="chkList">Select modes to rich out</label>
                                    <div>
                                        <fieldset style="width: 150px">
                                            <legend></legend>
                                            <asp:CheckBoxList ID="chkList" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Airway" Value="Airway" />
                                                <asp:ListItem Text="Train" Value="Train" />
                                                <asp:ListItem Text="Buses" Value="Buses" />
                                            </asp:CheckBoxList>
                                            <asp:Label ID="lblchkList" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="txtplaceIntro">Enter Place Intoduction in 15 - 20 words only</label>
                                    <asp:TextBox ID="txtplaceIntro" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="description">Enter place description</label>
                                    <div>
                                        <CKEditor:CKEditorControl ID="description" BasePath="/ckeditor/" runat="server">
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
                        <th scope="col">Continent<br />
                            Id</th>
                        <th scope="col">Country<br />
                            Id</th>
                        <th scope="col">sid</th>
                        <th scope="col">did</th>
                        <th scope="col">pid</th>
                        <th scope="col">city<br />
                            name</th>
                        <th scope="col">place<br />
                            category</th>
                        <th scope="col">place<br />
                            name</th>
                        <th scope="col">image</th>
                        <th scope="col">Add<br />
                            Hotel</th>
                        <th scope="col">Add<br />
                            Nearby<br />
                            Places</th>
                        <th scope="col">status</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Delete</th>
                        <th scope="col">Change<br />
                            Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:HiddenField ID="hdnvalue" runat="server" />
                    <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" OnItemEditing="ListView1_ItemEditing" OnItemDeleting="ListView1_ItemDeleting">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblplaceCategory" runat="server" Text='<%# Eval("categoryName") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblplaceName" runat="server" Text='<%# Eval("placeName") %>' Visible="false"></asp:Label>
                            <asp:FileUpload ID="lblplaceImage1" runat="server" Text='<%# Eval("placeImage1") %>' Visible="false" />
                            <asp:FileUpload ID="lblplaceImage2" runat="server" Text='<%# Eval("placeImage2") %>' Visible="false" />
                            <asp:FileUpload ID="lblplaceImage3" runat="server" Text='<%# Eval("placeImage3") %>' Visible="false" />
                            <asp:FileUpload ID="lblplaceImage4" runat="server" Text='<%# Eval("placeImage4") %>' Visible="false" />
                            <asp:FileUpload ID="lblplaceImage5" runat="server" Text='<%# Eval("placeImage5") %>' Visible="false" />
                            <asp:Label ID="lblplaceMap" runat="server" Text='<%# Eval("placeMap") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblplaceIntro" runat="server" Text='<%# Eval("placeIntro") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblplaceDiscription" runat="server" Text='<%# Eval("placeDiscription") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbltransport" runat="server" Text='<%# Eval("transport") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>

                            <tr class="">
                                <td><%# Eval("id") %></td>
                                <td><%# Eval("continentid") %></td>
                                <td><%# Eval("countryid") %></td>
                                <td><%# Eval("sid") %></td>
                                <td><%# Eval("did") %></td>
                                <td><%# Eval("pid") %></td>
                                <td><%# Eval("cityname") %></td>
                                <td><%# Eval("categoryName") %></td>
                                <td><%# Eval("placeName") %></td>
                                <td>
                                    <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" /></td>
                                <td><a href="AddHotelsForm.aspx?continent=<%#Eval("continentid") %>&&country=<%#Eval("countryid") %>&&state=<%#Eval("sid") %>&&district=<%#Eval("did") %>&&place=<%#Eval("id") %>" class="btn btn-gradient-primary me-2">Add Hotels</a></td>
                                <td><a href="AddNearbyPlaces.aspx?continent=<%#Eval("continentid") %>&&country=<%#Eval("countryid") %>&&state=<%#Eval("sid") %>&&district=<%#Eval("did") %>&&place=<%#Eval("id") %>" class="btn btn-gradient-primary me-2">Add Nearby Places</a></td>
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

