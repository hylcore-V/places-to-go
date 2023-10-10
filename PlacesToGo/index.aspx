<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-2-d-none {
            display: none !important;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ============================ Banner  Start ============================ -->
    <div class="image-cover hero-banner" style="background: url(assets/img/banner-1.jpg) no-repeat;" data-overlay="4">
        <div class="container">

            <h1 class="big-header-capt capti">Find The Right Place</h1>
            <div class="full-search-2 Reveal-search Reveal-search-radius box-style">
                <div class="Reveal-search-content">
                    <div class="row">

                        <div class="col-lg-4 col-md-4 col-sm-12 br-left-p">
                            <div class="form-group">
                                <div class="input-with-icon">
                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchContinent" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender7" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchCountry" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender8" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchState" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender9" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchDistrict" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender10" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchCategory" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender12" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchPlace" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender13" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchCityName" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender14" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchNearbyPlace" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender15" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchNPCategory" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtkeywords">
                                    </cc1:AutoCompleteExtender>

                                    <asp:TextBox ID="txtkeywords" CssClass="form-control autosuggest" class="form-control autosuggest" runat="server" placeholder="Search Keywords..."></asp:TextBox>
                                    <i class="theme-cl ti-search"></i>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-12 br-left-p">
                            <div class="form-group">
                                <div class="input-with-icon">
                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchContinent" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtlocation">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchCountry" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtlocation">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender4" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchState" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtlocation">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender5" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchDistrict" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtlocation">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender11" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchPlace" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtlocation">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender16" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchCityName" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtlocation">
                                    </cc1:AutoCompleteExtender>

                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender17" runat="server" ServicePath="~/search.asmx"
                                        ServiceMethod="SearchNearbyPlace" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                        CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                        FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtlocation">
                                    </cc1:AutoCompleteExtender>

                                    <asp:TextBox ID="txtlocation" CssClass="form-control autosuggest" class="form-control autosuggest" runat="server" placeholder="Search Location..."></asp:TextBox>
                                    <i class="theme-cl ti-target"></i>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-6">
                            <div class="form-group">
                                <div class="input-with-icon">

                                   <cc1:AutoCompleteExtender ID="AutoCompleteExtender6" runat="server" ServicePath="~/search.asmx"
                                            ServiceMethod="SearchCategory" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                            CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                            FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtcategory">
                                        </cc1:AutoCompleteExtender>

                                        <cc1:AutoCompleteExtender ID="AutoCompleteExtender18" runat="server" ServicePath="~/search.asmx"
                                            ServiceMethod="SearchNPCategory" CompletionInterval="10" CompletionListItemCssClass="AutoCompliteItem"
                                            CompletionListCssClass="AutoComplite" CompletionListHighlightedItemCssClass="AutoCompliteSelectedItem"
                                            FirstRowSelected="true" MinimumPrefixLength="1" TargetControlID="txtcategory">
                                        </cc1:AutoCompleteExtender>

                                    <asp:TextBox ID="txtcategory" CssClass="form-control autosuggest" class="form-control autosuggest" runat="server" placeholder="Search Category..."></asp:TextBox>
                                    <i class="theme-cl ti-briefcase"></i>

                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <asp:LinkButton ID="btnSearch" class="btn search-btn" runat="server" Text="Search" OnClick="btnSearch_Click"></asp:LinkButton>
                                <%--<asp:Button ID="btnSearch" class="btn search-btn" runat="server" Text="Search" OnClick="btnSearch_Click"/>--%>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <asp:Label ID="lblemptry" runat="server" Text="" Visible="false" ForeColor="white" Style="text-align: center; margin: 5px auto 0px; display: block;"></asp:Label>

            <div class="popular-cat-list">
                <ul>
                    <asp:ListView ID="lv_onlycategories" runat="server">
                        <ItemTemplate>
                            <li><a href="explore.aspx?search=<%#Eval("categoryName") %>"><%#Eval("categoryName") %></a></li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
            </div>

        </div>
    </div>
    <!-- ============================ Banner End ============================ -->

    <!-- ============================ Recent Listings ======================= -->
    <section>
        <div class="container">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-advance theme-bg" role="tablist">
                <li class="nav-item active">
                    <a class="nav-link" data-toggle="tab" href="#recent" role="tab">Recent Listing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#featured" role="tab">Featured Listing</a>
                </li>
            </ul>

            <div class="tab-content">
                <!-- Recent Listings -->
                <div class="tab-pane fade in show active" id="featured" role="tabpanel">
                    <div class="row">
                        <asp:HiddenField ID="hdnvalue" runat="server" />
                        <asp:ListView ID="lv_placeList2" runat="server">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>

                                <!-- Single Listing Grid -->
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="Reveal-grid-wrapper">
                                        <div class="list-badge closed"><%# Eval("continent_name") %></div>
                                        <div class="Reveal-grid-thumb">
                                            <div class="Reveal-listing-price-info">
                                                <span class="pricetag"><%# Eval("name") %></span>
                                            </div>

                                            <div class="lup-category"><a href="search-with-sidebar.html"><%# Eval("categoryName") %></a></div>
                                            <a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>" class="lup-box">
                                                <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" class="img-fluid" alt="img not found" />
                                            </a>
                                        </div>

                                        <div class="Reveal-grid-footer">
                                            <div class="Reveal-grid-footer-flex">
                                                <div class="Reveal-grid-caption-header">
                                                    <h4 class="Reveal-header-title"><a href="place-details.aspx"><%# Eval("placeName") %></a></h4>
                                                    <div class="Reveal-grid-reviews">
                                                        <span><i class="ti-location-pin text-success"></i>
                                                        <span id="Span4" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? true : false %>'><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %></span>
                                                        <span id="Span3" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? false : true %>'><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("district_title") %><%# !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %></span>
                                                        <%--<%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("district_title") %><%# !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>--%>                                                        
                                                    </span>
                                                        <%--<span class="overall-reviews"><%# Eval("cityname") %>, <%# Eval("district_title") %>, <%# Eval("state_title") %>, <%# Eval("nicename") %></span>--%>
                                                    
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="Reveal-grid-footer-last">
                                                <a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>" class="Reveal-view-btn">View</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>

                <!-- Featured listings -->
                <div class="tab-pane fade" id="recent" role="tabpanel">
                    <div class="row">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:ListView ID="lv_placeList" runat="server">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>

                                <!-- Single Listing Grid -->
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="Reveal-grid-wrapper">
                                        <div class="list-badge closed"><%# Eval("continent_name") %></div>
                                        <div class="Reveal-grid-thumb">
                                            <div class="Reveal-listing-price-info">
                                                <span class="pricetag"><%# Eval("name") %></span>
                                            </div>
                                            <div class="lup-category"><a href="search-with-sidebar.html"><%# Eval("categoryName") %></a></div>
                                            <a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>" class="lup-box">
                                                <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" class="img-fluid" alt="img not found" />
                                            </a>
                                        </div>

                                        <div class="Reveal-grid-footer">
                                            <div class="Reveal-grid-footer-flex">
                                                <div class="Reveal-grid-caption-header">
                                                    <h4 class="Reveal-header-title"><a href="place-details.aspx"><%# Eval("placeName") %></a></h4>
                                                    <div class="Reveal-grid-reviews">
                                                        <span><i class="ti-location-pin text-success"></i>
                                                        <span id="Span4" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? true : false %>'><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %></span>
                                                        <span id="Span3" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? false : true %>'><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("district_title") %><%# !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %></span>
                                                        <%--<%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("district_title") %><%# !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>--%>                                                        
                                                    </span>
                                                        <%--<span class="overall-reviews"><%# Eval("cityname") %>, <%# Eval("district_title") %>, <%# Eval("state_title") %>, <%# Eval("nicename") %></span>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="Reveal-grid-footer-last">
                                                <a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>" class="Reveal-view-btn">View</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>

            </div>

            <div class="col-md-12 mrg-top-40">
                <div class="text-center">
                    <a href="explore.aspx" class="btn btn-light btn-md rounded">Browse More Listings</a>
                </div>
            </div>

        </div>
    </section>
    <!-- ============================ Recent Listings ============================ -->

    <!-- ============================ Category Start ============================ -->
    <section class="gray">
        <div class="container">

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="sec-heading center">
                        <h2>Categories</h2>
                        <h3>Search Places by <span class="theme-cl">Categories</span></h3>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="owl-carousel owl-theme" id="lists-slide">
                    <asp:HiddenField ID="hdnCatId" runat="server" />
                    <asp:ListView ID="lv_categoryslider" runat="server" OnItemCommand="lv_categoryslider_ItemCommand">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                            <!-- Single List -->
                            <div class="list-slide-box">
                                <a class="Reveal-moderns-category" href="explore.aspx?category=<%#Eval("id") %>">
                                    <figure>
                                        <img src="assets/Images/CategoryImages/<%# Eval("categoryImage") %>" class="img-fluid" alt="" />
                                </a>
                                <figcaption class="overlay-bg">
                                    <div class="cat-box">
                                        <div class="icon">
                                            <%--<span class="ti-truck"></span>--%>
                                        </div>
                                        <div class="cat-info">
                                            <h4 class="cat-name"><%# Eval("categoryName") %></h4>
                                            <asp:Label ID="lblCatCount" runat="server" class="badge badge-pill theme-bg" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </figcaption>
                                </figure>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                </div>
            </div>

        </div>
    </section>
    <!-- ============================ Category End ============================ -->

    <!-- ============================ Blog Grid ============================ -->
    <section>
        <div class="container">

            <div class="row">
                <div class="col text-center">
                    <div class="sec-heading center">
                        <h2>Articles</h2>
                        <h3>Our Latest <span class="theme-cl">Blogs</span></h3>
                    </div>
                </div>
            </div>

            <div class="row">

                <asp:ListView ID="lv_blogs" runat="server">
                    <ItemTemplate>
                        <!-- Single blog Grid -->
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="Reveal-blog-wrap-grid">

                                <div class="Reveal-blog-thumb">
                                    <a href="blog-detail.aspx?id=<%#Eval("id") %>">
                                        <img src="assets/Images/BlogImages/<%#Eval("blogImage") %>" alt="" />
                                    </a>
                                </div>

                                <div class="Reveal-blog-info">
                                    <span class="post-date">By <%#Eval("blogAuthor") %></span>
                                </div>

                                <div class="Reveal-blog-body">
                                    <h4 class="bl-title"><a href="blog-detail.aspx?id=<%#Eval("id") %>"><%#Eval("blogTitle") %></a></h4>
                                </div>

                                <div class="blog-cates">
                                    <ul>
                                        <li><a href="blog-detail.aspx?id=<%#Eval("id") %>" class="blog-cates-list style-3"><%#Eval("placeName") %></a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>

        </div>
    </section>
    <!-- ============================ Blog Grid End ============================ -->

</asp:Content>

