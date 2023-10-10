<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="add-blogs.aspx.cs" Inherits="add_blogs" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-1-d-none {
            display: none !important;
        }
    </style>

    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <!-- ckeditor link -->
    <script src="https://cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ============================ Page Title Start================================== -->
    <div class="image-cover page-title" style="background: url(assets/img/banner-2.jpg) no-repeat;" data-overlay="6">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">

                    <h2 class="ipt-title">Add Blog</h2>
                    <span class="ipn-subtitle text-light">Submit your blogs & share</span>

                </div>
            </div>
        </div>
    </div>
    <!-- ============================ Page Title End ================================== -->

    <!-- =========================== Add Form Start ============================================ -->
    <section class="gray">
        <div class="container">

            <div class="row justify-content-md-center">
                <div class="col-lg-10 col-md-10 col-sm-12">
                    <div class="add-listing-form form-submit">

                        <!-- general information -->
                        <div class="tr-single-box">
                            <div class="tr-single-header">
                                <h4><i class="ti-medall-alt"></i>Blog information</h4>
                            </div>

                            <div class="Reveal-other-body">
                                <asp:Label ID="hdnvalue" runat="server" Visible="false"></asp:Label>

                                <div class="form-group">
                                    <asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>
                                    <div class="form-group">
                                        <label for="ddcid">Select Category</label>
                                        <asp:DropDownList ID="ddcid" runat="server" class="form-control" DataTextField="categoryName" DataValueField="id" AppendDataBoundItems="true" OnSelectedIndexChanged="ddcid_SelectedIndexChanged" AutoPostBack="true" required>
                                            <asp:ListItem Value="0" Text="Select Category" Selected disabled></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="ddpid">Select Place Of Blog</label>
                                    <asp:DropDownList ID="ddpid" runat="server" class="form-control form-control-lg" DataTextField="placeName" DataValueField="id" AppendDataBoundItems="true" OnSelectedIndexChanged="ddpid_SelectedIndexChanged" AutoPostBack="true" required>
                                        <asp:ListItem Value="0" Text="Select Category" Selected disabled></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group">
                                    <label for="blogAuthor">Enter blogs author</label>
                                    <asp:TextBox ID="blogAuthor" runat="server" class="form-control" required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="blogTitle">Enter blogs title</label>
                                    <asp:TextBox ID="blogTitle" runat="server" class="form-control" required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="blogTags">Enter blogs tags</label>
                                    <asp:TextBox ID="blogTags" runat="server" class="form-control" required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="blogDescription">Enter blogs description</label>
                                    <div>
                                        <CKEditor:CKEditorControl ID="blogDescription" BasePath="~/ckeditor/" runat="server" required>
                                        </CKEditor:CKEditorControl>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <!-- Gallery -->
                        <div class="tr-single-box">
                            <div class="tr-single-header">
                                <h4><i class="ti-image"></i>Gallery</h4>
                            </div>

                            <div class="Reveal-other-body">
                                <div class="row">

                                    <div class="col-lg-4 col-md-6">
                                        <asp:FileUpload ID="blogsUpload" runat="server" class="dropzone" placeholder="Upload Image" required />
                                        <i class="lni-upload"></i>
                                        <label class="smart-text">Maximum file size: 2 MB.</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:LinkButton ID="btnSubmit" runat="server" Text="Submit & Preview" OnClick="btnSubmit_Click" class="btn btn-theme btn-md full-width"></asp:LinkButton>
                        <div id="MyPopup" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"></h4>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <asp:LinkButton ID="btnSendToLogin" runat="server" OnClick="btnSendToLogin_Click" type="button" class="btn btn-danger" Text="Login" ></asp:LinkButton>
                                        <asp:LinkButton ID="btncancle" OnClick="btncancle_Click" runat="server" type="button" class="btn btn-danger" Text="Cancle"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- =========================== Add Form End ============================================ -->
</asp:Content>

