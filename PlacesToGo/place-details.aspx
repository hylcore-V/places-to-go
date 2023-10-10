<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="place-details.aspx.cs" Inherits="place_details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-1-d-none {
            display: none !important;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ============================ Place Details Slider Start================================== -->
    <div class="featured-slick">
        <div class="featured-slick-slide">
            <asp:ListView ID="lv_placeslider" runat="server">
                <ItemTemplate>
                    <div>
                        <a href="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" class="mfp-gallery">
                            <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" class="img-fluid mx-auto" alt="" /></a>
                    </div>
                    <div>
                        <a href="assets/Images/PlcaeImages/<%# Eval("placeImage2") %>" class="mfp-gallery">
                            <img src="assets/Images/PlcaeImages/<%# Eval("placeImage2") %>" class="img-fluid mx-auto" alt="" /></a>
                    </div>
                    <div>
                        <a href="assets/Images/PlcaeImages/<%# Eval("placeImage3") %>" class="mfp-gallery">
                            <img src="assets/Images/PlcaeImages/<%# Eval("placeImage3") %>" class="img-fluid mx-auto" alt="" /></a>
                    </div>
                    <div>
                        <a href="assets/Images/PlcaeImages/<%# Eval("placeImage4") %>" class="mfp-gallery">
                            <img src="assets/Images/PlcaeImages/<%# Eval("placeImage4") %>" class="img-fluid mx-auto" alt="" /></a>
                    </div>
                    <div>
                        <a href="assets/Images/PlcaeImages/<%# Eval("placeImage5") %>" class="mfp-gallery">
                            <img src="assets/Images/PlcaeImages/<%# Eval("placeImage5") %>" class="img-fluid mx-auto" alt="" /></a>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <!-- ============================ Place Details Slider End================================== -->

    <!-- ============================ Place Details Intro Start================================== -->
    <section class="gray p-0">
        <div class="container">
            <div class="row">
                <asp:ListView ID="lv_placedetails" runat="server" OnItemDataBound="lv_placedetails_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-lg-5 col-md-8">
                            <div class="tr-list-detail dark">
                                <div class="tr-list-thumb" style="display: flex; align-items: center;">
                                    <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" class="img-responsive" alt="" />
                                </div>
                                <div class="tr-list-info">
                                    <div class="cate-gorio"><a href="explore.aspx?query=go&&search=<%#Eval("categoryName") %>"><%# Eval("categoryName") %></a></div>
                                    <h4 class="veryfied-list"><%# Eval("placeName") %></h4>
                                    <p>
                                        <i class="ti-location-pin"></i>
                                        <span id="Span4" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? true : false %>' ><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %>, <%# Eval("continent_name") %></span>
                                        <span id="Span3" runat="server" visible='<%# Eval("district_title").ToString() == Eval("cityname").ToString() ? false : true %>' ><%# Eval("cityname") %><%# !string.IsNullOrEmpty(Eval("district_title").ToString()) && !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("district_title") %><%# !string.IsNullOrEmpty(Eval("state_title").ToString()) ? ", " : "" %><%# Eval("state_title") %>, <%# Eval("nicename") %>, <%# Eval("continent_name") %></span>
                                    </p>
                                    <asp:Label ID="avgRatingLabel" runat="server" Text=""><a href="#showRating"></a></asp:Label>
                                    <asp:Label ID="avgRatingCountLabel" runat="server" Text=""><a href="#showRating"></a></asp:Label>
                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
    <!-- ============================ Place Details Intro End ================================== -->
    <section class="gray p-3 d-block d-md-none">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 text-center">
                    <!-- Ways To Rich -->
                    <a href="#TransportNone" id="Slocation" runat="server">
                        <div class="Reveal-icon-box-round">
                            <i class='fa-solid fa-location-pin'></i>
                        </div>
                    </a>
                    <a href="#TransportNone" id="Splane" runat="server">
                        <div class="Reveal-icon-box-round">
                            <i class='fa-solid fa-plane'></i>
                        </div>
                    </a>
                    <a href="#TransportNone" id="Strain" runat="server">
                        <div class="Reveal-icon-box-round">
                            <i class='fa-solid fa-train'></i>
                        </div>
                    </a>
                    <a href="#TransportNone" id="Sbus" runat="server">
                        <div class="Reveal-icon-box-round">
                            <i class='fa-solid fa-bus'></i>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- ============================ Place Details Description Start ================================== -->
    <section class="gray pt-3">
        <div class="container">
            <div class="row">

                <!-- Place main detail -->
                <div class="col-lg-8 col-md-12 col-sm-12">
                    <!-- Description -->
                    <asp:ListView ID="lv_description" runat="server">
                        <ItemTemplate>
                            <div class="Reveal-block-wrap">

                                <div class="Reveal-block-header">
                                    <h4 class="block-title">Description</h4>
                                </div>

                                <div class="Reveal-block-body">
                                    <p><%#Eval("placeDiscription") %></p>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                    <!-- Nearby Places -->
                    <div id="PlacesToVisit" runat="server" class="Reveal-block-wrap">
                        <div class="Reveal-block-header">
                            <h4 class="block-title">Place to visit in <%=mainplacename %> :</h4>
                        </div>
                        <asp:ListView ID="lv_np" runat="server">
                            <ItemTemplate>
                                <div class="Reveal-block-body">
                                    <h4 class="block-title"><%#Eval("placeName") %></h4>
                                    <img src="assets/Images/PlcaeImages/<%# Eval("placeImage1") %>" class="img-fluid" alt="img not found" />
                                    <p><%# Eval("placeDiscription").ToString().Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries).Take(2).Aggregate((i, j) => i + "<br/>" + j) %></p>
                                </div>
                                <div class="Reveal-block-header">
                                    <a href="place-details.aspx?search=placestovisitin&&q=<%#Eval("id") %>&&d=<%#Eval("did") %>&&s=<%#Eval("sid") %>&&p=<%#Eval("pid") %>" class="block-title">Explore More -</a>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>

                    <!-- Place Reviews -->
                    <div id="showReviews" runat="server" class="list-single-main-item fl-wrap">
                        <div class="list-single-main-item-title fl-wrap">
                            <h3 id="reviewcount" runat="server"></h3>
                        </div>
                        <div class="reviews-comments-wrap">
                            <asp:Panel ID="MyPanel" runat="server">
                                <asp:ListView ID="lv_showReviews" runat="server">
                                    <ItemTemplate>
                                        <!-- reviews-comments-item -->
                                        <div class="reviews-comments-item">
                                            <div class="review-comments-avatar">
                                                <img src="assets/Images/User/<%#Eval("uimage") %>" />
                                            </div>
                                            <div class="reviews-comments-item-text">
                                                <h4>
                                                    <a href="#"><%#Eval("uname") %></a>
                                                    <span class="reviews-comments-item-date"><i style="margin-left: 5px;" class="ti-calendar theme-cl"></i>
                                                        <%#Eval("rts") %>
                                                    </span>
                                                    <div class="listing-rating high star-container">
                                                        <%# GetStarIcons(Convert.ToInt32(Eval("rating"))) %>
                                                    </div>
                                                </h4>
                                                <div class="clearfix"></div>
                                                <p><%#Eval("review") %></p>
                                            </div>
                                        </div>
                                        <!--reviews-comments-item end-->
                                    </ItemTemplate>
                                </asp:ListView>
                            </asp:Panel>
                        </div>
                    </div>

                    <!-- Add Review -->
                    <div class="Reveal-block-wrap">
                        <div class="Reveal-block-header">
                            <h4 class="block-title">Add Review</h4>
                            <p class="block-subtitle"><a style="color: #ea1b41;" href="login.aspx">Log in to add review if you haven't yet.</a></p>
                        </div>
                        <div class="Reveal-block-body">
                            <div class="giv-averg-rate">
                                <div class="row">
                                    <div class="col-lg-8 col-md-8 col-sm-12">
                                        <div class="review-form-box form-submit">
                                            <div>
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label>Give Rating</label>
                                                            <ajax:Rating ID="ratingControl" runat="server" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled">
                                                            </ajax:Rating>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <div class="form-group">
                                                            <label for="message">Add Review Comment</label>
                                                            <asp:TextBox ID="txtreview" runat="server" TextMode="MultiLine" Rows="5" class="form-control ht-140"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <div class="form-group">
                                                            <asp:LinkButton ID="SubmitReview" runat="server" OnClick="SubmitReview_Click" Text="Submit Review" class="btn btn-theme">Submit Review</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-12">
                                        <!-- Review Block Wrap -->
                                        <div id="showRating" runat="server" class="Reveal-overview-rating">
                                            <div class="Reveal-overview-rating-box">
                                                <asp:Label ID="lblrating" runat="server" class="Reveal-overview-rating-box-total"><%=avgRatingPercentage %></asp:Label>
                                            </div>
                                            <div class="Reveal-rating-bars">
                                                <div class="Reveal-Reveal-rating-bars-item">
                                                    <span class="Reveal-Reveal-rating-bars-name">Location</span>
                                                    <span class="Reveal-Reveal-rating-bars-inner">
                                                        <span class="Reveal-Reveal-rating-bars-rating mid" data-rating="">
                                                            <span class="Reveal-Reveal-rating-bars-rating-inner" style="width: <%=avgRatingPercentage2 %>%;"></span>
                                                        </span>
                                                        <strong><%=avgRatingPercentage2 %></strong>
                                                        <asp:Label ID="lblpercentage" runat="server" Visible="false"></asp:Label>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Sidebar -->
                <div class="col-lg-4 col-md-12 col-sm-12">
                    <div class="page-sidebar">
                        <!-- Location -->
                        <asp:ListView ID="lv_location" runat="server">
                            <ItemTemplate>
                                <div class="Reveal-block-wrap">
                                    <div class="Reveal-block-header">
                                        <h4 class="block-title">Location</h4>
                                    </div>
                                    <div class="Reveal-block-body">
                                        <div class="map-container">
                                            <%#Eval("placeMap") %>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                        <!-- Ways To Rich -->
                        <div id="TransportNone" runat="server" class="Reveal-side-widget">
                            <div class="Reveal-Reveal-side-widget-header">
                                <h4>Ways To Rich</h4>
                            </div>
                            <div class="Reveal-Reveal-side-widget-body">
                                <ul class="Reveal-service half">
                                    <li id="airway" runat="server">
                                        <div class="Reveal-service-icon">
                                            <a href="#">
                                                <div id="fafaairway" runat="server" class="Reveal-icon-box-round">
                                                    <i class='fa-solid fa-plane'></i>
                                                </div>
                                                <div id="lblairway" runat="server" class="Reveal-icon-box-text">Airway</div>
                                            </a>
                                        </div>
                                    </li>
                                    <li id="train" runat="server">
                                        <div class="Reveal-service-icon">
                                            <a href="#">
                                                <div id="fafatrain" runat="server" class="Reveal-icon-box-round">
                                                    <i class='fa-solid fa-train'></i>
                                                </div>
                                                <div id="lbltrain" runat="server" class="Reveal-icon-box-text">Train</div>
                                            </a>
                                        </div>
                                    </li>
                                    <li id="bus" runat="server">
                                        <div class="Reveal-service-icon">
                                            <a href="#">
                                                <div id="fafabus" runat="server" class="Reveal-icon-box-round">
                                                    <i class='fa-solid fa-bus'></i>
                                                </div>
                                                <div id="lblbus" runat="server" class="Reveal-icon-box-text">Bus</div>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                                <div id="DivtransportList" runat="server" visible="false">
                                    <fieldset style="width: 150px">
                                        <legend></legend>
                                        <asp:CheckBoxList ID="transportList" runat="server" AutoPostBack="True" Enabled="false">
                                            <asp:ListItem Text="Airway" Value="Airway" />
                                            <asp:ListItem Text="Train" Value="Train" />
                                            <asp:ListItem Text="Buses" Value="Buses" />
                                        </asp:CheckBoxList>
                                    </fieldset>
                                </div>
                            </div>
                        </div>

                        <!-- Hotels -->
                        <div id="showHotels" runat="server" class="Reveal-side-widget">
                            <div class="Reveal-Reveal-side-widget-header">
                                <h4>Top Nearby Hotels</h4>
                            </div>
                            <!-- Sponsered Hotels -->
                            <asp:ListView ID="lv_hotels" runat="server">
                                <ItemTemplate>

                                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                                        <div class="kiri p-3">
                                            <div class="icon-container ">
                                                <div class="icon-container_box">
                                                    <img src="assets/Images/HotelImages/<%#Eval("hotel_image") %>" class="img-fluid" alt="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                                            <div>
                                                <span class="badge badge-success">Sponsered</span>
                                                <h3 class="coupon-lead"><%#Eval("hotel_name") %></h3>
                                            </div>
                                        </div>
                                        <div class="kanan d-flex align-items-center">
                                            <div class="info">
                                                <div class="w-100 p-3">
                                                    <a href="hotel.aspx?query=search&&o=<%#Eval("hotel_id") %>" class="btn btn-sm btn-theme m-1">See More
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>

                        <!-- Listing Hour Detail -->
                        <div id="nearbyplaces" runat="server" class="Reveal-side-widget">
                            <div class="Reveal-Reveal-side-widget-header dark red">
                                <div class="Reveal-thumb-details">
                                    <h4>Near By Places</h4>
                                </div>
                                <div class="opening-status">Click To Visit</div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="Reveal-other-body">
                                <ul class="listing-hour-day">
                                    <asp:ListView ID="lv_npright" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <span class="listing-hour-day">
                                                    <img class="" height="40" width="40" src="assets/Images/PlcaeImages/<%#Eval("placeImage1") %>" /></span>
                                                <span class="listing-hour-day ms-4"><a href="place-details.aspx?q=<%#Eval("id") %>&&d=<%#Eval("did") %>"><%#Eval("placeName") %></a></span>
                                            </li>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ============================ Place Detail End ================================== -->
</asp:Content>

