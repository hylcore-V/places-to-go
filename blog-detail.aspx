<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="blog-detail.aspx.cs" Inherits="blog_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header-1-d-none {
            display: none !important;
        }
    </style>
    <script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=642ff2c645aa460012e10245&product=inline-share-buttons&source=platform" async="async"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ============================ Page Title Start================================== -->
    <div class="page-title">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h2 class="ipt-title">Blogs And Writings</h2>
                    <span class="ipn-subtitle">See Our Latest Articles & News</span>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================ Page Title End ================================== -->

    <!-- ============================ Agency List Start ================================== -->
    <section>

        <div class="container">

            <!-- row Start -->
            <div class="row">
                <asp:ListView ID="lv_blogs" runat="server">
                    <ItemTemplate>
                        <!-- Blog Detail -->
                        <div class="col-lg-8 col-md-12 col-sm-12 col-12">
                            <div class="blog-details single-post-item format-standard">
                                <div class="post-details">

                                    <div class="post-featured-img">
                                        <img class="img-fluid" src="assets/Images/BlogImages/<%#Eval("blogImage") %>" alt="">
                                    </div>

                                    <div class="post-top-meta">
                                        <ul class="meta-comment-tag">
                                            <li><a href="#"><span class="icons"><i class="ti-user"></i></span>by <%#Eval("blogAuthor") %></a></li>
                                            <li><a href="#"><span class="icons"><i class="ti-comment-alt"></i></span><%#Eval("placeName") %></a></li>
                                        </ul>
                                    </div>
                                    <h2 class="post-title"><%#Eval("blogTitle") %></h2>
                                    <p><%#Eval("blogDescription") %></p>

                                    <div class="post-bottom-meta">
                                        <div class="post-share">
                                            <h4 class="pbm-title">Social Share</h4>
                                            <div class="social-links">
                                                <div class="sharethis-inline-share-buttons"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

                <!-- Single blog Grid -->
                <div class="col-lg-4 col-md-12 col-sm-12 col-12">

                    <!-- Categories -->
                    <div class="single-widgets widget_category">
                        <h4 class="title">Categories</h4>
                        <ul>
                            <asp:ListView ID="lv_blogcat" runat="server">
                                <ItemTemplate>
                                    <li><a href="blog.aspx?category=<%#Eval("cid") %>"><%#Eval("categoryName") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                    </div>

                    <!-- Trending Posts -->
                    <div class="single-widgets widget_thumb_post">
                        <h4 class="title">Trending Posts</h4>
                        <ul>
                            <asp:ListView ID="lv_trendingBlogs" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <span class="left">
                                            <img src="assets/Images/BlogImages/<%#Eval("blogImage") %>" alt="" class="">
                                        </span>
                                        <span class="right">
                                            <a class="feed-title" href="blog-detail.aspx?id=<%#Eval("id") %>"><%#Eval("blogTitle") %></a>
                                            <span class="post-date"><i class="ti-calendar"></i><%#Eval("rts") %></span>
                                        </span>
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                    </div>

                    <!-- Tags Cloud -->
                    <div class="single-widgets widget_tags">
                        <h4 class="title">Tags Cloud</h4>
                        <ul>
                            <asp:ListView ID="lv_blogTags" runat="server">
                                <ItemTemplate>
                                    <li><a href="blog-detail.aspx?id=<%#Eval("id") %>"><%#Eval("categoryName") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                    </div>

                </div>

            </div>
            <!-- /row -->

        </div>

    </section>
    <!-- ============================ Agency List End ================================== -->

</asp:Content>

