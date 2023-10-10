<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-1-d-none {
            display: none !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ============================ Page Title Start================================== -->
    <div class="image-cover page-title" style="background: url(assets/img/banner-3.jpg) no-repeat;" data-overlay="6">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">

                    <h2 class="ipt-title">Our Articles</h2>
                    <span class="ipn-subtitle text-light">See Our Latest Articles & News</span>

                </div>
            </div>
        </div>
    </div>
    <!-- ============================ Page Title End ================================== -->

    <!-- ============================ Agency List Start ================================== -->
    <section class="gray">

        <div class="container">

            <div class="row">
                <div class="col text-center">
                    <div class="sec-heading center">
                        <h2>Articles</h2>
                        <h3>Our Latest <span class="theme-cl">News</span></h3>
                    </div>
                </div>
            </div>

            <!-- row Start -->
            <div class="row">

                <asp:ListView ID="lv_blogs" runat="server" OnPagePropertiesChanging="lv_blogs_PagePropertiesChanging">
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
            <!-- /row -->

            <!-- Pagination -->
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 DataPager-center">
                <asp:DataPager ID="DataPager" runat="server" PagedControlID="lv_blogs" PageSize="6">
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

    </section>
    <!-- ============================ Agency List End ================================== -->

</asp:Content>

