<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="explore.aspx.cs" Inherits="explore" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-1-d-none {
            display: none !important;
        }

        .btn.search-btn2 {
            padding: 5px;
            font-size: 1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ============================ Hero Banner  Start================================== -->
    <section class="gray">
        <div class="container">
            <div class="row">

                <div class="col-lg-4 col-md-12">
                    <div class="Reveal-exlip-sidebar">

                        <div class="Reveal-exlip-sidebar-header">
                            <div class="exlip-header-flex">
                                <h4>Filter & Apply</h4>
                            </div>
                            <div class="exlip-header-last">
                                <a href="javascript:void(0);" class="elip-btn-side" data-toggle="collapse" data-target="#filter-search"><i class="fas fa-sliders-h"></i></a>
                            </div>
                        </div>

                        <!-- Find New Property -->
                        <div class="Reveal-exlip-sidebar-body show" id="filter-search">
                            <div class="Reveal-exlip-sidebar-widgets">

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
                                <asp:Label ID="lblemptry" runat="server" Text="" Visible="false" ForeColor="white" Style="text-align: center; margin: 5px auto 0px; display: block;"></asp:Label>

                                <div class="form-group text-center">
                                    <asp:LinkButton ID="btnSearch" class="btn btn-theme btn-md full-width" runat="server" Text="Apply &amp; Filter" OnClick="btnSearch_Click"></asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="content-area col-lg-8 col-md-12">

                    <!--- Filter List -->
                    <div class="row">
                        <!-- Filter Result -->
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="shorting-wrap">
                                <h5 class="shorting-title">
                                    <asp:Label ID="lblRowCount" runat="server" Text=""></asp:Label></h5>
                                <div class="shorting-right">
                                    <label>Short By:</label>
                                    <asp:DropDownList ID="ss_sorting" runat="server" class="" OnSelectedIndexChanged="ss_sorting_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true">
                                        <asp:ListItem Value="1" Text="Most Rated" CssClass="dropdown-item no-border" Selected></asp:ListItem>
                                        <asp:ListItem Value="2" Text="A - Z" CssClass="dropdown-item no-border"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Z - A" CssClass="dropdown-item no-border"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--- All List -->
                    <div class="row" id="mainplaces" runat="server">

                        <!-- Single List Start -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <asp:ListView ID="lv_explore" runat="server" OnPagePropertiesChanging="lv_explore_PagePropertiesChanging" OnItemDataBound="lv_explore_ItemDataBound">
                                <ItemTemplate>

                                    <!--  Single Listing -->
                                    <div class="Reveal-verticle-list listing-shot">
                                        <div class="listing-badge now-open"><%# Eval("categoryName") %></div>
                                        <a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>" class="list-cat theme-bg"><%# Eval("categoryName") %></a>
                                        <div class="Reveal-signle-item">
                                            <a class="listing-item" href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>">
                                                <div class="listing-items">
                                                    <div class="listing-shot-img">
                                                        <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" class="img-responsive" alt="">
                                                    </div>
                                                </div>
                                            </a>
                                            <div class="Reveal-verticle-listing-caption">
                                                <div class="Reveal-listing-shot-caption">
                                                    <h4><a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>"><%# Eval("placeName") %></a> <span class="approve-listing"><i class="fa fa-check"></i></span></h4>

                                                    <span><i class="ti-location-pin text-success"></i>
                                                        <span id="Span4" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? true : false %>' style="color: green"><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %>, <%# Eval("continent_name") %></span>
                                                        <span id="Span3" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? false : true %>' style="color: green"><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("district_title") %><%# !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %>, <%# Eval("continent_name") %></span>
                                                    </span>
                                                    <p class="Reveal-short-descr"><%# GetFirstWords(Eval("placeIntro")) %>.....</p>
                                                    <div class="Reveal-listing-shot-info rating">
                                                        <asp:Label ID="s1" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="s2" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="s3" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="s4" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="s5" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="totalrev" runat="server" class="overall-reviews"></asp:Label>
                                                        <a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>" class="view-overall-rate">
                                                            <asp:Label ID="avgRatingLabel" runat="server" Text=""><a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>"></a></asp:Label>
                                                            <asp:Label ID="avgRatingCountLabel" runat="server" Text=""><a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>"></a></asp:Label>
                                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:ListView>
                        </div>

                    </div>

                    <!--- All List -->
                    <div class="row" id="nearbyplaces" runat="server">

                        <!-- Single List Start -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <asp:ListView ID="lv_explore2" runat="server" OnPagePropertiesChanging="lv_explore_PagePropertiesChanging" OnItemDataBound="lv_explore2_ItemDataBound">
                                <ItemTemplate>

                                    <!--  Single Listing -->
                                    <div class="Reveal-verticle-list listing-shot">
                                        <div class="listing-badge now-open"><%# Eval("categoryName") %></div>
                                        <a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>" class="list-cat theme-bg"><%# Eval("categoryName") %></a>
                                        <div class="Reveal-signle-item">
                                            <a class="listing-item" href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>">
                                                <div class="listing-items">
                                                    <div class="listing-shot-img">
                                                        <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" class="img-responsive" alt="">
                                                    </div>
                                                </div>
                                            </a>
                                            <div class="Reveal-verticle-listing-caption">
                                                <div class="Reveal-listing-shot-caption">
                                                    <h4><a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>"><%# Eval("placeName") %></a> <span class="approve-listing"><i class="fa fa-check"></i></span></h4>
                                                    <span><i class="ti-location-pin text-success"></i>
                                                        <span id="Span2" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? true : false %>' style="color: green"><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %>, <%# Eval("continent_name") %></span>
                                                        <span id="Span1" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? false : true %>' style="color: green"><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("district_title") %><%# !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %>, <%# Eval("continent_name") %></span>
                                                    </span>
                                                    <p class="Reveal-short-descr"><%# GetFirstWords(Eval("placeIntro")) %>.....</p>
                                                    <div class="Reveal-listing-shot-info rating">
                                                        <asp:Label ID="s1" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="s2" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="s3" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="s4" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="s5" runat="server" Visible="false"><i class="fas fa-star filled"></i></asp:Label>
                                                        <asp:Label ID="totalrev" runat="server" class="overall-reviews"></asp:Label>
                                                        <a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>" class="view-overall-rate">
                                                            <asp:Label ID="avgRatingLabel" runat="server" Text=""><a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>"></a></asp:Label>
                                                            <asp:Label ID="avgRatingCountLabel" runat="server" Text=""><a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>"></a></asp:Label>
                                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblpid" runat="server" Text='<%# Eval("pid") %>' Visible="false"></asp:Label>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:ListView>
                        </div>

                    </div>

                    <!-- Pagination -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 DataPager-center">
                            <asp:DataPager ID="DataPager" runat="server" PagedControlID="lv_explore" PageSize="10">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="cssFirst cssBtnsPg" />
                                    <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="" ShowFirstPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" ButtonCssClass="cssNextPrev ti-arrow-left" />
                                    <asp:NumericPagerField NumericButtonCssClass="cssBtnsPg" ButtonType="Link" CurrentPageLabelCssClass="cssBtnsPg CurrentBtnPg" ButtonCount="1000000000" />
                                    <asp:NextPreviousPagerField ButtonType="Link" NextPageText="" ShowFirstPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" ButtonCssClass="cssNextPrev cssNextOnly ti-arrow-right" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="cssLast cssBtnsPg" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="clearfix"></div>
    <!-- ============================ Hero Banner End ================================== -->
</asp:Content>

