<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="DoctorYab.Doctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlBreadcrumb" CssClass="w-100">
                    <ItemTemplate>
                        <div class="col-md-6 pull-right">
                            <div class="page-title">
                                <h1>پزشکان <%#Eval("branch") %></h1>
                            </div>
                        </div>
                        <div class="col-md-6 bc-path">
                            <ol class="breadcrumb justify-content-md-end">
                                <li class="breadcrumb-item"><a href="/default.aspx">خانه</a></li>
                                <li class="breadcrumb-item active">پزشکان  <%#Eval("searchStr") %></li>
                            </ol>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlBreadcrumb" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                    SelectCommand="selectDoctorBreadcrumb" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="city" QueryStringField="city" Type="Int32" DefaultValue="0" />
                        <asp:QueryStringParameter DefaultValue="0" Name="branch" QueryStringField="branch" Type="Int32" />
                        <%--                        <asp:QueryStringParameter DefaultValue=" " Name="name" QueryStringField="name" Type="String" />--%>
                        <asp:CookieParameter Name="name" CookieName="name" DefaultValue=" " DbType="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <!-- END CONTAINER-->
    </div>

    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <%--<div class="row align-items-center mb-4 pb-1">
                        <div class="col-12">
                            <div class="product_header">
                                <div class="product_header_left">
                                    <div class="custom_select">
                                        <select class="form-control form-control-sm">
                                            <option value="order">مرتب سازی پیش فرض</option>
                                            <option value="popularity">مرتب سازی بر اساس محبوبیت</option>
                                            <option value="date">مرتب سازی بر اساس جدید</option>
                                            <option value="price">مرتب سازی بر اساس قیمت: پایین تا بالا</option>
                                            <option value="price-desc">مرتب سازی بر اساس قیمت: بالا تا پایین </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>

                    <div class="row shop_container grid">
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDoctors">
                            <ItemTemplate>
                                <div class="col-md-4 col-6">
                                    <div class="product">
                                        <div class="product_img">
                                            <a href="DoctorDetail.aspx?did=<%#Eval("id") %>">
                                                <img src='<%#Eval("dImg") %>' alt="<%#Eval("dName") %>">
                                            </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </div>
                                        <div class="product_info">
                                            <h6 class="product_title"><a href="DoctorDetail.aspx?did=<%#Eval("id") %>"><%#Eval("dName") %></a></h6>
                                            <div class="product_price">
                                                <span class="price"><%#Eval("bSubject") %></span>
                                            </div>
                                            <div class="rating_wrap">
                                                <%#Eval("cName") %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <p>هیچ موردی یافت نشد</p>
                            </EmptyDataTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="SqlDoctors" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                            SelectCommand="selectDoctors" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="city" QueryStringField="city" Type="Int32" />
                                <asp:QueryStringParameter DefaultValue="0" Name="branch" QueryStringField="branch" Type="Int32" />
                                <%--<asp:QueryStringParameter DefaultValue=" " Name="name" QueryStringField="name" Type="String" />--%>
                                <asp:CookieParameter Name="name" CookieName="name" DefaultValue=" " DbType="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

                    <div class="row">
                        <div class="col-12">
                            <ul class="pagination mt-3 justify-content-center pagination_style1">
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#"><i class="linearicons-arrow-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 order-lg-first mt-4 pt-2 mt-lg-0 pt-lg-0">
                    <div class="sidebar">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="LinkButton1">
                            <div class="widget">
                                <div class="search_form">
                                    <asp:TextBox ID="TxtName" runat="server" class="form-control" placeholder="جستجوی نام ..."></asp:TextBox>
                                </div>
                            </div>
                            <div class="widget">
                                <div class="custom_select">
                                    <asp:DropDownList ID="DrdCity" runat="server" class="first_null" AppendDataBoundItems="true" DataSourceID="SqlCity" DataTextField="cName" DataValueField="id">
                                        <asp:ListItem Value="0" Text="همه شهرها"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlCity" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>" SelectCommand="SELECT [id], [cName] FROM [TblCity] WHERE ([cIsDeleted] &lt;&gt; @cIsDeleted) ORDER BY [cName]">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="true" Name="cIsDeleted" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="widget">
                                <div class="custom_select">
                                    <asp:DropDownList ID="DrdBranch" runat="server" class="first_null" AppendDataBoundItems="True" DataSourceID="SqlBranch" DataTextField="bSubject" DataValueField="id">
                                        <asp:ListItem Value="0" Text="همه تخصص ها"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlBranch" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>" SelectCommand="SELECT [id], [bSubject] FROM [TblBranch] WHERE ([bIsDeleted] &lt;&gt; @bIsDeleted) ORDER BY [bSubject]">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="true" Name="bIsDeleted" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="widget">
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="btn-filter">فیلتر</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="Button2_Click" CssClass="btn-anti-filter">حذف فیلترها</asp:LinkButton>
                            </div>
                        </asp:Panel>

                        <%--<div class="widget">
                            <h5 class="widget_title">دسته بندی ها</h5>
                            <ul class="widget_categories">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <li><a href="#"><span class="categories_name">قلب و عروق</span></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <li><a href="#"><span class="categories_name">مغز و اعصاب</span><span class="categories_num">(6)</span></a></li>
                                <li><a href="#"><span class="categories_name">دندانپزشکی</span><span class="categories_num">(4)</span></a></li>
                                <li><a href="#"><span class="categories_name">رادیولوژی</span><span class="categories_num">(7)</span></a></li>
                                <li><a href="#"><span class="categories_name">ارتوپدی</span><span class="categories_num">(12)</span></a></li>
                            </ul>
                        </div>--%>

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
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
