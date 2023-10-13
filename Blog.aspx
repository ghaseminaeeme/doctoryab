<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="DoctorYab.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="page-title">
                        <h1>به روز باشید!</h1>
                    </div>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb justify-content-md-end">
                        <li class="breadcrumb-item"><a href="/">خانه</a></li>
                        <li class="breadcrumb-item active"><a href="/blog.aspx">مقالات</a></li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- END CONTAINER-->
    </div>

    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="row blog_thumbs">
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlBlog">
                            <ItemTemplate>
                                <div class="col-12">
                                    <div class="blog_post blog_style2">
                                        <div class="blog_img">
                                            <a href="BlogView.aspx?bid=<%#Eval("id") %>">
                                                <img src='<%#Eval("bPic") %>' alt="<%#Eval("bSubject") %>">
                                            </a>
                                            &nbsp;&nbsp;&nbsp;
                                        </div>
                                        <div class="blog_content bg-white">
                                            <div class="blog_text">
                                                <h6 class="blog_title"><a href='BlogView.aspx?bid=<%#Eval("id") %>'><%#Eval("bSubject") %></a></h6>
                                                <ul class="list_none blog_meta">
                                                    <li><a href="#"><i class="ti-calendar"></i><%#Eval("bDate") %></a></li>
                                                    <li><a href="#"><i class="ti-pencil-alt"></i><%#Eval("bWriter") %></a></li>
                                                </ul>
                                                <%#Eval("bSummery") %>
                                                <a href='BlogView.aspx?bid=<%#Eval("id") %>' class="btn btn-fill-line border-2 btn-xs rounded-0">بیشتر</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlBlog" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                            SelectCommand="SELECT [id], [bSubject], [bSummery], [bDate], [bPic], [bWriter] FROM [TblBlog] ORDER BY [id] DESC"></asp:SqlDataSource>
                    </div>
                    <div class="row">
                        <div class="col-12 mt-2 mt-md-4">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="12" class="pagination">
                                <Fields>
                                    <asp:NumericPagerField ButtonCount="5" CurrentPageLabelCssClass="active" ButtonType="Link" />
                                </Fields>
                            </asp:DataPager>


                            <%--<ul class="pagination pagination_style1 justify-content-center">
                                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1"><i class="linearicons-arrow-left"></i></a></li>
                                <li class="page-item active"><a class="page-link" href="#">1li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#"><i class="linearicons-arrow-right"></i></a></li>
                            </ul>--%>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 order-lg-first mt-4 pt-2 mt-lg-0 pt-lg-0">
                    <div class="sidebar">
                        <div class="widget">
                            <div class="search_form">
                                <form>
                                    <input required="" class="form-control" placeholder="جستجو..." type="text">
                                    <button type="submit" title="Subscribe" class="btn icon_search" name="submit" value="Submit">
                                        <i class="ion-ios-search-strong"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="widget">
                            <h5 class="widget_title">پست های تصادفی</h5>
                            <ul class="widget_recent_post">
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlSideBlog"><ItemTemplate>
                                <li>
                                    <div class="post_footer">
                                        <div class="post_img">
                                            <a href='BlogView.aspx?bid=<%#Eval("id") %>'>
                                                <img src='<%#Eval("bPic") %>' alt="<%#Eval("bSubject") %>"></a>
                                        </div>
                                        <div class="post_content">
                                            <h6><a href='BlogView.aspx?bid=<%#Eval("id") %>'><%#Eval("bSubject") %></a></h6>
                                            <p class="small m-0"><%#Eval("bDate") %></p>
                                        </div>
                                    </div>
                                </li>
                                </ItemTemplate></asp:Repeater>
                                <asp:SqlDataSource ID="SqlSideBlog" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>" 
                                    SelectCommand="SELECT top 3 [id], [bSubject], [bDate], [bPic] FROM [TblBlog] ORDER BY newid()"></asp:SqlDataSource>
                            </ul>
                        </div>

<%--                        <div class="widget">
                            <div class="shop_banner">
                                <div class="banner_img overlay_bg_20">
                                    <img src="assets/images/sidebar_banner_img.jpg" alt="sidebar_banner_img">
                                </div>
                                <div class="shop_bn_content2 text_white">
                                    <h5 class="text-uppercase shop_subtitle">مجموعه جدید</h5>
                                    <h3 class="text-uppercase shop_title">٪30 تخفیف</h3>
                                    <a href="#" class="btn btn-white rounded-0 btn-sm text-uppercase">اکنون خرید کنید</a>
                                </div>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="shop_banner">
                                <div class="banner_img overlay_bg_20">
                                    <img src="assets/images/sidebar_banner_img.jpg" alt="sidebar_banner_img">
                                </div>
                                <div class="shop_bn_content2 text_white">
                                    <h5 class="text-uppercase shop_subtitle">مجموعه جدید</h5>
                                    <h3 class="text-uppercase shop_title">٪30 تخفیف</h3>
                                    <a href="#" class="btn btn-white rounded-0 btn-sm text-uppercase">اکنون خرید کنید</a>
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
