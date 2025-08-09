<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DoctorYab.Default" %>

<%--<%@ Register Assembly="DropDownChosen" Namespace="CustomDropDown" TagPrefix="cc1" %>--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="Anil z" name="author" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Favicon Icon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <!-- Animation CSS -->
    <link rel="stylesheet" href="assets/css/animate.css" />
    <!-- Latest Bootstrap min CSS -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap" rel="stylesheet" />
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="assets/css/all.min.css" />
    <link rel="stylesheet" href="assets/css/ionicons.min.css" />
    <link rel="stylesheet" href="assets/css/themify-icons.css" />
    <link rel="stylesheet" href="assets/css/linearicons.css" />
    <link rel="stylesheet" href="assets/css/flaticon.css" />
    <link rel="stylesheet" href="assets/css/simple-line-icons.css" />
    <!--- owl carousel CSS-->
    <link rel="stylesheet" href="assets/owlcarousel/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="assets/owlcarousel/css/owl.theme.css" />
    <link rel="stylesheet" href="assets/owlcarousel/css/owl.theme.default.min.css" />
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="assets/css/magnific-popup.css" />
    <!-- Slick CSS -->
    <link rel="stylesheet" href="assets/css/slick.css" />
    <link rel="stylesheet" href="assets/css/slick-theme.css" />
    <!-- Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/responsive.css?8764564" />
    <!-- RTL CSS -->
    <link rel="stylesheet" href="assets/css/rtl-style.css" />
    <link rel="stylesheet" href="assets/css/custom.css?gfjdjd" />
    <link href="bootstrap-select.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <form>
            <!-- LOADER -->
            <%-- <div class="preloader">
            <div class="lds-ellipsis">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>--%>
            <!-- END LOADER -->
            <header class="header_wrap">
                <div class="top-header d-none d-md-block">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-8">
                                <div class="header_topbar_info">
                                    <div class="header_offer">
                                        <span>سامانه معرفی پزشکان، در ایران</span>
                                    </div>
                                    <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlAbout">
                                        <ItemTemplate>

                                            <div class="download_wrap">
                                                <span class="mr-3">ما را دنبال کنید</span>
                                                <ul class="icon_list text-center text-lg-left">

                                                    <li><a href='http://instagram.com/<%#Eval("aInstagram") %>' title="اینستاگرام"><i class="fab fa-instagram"></i></a></li>
                                                    <li><a href='https://telegram.me/<%#Eval("aTelegram") %>/' title="تلگرام"><i class="fab fa-telegram"></i></a></li>
                                                    <li><a href='https://www.aparat.com/<%#Eval("aAparat") %>' title="آپارات">
                                                        <img src="assets/images/aparat-icon.png" class="aparat-icon" /></a></li>
                                                </ul>
                                            </div>
                                        </ItemTemplate>
                                    </asp:FormView>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-4">
                                <div class="d-flex align-items-center justify-content-center justify-content-md-end">
                                    <div class="lng_dropdown">
                                        <asp:DropDownList ID="DrdLng" runat="server" class="custome_select" AutoPostBack="true" OnSelectedIndexChanged="DrdLng_SelectedIndexChanged">
                                            <asp:ListItem Value='fa' data-image="assets/images/ir.png" data-title="Farsi">فارسی</asp:ListItem>
                                            <asp:ListItem Value='en' data-image="/assets/images/eng.png" data-title="English">English</asp:ListItem>
                                            <asp:ListItem Value='ar' data-image="/assets/images/fn.png" data-title="Arabic">اللغة العربية</asp:ListItem>
                                        </asp:DropDownList>

                                        <!-- <ul class="custome_select">
                                            <li><a><img src="assets/images/ir.png"/><span>فارسی</span></a></li>
                                            <li><a><img src="assets/images/ir.png"/><span>فارسی</span></a></li>
                                        </ul>-->

                                        <!--                                        <select name="countries" class="custome_select">
                                            <option value='fa' data-image="assets/images/ir.png" data-title="Farsi">فارسی</option>
                                            <option value='en' data-image="/assets/images/eng.png" data-title="English">English</option>
                                            <option value='ar' data-image="/assets/images/fn.png" data-title="Arabic">اللغة العربية</option>
                                        </select>-->
                                    </div>
                                    <!-- <div class="ml-3">
                                    <select name="countries" class="custome_select">
                                        <option value='GBR' data-title="GBR">شهر</option>
                                        <option value='USD' data-title="USD">مشهد </option>
                                        <option value='EUR' data-title="EUR">تهران</option>
                                    </select>
                                </div>-->
                                    <div class="ml-3">
                                        <a href='/panel' title="پنل پزشکان"><i class="fa fa-user"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="middle-header dark_skin">
                    <div class="container">
                        <div class="nav_block">
                            <a class="navbar-brand" href="http://doctoryab-iran.com/">
                                <img class="logo_light" src="assets/images/doctoryab_logo.png" alt="دکتریاب ایران" />
                                <img class="logo_dark" src="assets/images/doctoryab_logo.png" alt="دکتریاب ایران" />
                            </a>
                            <div class="contact_phone order-md-last">
                                <%-- <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlAbout">
                                <ItemTemplate><i class="linearicons-phone-wave"></i><span><%#Eval("aMobile") %></span></ItemTemplate>
                            </asp:FormView>--%>
                            </div>

                            <div class="product_search_form">

                                <asp:Panel ID="Panel1" runat="server" DefaultButton="LinkButton1">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
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

                                        <div class="input-group-prepend">
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

                                        <asp:TextBox ID="TxtName" runat="server" class="form-control search-doctor" placeholder="نام پزشک ..."></asp:TextBox>
                                        <asp:LinkButton ID="LinkButton1" runat="server" class="search_btn" OnClick="LinkButton1_Click"><i class="linearicons-magnifier"></i></asp:LinkButton>
                                        <%--<button type="submit" class="search_btn"><i class="linearicons-magnifier"></i></button>--%>
                                    </div>
                                </asp:Panel>
                                <%--                            </form>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom_header light_skin main_menu_uppercase bg_dark mb-4">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-3">
                                <div class="categories_wrap">
                                    <button type="button" data-toggle="collapse" data-target="#navCatContent" aria-expanded="false" class="categories_btn">
                                        <i class="linearicons-menu"></i><span><a href="Doctors.aspx?city=0&branch=0">همه تخصص ها </a></span>
                                    </button>
                                    <div id="navCatContent" class="nav_cat navbar collapse">
                                        <ul>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlSomeBranch">
                                                <ItemTemplate>
                                                    <li><a class="dropdown-item nav-link nav_item" href='Doctors.aspx?city=0&branch=<%#Eval("id") %>'><i class="fa fa-heartbeat"></i><span><%#Eval("bSubject") %></span></a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlSomeBranch" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                                SelectCommand="selectSomeBranch" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            <%-- <li>
                                            <ul class="more_slide_open">
                                                <li><a class="dropdown-item nav-link nav_item" href="Doctors.aspx?city=0&branch=0"><i class="fa fa-heartbeat"></i><span>ارتوپدی</span></a></li>
                                                <li><a class="dropdown-item nav-link nav_item" href="Doctors.aspx?city=0&branch=0"><i class="fa fa-heartbeat"></i><span>ستون فقرات</span></a></li>
                                                <li><a class="dropdown-item nav-link nav_item" href="Doctors.aspx?city=0&branch=0"><i class="fa fa-heartbeat"></i><span>داخلی</span></a></li>
                                                <li><a class="dropdown-item nav-link nav_item" href="Doctors.aspx?city=0&branch=0"><i class="fa fa-heartbeat"></i><span>عمومی و پرستاری</span></a></li>
                                            </ul>
                                        </li>--%>
                                        </ul>
                                        <div class="more_categories"><a href="Doctors.aspx?city=0&branch=0">دسته بندی های بیشتر</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-8 col-sm-6 col-9">
                                <nav class="navbar navbar-expand-lg">
                                    <button class="navbar-toggler side_navbar_toggler" type="button" data-toggle="collapse" data-target="#navbarSidetoggle" aria-expanded="false">
                                        <span class="ion-android-menu"></span>
                                    </button>
                                    <div class="collapse navbar-collapse mobile_side_menu" id="navbarSidetoggle">
                                        <ul class="navbar-nav">
                                            <li><a class="nav-link nav_item" href="/default.aspx">خانه</a></li>
                                            <li><a class="nav-link nav_item" href="/Doctors.aspx?city=0&branch=0">پزشکان</a></li>
                                            <li><a class="nav-link nav_item" href="/blog.aspx">مقالات</a></li>
                                            <li><a class="nav-link nav_item" href="/about.aspx">آشنایی با ما</a></li>
                                            <li><a class="nav-link nav_item" href="/contact.aspx">تماس با ما</a></li>
                                        </ul>
                                    </div>
                                    <%--<ul class="navbar-nav attr-nav align-items-center">
                                        <li><a href="#" class="nav-link"><i class="linearicons-user"></i></a></li>
                                    </ul>--%>
                                    <%-- <div class="pr_search_icon">
                                    <a href="javascript:void(0);" class="nav-link pr_search_trigger"><i class="linearicons-magnifier"></i></a>
                                </div>--%>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <div class="main_content">
                <!-- START SECTION BANNER -->
                <div class="banner_section slide_medium shop_banner_slider staggered-animation-wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9 offset-lg-3">
                                <div id="carouselExampleControls" class="carousel slide light_arrow" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlTopBanner">
                                            <ItemTemplate>
                                                <div class="carousel-item active background_bg" data-img-src='<%#Eval("bImage") %>'>
                                                    <div class="banner_slide_content banner_content_inner">
                                                        <div class="col-lg-8 col-10">
                                                            <div class="banner_content overflow-hidden">
                                                                <h5 class="mb-3 staggered-animation" data-animation="slideInRight" data-animation-delay="0.5s"><%#Eval("bSubTitle") %></h5>
                                                                <h2 class="staggered-animation" data-animation="slideInRight" data-animation-delay="1s"><%#Eval("bSubject") %></h2>
                                                                <a class="btn btn-fill-out rounded-0 staggered-animation text-uppercase" href="<%#Eval("bLink") %>" data-animation="slideInRight" data-animation-delay="1.5s"><%#Eval("bText1") %></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="RepeaterBanner" runat="server" DataSourceID="SqlBanner">
                                            <ItemTemplate>
                                                <div class="carousel-item background_bg" data-img-src='<%#Eval("bImage") %>'>
                                                    <div class="banner_slide_content banner_content_inner">
                                                        <div class="col-lg-8 col-10">
                                                            <div class="banner_content overflow-hidden">
                                                                <h5 class="mb-3 staggered-animation font-weight-light" data-animation="slideInRight" data-animation-delay="0.5s"><%#Eval("bSubTitle") %></h5>
                                                                <h2 class="staggered-animation" data-animation="slideInRight" data-animation-delay="1s"><%#Eval("bSubject") %></h2>
                                                                <a class="btn btn-fill-out rounded-0 staggered-animation text-uppercase" href="<%#Eval("bLink") %>" data-animation="slideInRight" data-animation-delay="1.5s"><%#Eval("bText1") %></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <asp:SqlDataSource ID="SqlTopBanner" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                            SelectCommand="selectTopBanner" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                        <asp:SqlDataSource ID="SqlBanner" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                            SelectCommand="selectBanners" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                    </div>
                                    <ol class="carousel-indicators indicators_style1">
                                        <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleControls" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleControls" data-slide-to="2"></li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END SECTION BANNER -->
                <div class="section small_pb">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="heading_tab_header">
                                    <div class="heading_s2">
                                        <h2>پزشکان ویژه</h2>
                                    </div>
                                    <div class="tab-style2">
                                        <a href="Doctors.aspx?city=0&branch=0">همه پزشکان</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="tab_slider">
                                    <div class="tab-pane fade show active">
                                        <%--                                    <div class="product_slider carousel_slider owl-carousel owl-theme nav_style1" data-loop="true" data-dots="false" data-nav="true" data-margin="20" data-responsive='{"0":{"items": "1"}, "481":{"items": "2"}, "768":{"items": "3"}, "1199":{"items": "4"}}'>--%>
                                        <div class="row shop_container grid">
                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlSpecialDoctors">
                                                <ItemTemplate>
                                                    <%-- <div class="item">--%>
                                                    <div class="col-md-3 col-6">
                                                        <div class="product">
                                                            <span class="sale new"></span>
                                                            <div class="product_img">
                                                                <a href="DoctorDetail.aspx?did=<%#Eval("id") %>">
                                                                    <img src='<%#Eval("dImg") %>' alt="<%#Eval("dName") %>">
                                                                </a>
                                                                &nbsp;
                                                            </div>
                                                            <div class="product_info">
                                                                <h6 class="product_title"><a href="DoctorDetail.aspx?did=<%#Eval("id") %>"><%#Eval("dName") %></a></h6>
                                                                <div class="product_price">
                                                                    <span class="price"><%#Eval("bSubject") %></span>
                                                                    <span class="tel"><a href="tel:<%#Eval("dTel") %>"><%#Eval("dTel") %></a></span>
                                                                </div>
                                                                <div class="rating_wrap">
                                                                    <%#Eval("cName") %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlSpecialDoctors" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                                SelectCommand="selectLastSpecialDoctors" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- START SECTION BANNER -->
                <div class="section pb_20 small_pt">
                    <div class="container-fluid px-2">
                        <div class="row no-gutters">
                            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlAdvers">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="sale_banner">
                                            <a class="hover_effect1" href='<%#Eval("aLink") %>' title="<%#Eval("aSubject") %>">
                                                <img src='<%#Eval("aImage") %>' alt="<%#Eval("aSubject") %>">
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <asp:SqlDataSource ID="SqlAdvers" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                    SelectCommand="SELECT top 3 id, aSubject, aImage, aStateFk, aLink
                        FROM TblAdver where (aStatus &lt;&gt; 0) AND (aLAnguage = 1)  ORDER BY id DESC"></asp:SqlDataSource>
                <!-- END SECTION BANNER -->
                <div class="section">
                    <div class="container">
                        <div class="row">
                            <div class="heading_tab_header">
                                <div class="heading_s2">
                                    <h2>ویدئو ها</h2>
                                </div>
                                <%-- <div class="deal_video">
                                <a href="#">همه ویدئو ها</a>
                            </div>--%>
                            </div>


                            <asp:SqlDataSource ID="SqlVideo" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                SelectCommand="SELECT TOP (8) id, vSrc, vSubject FROM dbo.TblVideo WHERE (vSrc IS NOT NULL) AND (vStatus <> 00) AND (vLAnguage = 1) order by id desc"></asp:SqlDataSource>


                            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlVideo">
                                <ItemTemplate>
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3 video">
                                        <div class="home-video">
                                            <%#Eval("vSrc") %>
                                            <h2><%#Eval("vSubject") %></h2>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>


                <div class="section small_pt pb_20">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="heading_tab_header">
                                    <div class="heading_s2">
                                        <h2>جدیدترین پزشکان</h2>
                                    </div>
                                    <%-- <div class="">
                                    <a href="Doctors.aspx?city=0&branch=0">همه پزشکان</a>
                                </div>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlLastDoctors">
                                    <ItemTemplate>
                                        <div class="col-md-4 pull-right">
                                            <div class="doctor-item ">

                                                <div class="product_img">
                                                    <a href="DoctorDetail.aspx?did=<%#Eval("id") %>">
                                                        <img src='<%#Eval("dImg") %>' alt="<%#Eval("dName") %>">
                                                    </a>
                                                </div>
                                                <div class="product_info">
                                                    <h6 class="product_title"><a href="DoctorDetail.aspx?did=<%#Eval("id") %>"><%#Eval("dName") %></a></h6>
                                                    <div class="product_price">
                                                        <span class="price specialty"><%#Eval("bSubject") %></span>
                                                        <div class="on_sale">
                                                            <span><%#Eval("cName") %></span>
                                                            <%--<span class="tel"><a href="tel:<%#Eval("dTel") %>"><%#Eval("dTel") %></a></span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlLastDoctors" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                    SelectCommand="SELECT dbo.TblDoctors.id, dbo.TblDoctors.dName, dbo.TblDoctors.dBranchFk, dbo.TblDoctors.dImg, dbo.TblDoctors.dCityFk, 
                                dbo.TblDoctors.dIsDeleted, dbo.TblDoctors.dStatus, dbo.TblDoctors.dTel,dbo.TblBranch.bSubject, dbo.TblCity.cName 
                                FROM dbo.TblDoctors INNER JOIN dbo.TblBranch ON dbo.TblDoctors.dBranchFk = dbo.TblBranch.id 
                                INNER JOIN dbo.TblCity ON dbo.TblDoctors.dCityFk = dbo.TblCity.id 
                                WHERE (dbo.TblDoctors.dIsDeleted &lt;&gt; 1) AND (dbo.TblDoctors.dStatus &lt;&gt; 0)
                                order by dbo.TblDoctors.id desc"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- START SECTION SUBSCRIBE NEWSLETTER -->
                <div class="section bg_dark small_pt small_pb">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <div class="heading_s1 mb-md-0 heading_light">
                                    <h3>درخواست ثبت آگهی</h3>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="newsletter_form">
                                    <asp:Panel ID="Panel2" runat="server" DefaultButton="LinkButton2">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="error" runat="server" Text="متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید" CssClass="lb-err" Visible="false"></asp:Label>
                                                <asp:Label ID="success" runat="server" Text="پیام شما با موفقیت ارسال شد " CssClass="lb-suc" Visible="false"></asp:Label>
                                                <asp:TextBox ID="TxtContactName" runat="server" class="form-control rounded-0" placeholder="نام خود را وارد کنید"></asp:TextBox>
                                                <asp:TextBox ID="TxtContactTel" runat="server" class="form-control rounded-0" placeholder="شماره تماس خود را وارد کنید"></asp:TextBox>
                                                <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-fill-out rounded-0" OnClick="LinkButton2_Click">ارسال</asp:LinkButton>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="LinkButton2" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- START SECTION SUBSCRIBE NEWSLETTER -->


            </div>

            <footer class="bg_gray">
                <div class="footer_top small_pt pb_20">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-12 col-sm-12">
                                <div class="widget">
                                    <div class="footer_logo">
                                        <a href="http://doctoryab-iran.com/">
                                            <img src="assets/images/doctoryab_logo.png" alt="دکتریاب ایران" /></a>
                                    </div>
                                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlAbout">
                                        <ItemTemplate>
                                            <p class="mb-3"><%#Eval("aFooterText") %></p>
                                            <ul class="contact_info">
                                                <li>
                                                    <i class="ti-location-pin"></i>
                                                    <p><%#Eval("aAddress") %></p>
                                                </li>
                                                <li>
                                                    <i class="ti-email"></i>
                                                    <a href="mailto:<%#Eval("aEmail") %>"><%#Eval("aEmail") %></a>
                                                </li>
                                                <li>
                                                    <i class="ti-mobile"></i>
                                                    <p><%#Eval("aMobile") %>  <%#Eval("aTel") %></p>
                                                </li>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlAbout" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                        SelectCommand="SELECT * FROM [TblAbout] WHERE ([id] = @id)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-6">
                                <div class="widget">
                                    <h6 class="widget_title">لینک های مفید</h6>
                                    <ul class="widget_links">
                                        <li><a href="/about.aspx">درباره ما</a></li>
                                        <li><a href="#">سؤالات متداول</a></li>
                                        <li><a href="#">قوانین</a></li>
                                        <li><a href="/contact.aspx">تماس با ما</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-6">
                                <div class="widget">
                                    <h6 class="widget_title">حساب کاربری من</h6>
                                    <ul class="widget_links">
                                        <li><a href="#">حساب کاربری</a></li>
                                        <li><a href="#">موقعیت</a></li>
                                        <li><a href="#">تصاویر</a></li>
                                        <li><a href="#">ویدئو</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <div class="widget">
                                    <h6 class="widget_title">اعتبارسنجی</h6>
                                    <ul class="widget_instafeed instafeed_col4">
                                        <li>
                                            <a referrerpolicy='origin' target='_blank' href='https://trustseal.enamad.ir/?id=589687&Code=ByvVNLxAyjVSzbeDsujU4e2cLrUQeN7C'>
                                                <img referrerpolicy='origin' src='https://trustseal.enamad.ir/logo.aspx?id=589687&Code=ByvVNLxAyjVSzbeDsujU4e2cLrUQeN7C' alt='' style='cursor: pointer' code='ByvVNLxAyjVSzbeDsujU4e2cLrUQeN7C'></a>
                                        </li>
                                        <%--   <li><a href="#">
                                        <img src="assets/images/insta_img2.jpg" alt="insta_img"><span class="insta_icon"><i class="ti-instagram"></i></span></a></li>
                                    <li><a href="#">
                                        <img src="assets/images/insta_img3.jpg" alt="insta_img"><span class="insta_icon"><i class="ti-instagram"></i></span></a></li>
                                    <li><a href="#">
                                        <img src="assets/images/insta_img4.jpg" alt="insta_img"><span class="insta_icon"><i class="ti-instagram"></i></span></a></li>
                                    <li><a href="#">
                                        <img src="assets/images/insta_img5.jpg" alt="insta_img"><span class="insta_icon"><i class="ti-instagram"></i></span></a></li>
                                    <li><a href="#">
                                        <img src="assets/images/insta_img6.jpg" alt="insta_img"><span class="insta_icon"><i class="ti-instagram"></i></span></a></li>
                                    <li><a href="#">
                                        <img src="assets/images/insta_img7.jpg" alt="insta_img"><span class="insta_icon"><i class="ti-instagram"></i></span></a></li>
                                    <li><a href="#">
                                        <img src="assets/images/insta_img8.jpg" alt="insta_img"><span class="insta_icon"><i class="ti-instagram"></i></span></a></li>--%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom_footer border-top-tran">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-4">
                                <p class="mb-lg-0 text-center">© 1399 کلیه حقوق این سایت متعلق به دکتریاب ایران است</p>
                            </div>
                            <div class="col-lg-4 order-lg-first">
                                <div class="widget mb-lg-0">
                                    <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlAbout">
                                        <ItemTemplate>
                                            <ul class="social_icons text-center text-lg-left">
                                                <li><a href='https://facebook.com/' class="sc_facebook"><i class="ion-social-facebook"></i></a></li>
                                                <li><a href='https://telegram.me/<%#Eval("aTelegram") %>/' class="sc_twitter"><i class="ion-social-twitter"></i></a></li>
                                                <li><a href='https://www.aparat.com/<%#Eval("aAparat") %>' class="sc_youtube">
                                                    <img src="assets/images/aparat2.png" /></a></li>
                                                <li><a href='http://instagram.com/<%#Eval("aInstagram") %>' class="sc_instagram"><i class="ion-social-instagram-outline"></i></a></li>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:FormView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </footer>

            <a href="#" class="scrollup" style="display: none;"><i class="ion-ios-arrow-up"></i></a>
            <%-- <script src="bootstrap-select.min.js"></script>--%>

            <!-- Latest jQuery -->
            <script src="assets/js/jquery-1.12.4.min.js"></script>
            <!-- popper min js -->
            <script src="assets/js/popper.min.js"></script>
            <!-- Latest compiled and minified Bootstrap -->
            <script src="assets/bootstrap/js/bootstrap.min.js"></script>
            <!-- owl-carousel min js  -->
            <script src="assets/owlcarousel/js/owl.carousel.min.js"></script>
            <!-- magnific-popup min js  -->
            <script src="assets/js/magnific-popup.min.js"></script>
            <!-- waypoints min js  -->
            <script src="assets/js/waypoints.min.js"></script>
            <!-- parallax js  -->
            <script src="assets/js/parallax.js"></script>
            <!-- countdown js  -->
            <script src="assets/js/jquery.countdown.min.js"></script>
            <!-- imagesloaded js -->
            <script src="assets/js/imagesloaded.pkgd.min.js"></script>
            <!-- isotope min js -->
            <script src="assets/js/isotope.min.js"></script>
            <!-- jquery.dd.min js -->
            <script src="assets/js/jquery.dd.min.js"></script>
            <!-- slick js -->
            <script src="assets/js/slick.min.js"></script>
            <!-- elevatezoom js -->
            <script src="assets/js/jquery.elevatezoom.js"></script>
            <!-- scripts js -->
            <script src="assets/js/scripts.js"></script>
        </form>
    </form>
</body>
</html>
