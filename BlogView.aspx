<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BlogView.aspx.cs" Inherits="DoctorYab.BlogView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb_section bg_gray page-title-mini">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="container">
                    <!-- STRART CONTAINER -->
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="page-title">
                                <h1><%#Eval("bSubject") %></h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb justify-content-md-end">
                                <li class="breadcrumb-item"><a href="#">خانه</a></li>
                                <li class="breadcrumb-item"><a href="/blog.aspx?tag=''">مقالات</a></li>
                                <li class="breadcrumb-item active"><%#Eval("bSubject") %></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
            SelectCommand="SELECT * FROM [TblBlog] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="bid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!-- END CONTAINER-->
    </div>

    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-xl-9">
                    <div class="single_post">
                        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <h2 class="blog_title"><%#Eval("bSubject") %></h2>
                                <ul class="list_none blog_meta">
                                    <li><a href="#"><i class="ti-calendar"></i><%#Eval("bDate") %></a></li>
                                    <li><a href="#"><i class="ti-pencil-alt"></i><%#Eval("bWriter") %></a></li>
                                </ul>
                                <div class="blog_img">
                                    <img src='<%#Eval("bPic") %>' alt="<%#Eval("bSubject") %>">
                                </div>
                                <div class="blog_content">
                                    <div class="blog_text">

                                        <blockquote class="blockquote_style3">
                                            <%#Eval("bSummery") %>
                                        </blockquote>
                                        <%#Eval("bDes") %>
                                        <div class="blog_post_footer">
                                            <div class="row justify-content-between align-items-center">
                                                <div class="col-md-8 mb-3 mb-md-0">
                                                    <div class="tags">
                                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlTag">
                                                            <ItemTemplate>
                                                                <a href="/blog.aspx?tag=<%#Eval("value") %>"><%#Eval("value") %></a>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlTag" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                                            SelectCommand="selectBlogTags" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="bid" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <ul class="social_icons text-md-right">
                                                        <li><a href="#" class="sc_facebook"><i class="ion-social-facebook"></i></a></li>
                                                        <li><a href="#" class="sc_twitter"><i class="ion-social-twitter"></i></a></li>
                                                        <li><a href="#" class="sc_google"><i class="ion-social-googleplus"></i></a></li>
                                                        <li><a href="#" class="sc_youtube"><i class="ion-social-youtube-outline"></i></a></li>
                                                        <li><a href="#" class="sc_instagram"><i class="ion-social-instagram-outline"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>

                    <%--                    <div class="post_navigation bg_gray">
                        <div class="row align-items-center justify-content-between p-4">
                            <div class="col-5">
                                <a href="#">
                                    <div class="post_nav post_nav_prev">
                                        <i class="ti-arrow-left"></i>
                                        <span>لورم ایپسوم متن ساختگی</span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-2">
                                <a href="#" class="post_nav_home">
                                    <i class="ti-layout-grid2"></i>
                                </a>
                            </div>
                            <div class="col-5">
                                <a href="#">
                                    <div class="post_nav post_nav_next">
                                        <i class="ti-arrow-right"></i>
                                        <span>لورم ایپسوم متن ساختگی</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card post_author">
                        <div class="card-body">
                            <div class="author_img">
                                <img src="assets/images/user1.jpg" alt="user1">
                            </div>
                            <div class="author_info">
                                <h6 class="author_name"><a href="#" class="mb-1 d-inline-block">الناز خرمی</a></h6>
                                <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.</p>
                            </div>
                        </div>
                    </div>--%>

                    <div class="related_post">
                        <div class="content_title">
                            <h5>پست های مرتبط</h5>
                        </div>
                        <div class="row">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlLikeBlog">
                                <ItemTemplate>
                                    <div class="col-md-6">
                                        <div class="blog_post blog_style2 box_shadow1">
                                            <div class="blog_img">
                                                <a href="BlogView.aspx">
                                                    <img src='<%#Eval("bPic") %>' alt="<%#Eval("bSubject") %>">
                                                </a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                            </div>
                                            <div class="blog_content bg-white">
                                                <div class="blog_text">
                                                    <h5 class="blog_title"><a href='BlogView.aspx?bid=<%#Eval("id") %>'><%#Eval("bSubject") %></a></h5>
                                                    <ul class="list_none blog_meta">
                                                        <li><a href="#"><i class="ti-calendar"></i><%#Eval("bDate") %></a></li>
                                                        <li><a href="#"><i class="ti-comments"></i><%#Eval("bWriter") %></a></li>
                                                    </ul>
                                                    <%#Eval("bSummery") %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlLikeBlog" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                SelectCommand="SELECT top 2 [id], [bSubject], [bPic], [bWriter], [bSummery], [bDate] FROM [TblBlog] order by newid()"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 order-lg-first mt-4 pt-2 mt-lg-0 pt-lg-0">
                    <div class="sidebar">
                        <div class="widget">
                            <div class="search_form">
                                <form>
                                    <asp:TextBox ID="TxtSearch" runat="server" class="form-control" placeholder="جستجو..."></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn icon_search" OnClick="LinkButton1_Click"><i class="ion-ios-search-strong"></i></asp:LinkButton>
                                </form>
                            </div>
                        </div>
                        <div class="widget">
                            <h5 class="widget_title">پست های اخیر</h5>
                            <ul class="widget_recent_post">
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlLikeBlog">
                                    <ItemTemplate>
                                        <li>
                                            <div class="post_footer">
                                                <div class="post_img">
                                                    <a href="#">
                                                        <img src='<%#Eval("bPic") %>' alt="<%#Eval("bSubject") %>"></a>
                                                </div>
                                                <div class="post_content">
                                                    <h6><a href='BlogView.aspx?bid=<%#Eval("id") %>'><%#Eval("bSubject") %></a></h6>
                                                    <p class="small m-0"><%#Eval("bDate") %></p>
                                                </div>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>

                        <%--                        <div class="widget">
                            <div class="shop_banner">
                                <div class="banner_img overlay_bg_20">
                                    <img src="assets/images/sidebar_banner_img.jpg" alt="sidebar_banner_img">
                                </div>
                                <div class="shop_bn_content2 text_white">
                                    <h5 class="text-uppercase shop_subtitle">دکتر سیما آزادی</h5>
                                    <h3 class="text-uppercase shop_title">قلب و عروق</h3>
                                    <a href="#" class="btn btn-white rounded-0 btn-sm text-uppercase">جزئیات بیشتر</a>
                                </div>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="shop_banner">
                                <div class="banner_img overlay_bg_20">
                                    <img src="assets/images/sidebar_banner_img.jpg" alt="sidebar_banner_img">
                                </div>
                                <div class="shop_bn_content2 text_white">
                                    <h5 class="text-uppercase shop_subtitle">دکتر سیما آزادی</h5>
                                    <h3 class="text-uppercase shop_title">قلب و عروق</h3>
                                    <a href="#" class="btn btn-white rounded-0 btn-sm text-uppercase">جزئیات بیشتر</a>
                                </div>
                            </div>
                        </div>--%>
                        <div class="widget">
                            <h5 class="widget_title">برچسب ها</h5>
                            <div class="tags">
                                <a href="#">عمومی</a>
                                <a href="#">پزشک</a>
                                <a href="#">تخصص</a>
                                <a href="#">جراحی</a>
                                <a href="#">درمان</a>
                                <a href="#">مقاله پزشکی</a>
                                <a href="#">نکات</a>
                                <a href="#">بهداشت</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
