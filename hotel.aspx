<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="hotel.aspx.cs" Inherits="hotel" %>

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
    <!-- ============================ Place Details Intro Start================================== -->
    <section class="gray pb-1">
        <div class="container">
            <div class="row">

                <div class="col-lg-5 col-md-8">
                    <asp:ListView ID="lv_hotelIntro" runat="server">
                        <ItemTemplate>
                            <div class="tr-list-detail dark">
                                <div class="tr-list-thumb" style="display:flex;align-items:center;">
                                    <img src="assets/Images/HotelImages/<%# Eval("hotel_image") %>" class="img-responsive" alt="" />
                                </div>
                                <div class="tr-list-info">
                                    
                                    <h4 class="veryfied-list"><%# Eval("hotel_name") %></h4>
                                    <p><i class="ti-location-pin"></i><%# Eval("hotel_address") %></p>
                                </div>
                            </div>


                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </section>
    <!-- ============================ Place Details Intro End ================================== -->

    <!-- ============================ Place Details Description Start ================================== -->
    <section class="gray">
        <div class="container">
            <div class="row">

                <!-- property main detail -->
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <!-- Description -->
                    <asp:ListView ID="lv_hotelDetails" runat="server">
                        <ItemTemplate>
                            <div class="Reveal-block-wrap">

                                <div class="Reveal-block-header">
                                    <h4 class="block-title">Description</h4>
                                </div>

                                <div class="Reveal-block-body">
                                    <p><%#Eval("hotel_details") %></p>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </section>
    <!-- ============================ Property Detail End ================================== -->
</asp:Content>

