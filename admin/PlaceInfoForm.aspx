<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PlaceInfoForm.aspx.cs" Inherits="admin_PlaceInfoForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .select2-container {
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <h1>Place Information Form</h1>
        <div class="col-lg-12 col-sm-12 col-md-12 col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body p-3">
                    <div class="forms-sample">
                        <div id="radiochk" runat="server" class="row">
                            <h4 style="margin: 10px 0px;">Enter as SubPlace ?</h4>
                            <div class="form-group">
                                <asp:RadioButton ID="RadioButton1" GroupName="RadioButton" runat="server" Text="" AutoPostBack="True" OnCheckedChanged="RadioButton1_CheckedChanged" />
                                <label for="RadioButton1">Yes. SubPlace</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="ddcid">Select Category</label>
                                    <asp:DropDownList ID="ddcid" runat="server" class="form-control form-control-lg" DataTextField="categoryName" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddcid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select Category" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="ddcontinentid">Select Continent</label>
                                    <asp:DropDownList ID="ddcontinentid" runat="server" class="form-control form-control-lg" DataTextField="continent_name" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddcontinentid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select Continent" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="ddcountryid">Select Country</label>
                                    <asp:DropDownList ID="ddcountryid" runat="server" class="form-control form-control-lg" DataTextField="name" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="ddcountryid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select Country" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblddsid" for="ddsid" runat="server" Text="">Select State</asp:Label>
                                    <asp:DropDownList ID="ddsid" runat="server" class="form-control form-control-lg" DataTextField="state_title" DataValueField="state_id" AutoPostBack="true" OnSelectedIndexChanged="ddsid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select State" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lbldddid" for="dddid" runat="server" Text="">Select District</asp:Label>
                                    <asp:DropDownList ID="dddid" runat="server" class="form-control form-control-lg" DataTextField="district_title" DataValueField="districtid" AutoPostBack="true" OnSelectedIndexChanged="dddid_SelectedIndexChanged" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Select District" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtcity">Enter City Name</label>
                                    <asp:TextBox ID="txtcity" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtplace">Enter Place Name</label>
                                    <asp:TextBox ID="txtplace" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtplaceMap">Enter Place Map</label>
                                    <asp:TextBox ID="txtplaceMap" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtplaceIntro">Enter Place Intoduction in 15 - 20 words only</label>
                                    <asp:TextBox ID="txtplaceIntro" runat="server" class="form-control"></asp:TextBox>
                                </div>
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
                                            <asp:Label ID="lblchkList" runat="server" Text=""></asp:Label>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 1st</label>
                                    <asp:FileUpload ID="placeImage1" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 2nd</label>
                                    <asp:FileUpload ID="placeImage2" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 3rd</label>
                                    <asp:FileUpload ID="placeImage3" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 4th</label>
                                    <asp:FileUpload ID="placeImage4" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
                                </div>
                                <div class="form-group">
                                    <label for="placeImage">Upload Place Image 5th</label>
                                    <asp:FileUpload ID="placeImage5" runat="server" class="form-control file-upload-info" placeholder="Upload Image" />
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
                        <th scope="col">Continent ID</th>
                        <th scope="col">Country Id</th>
                        <th scope="col">cid</th>
                        <th scope="col">sid</th>
                        <th scope="col">did</th>
                        <th scope="col">cityname</th>
                        <th scope="col">place name</th>
                        <th scope="col">images</th>
                        <th scope="col">Add Nearby Places</th>
                        <th scope="col">Add Hotel</th>
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
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblcontinentid" runat="server" Text='<%# Eval("continentid") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblcountryid" runat="server" Text='<%# Eval("countryid") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblcid" runat="server" Text='<%# Eval("cid") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblsid" runat="server" Text='<%# Eval("sid") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbldid" runat="server" Text='<%# Eval("did") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblcityname" runat="server" Text='<%# Eval("cityname") %>' Visible="false"></asp:Label>
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
                                <td><%# Eval("cid") %></td>
                                <td><%# Eval("sid") %></td>
                                <td><%# Eval("did") %></td>
                                <td><%# Eval("cityname") %></td>
                                <td><%# Eval("placeName") %></td>
                                <td>
                                    <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" /></td>
                                <td><a href="AddNearbyPlaces.aspx?continent=<%#Eval("continentid") %>&&country=<%#Eval("countryid") %>&&state=<%#Eval("sid") %>&&district=<%#Eval("did") %>&&place=<%#Eval("id") %>&&city=<%#Eval("cityname") %>" class="btn btn-gradient-primary me-2">Add Nearby Places</a></td>
                                <td><a href="AddHotelsForm.aspx?continent=<%#Eval("continentid") %>&&country=<%#Eval("countryid") %>&&state=<%#Eval("sid") %>&&district=<%#Eval("did") %>&&place=<%#Eval("id") %>&&city=<%#Eval("cityname") %>" class="btn btn-gradient-primary me-2">Add Hotels</a></td>
                                <td><%# Eval("status") %></td>
                                <td>
                                    <asp:LinkButton ID="EditBtn" runat="server" Text="Edit" CommandName="edit" class="btn btn-gradient-primary me-2"></asp:LinkButton>
                                </td>

                                <td>
                                    <asp:LinkButton ID="DeleteBtn" runat="server" Text="Delete" CommandName="delete" class="btn btn-gradient-primary me-2"></asp:LinkButton>
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

