<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorDetail.aspx.cs"
    Inherits="DoctorYab.DoctorDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                    <ItemTemplate>
                        <div class="col-md-6 pull-right">
                            <div class="page-title">
                                <h4>
                                    <%#Eval("dName") %>
                                </h4>
                            </div>
                        </div>
                        <div class="col-md-6 bc-path">
                            <ol class="breadcrumb justify-content-md-end">
                                <li class="breadcrumb-item"><a href="Default.aspx">خانه</a></li>
                                <li class="breadcrumb-item"><a href="Doctors.aspx?city=<%#Eval(" dCityFk")
                                            %>&branch=<%#Eval("dBranchFk") %>">پزشکان <%#Eval("bSubject") %>
                                    <%#Eval("cName") %></a></li>
                                <li class="breadcrumb-item active"><a href="DoctorDetail.aspx?did=<%#Eval(" id")
                                            %>"><%#Eval("dName") %></a></li>
                            </ol>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
        <!-- END CONTAINER-->
    </div>

    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 mb-4 mb-md-0">
                    <div class="product-image">
                        <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                            <ItemTemplate>
                                <div class="product_img_box">
                                    <img id="product_img" src='<%#Eval("dImg") %>' alt="<%#Eval(" dName") %>" />
                                    <%--<a href="" class="product_img_zoom" title="Zoom">
                                            <span class="linearicons-zoom-in"></span>
                                            </a>--%>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                        <div id="pr_item_gallery" class="product_gallery_item slick_slider" data-slides-to-show="4"
                            data-slides-to-scroll="1" data-infinite="false">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlImages">
                                <ItemTemplate>
                                    <div class="item">
                                        <a href="#" class="product_gallery_item active"
                                            data-image='<%#Eval("dPicture") %>'
                                            data-zoom-image='<%#Eval("dPicture") %>'>
                                            <img src='<%#Eval("dPicture") %>' alt="دکتریاب ایران" />
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlImages" runat="server"
                                ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                SelectCommand="SELECT [id], [dPicture], [dDoctorFk] FROM [TblDoctorImage] WHERE ([dDoctorFk] = @dDoctorFk)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="dDoctorFk" QueryStringField="did"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDoctor">
                                <ItemTemplate>
                                    <div class="item">
                                        <a href="#" class="product_gallery_item" data-image='<%#Eval("dImg") %>'
                                            data-zoom-image='<%#Eval("dImg") %>'>
                                            <img src='<%#Eval("dImg") %>' alt="دکتریاب ایران" />
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <hr />
                    <div class="product-meta">
                        <asp:FormView ID="FormView5" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                            <ItemTemplate>
                                <%#Eval("dVideo") %>

                                <%#Eval("dVideo2") %>

                                <%#Eval("dVideo3") %>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                        <ItemTemplate>
                            <div class="pr_detail">
                                <div class="product_description">
                                    <a href="DoctorDetail.aspx">
                                        <h1 class="product_title">
                                            <%#Eval("dName") %>
                                        </h1>
                                    </a>
                                    <div class="product_price">
                                        <span class="subtitle">
                                            <%#Eval("bSubject") %>
                                        </span>
                                        <p>
                                            <%#Eval("dSpecialty") %>
                                        </p>
                                    </div>

                                    <div class="pr_desc detail-des">
                                        <p>
                                            <%#Eval("dDes") %>
                                        </p>
                                    </div>
                                    <div class="product_sort_info">
                                        <ul>
                                            <li><i class="linearicons-self-timer"></i>ساعت کاری:
                                                    <%#Eval("dWorkTime") %>
                                            </li>
                                            <li><i class="linearicons-telephone"></i>تلفن: <a href="tel:<%#Eval("dTel") %>"><%#Eval("dTel") %></a></li>
                                            <li><i class="linearicons-telephone"></i>موبایل: <a href="tel:<%#Eval("dMobile") %>"><%#Eval("dMobile") %> </a></li>
                                            <li><i class="linearicons-map-marker"></i>آدرس: <%#Eval("cName") %> -
                                                        <%#Eval("dAddress") %>
                                            </li>
                                            <%-- <li><i class="linearicons-envelope"></i>ایمیل: <a
                                                        href='mailto:<%#Eval("dEmail") %>'>
                                                        <%#Eval("dEmail") %>
                                                    </a></li>
                                                    <li><i class="linearicons-network"></i>وب سایت:<a
                                                            href="http://<%#Eval(" dWebsite") %>" target="_blank">
                                                            <%#Eval("dWebsite") %></a> </li>--%>
                                        </ul>
                                    </div>
                                </div>
                                <hr />
                                <div class="cart_extra">
                                    <div class="product_share">
                                        <span>این پزشک را در شبکه های اجتماعی دنبال کنید:</span>

                                        <ul class="social_icons sotialnet">
                                            <li><a href="https://telegram.me/<%#Eval(" dTelegram") %>"
                                                target="_blank" title='تلگرام: <%#Eval("dTelegram") %>'>
                                                <i class="fab fa-telegram"></i>
                                            </a></li>
                                            <li class="aparat"><a href='https://www.aparat.com/<%#Eval(" dAparat") %>'
                                                target="_blank" title='آپارات: <%#Eval("dAparat") %>'>
                                                <img src="/assets/images/aparat3.png" />
                                            </a></li>

                                            <li><a href="https://www.instagram.com/<%#Eval(" dInstagram") %>/"
                                                target="_blank" title='اینستاگرام: <%#Eval("dInstagram") %>'>
                                                <i class="fab fa-instagram"></i>
                                            </a></li>

                                            <li><a href="https://wa.me/98<%#Eval(" dWhatsapp") %>/"
                                                target="_blank" title='واتساپ: <%#Eval("dWhatsapp") %>'>
                                                <i class="fab fa-whatsapp"></i>
                                            </a></li>

                                            <li><a href="mailto:<%#Eval(" dEmail") %>/" title='ایمیل: <%#Eval("dEmail") %>'>
                                                <i class="fa fa-envelope"></i>
                                            </a></li>

                                            <li><a href="http://<%#Eval(" dWebsite") %>/" target="_blank" title='وب سایت: <%#Eval(" dWebsite") %>'>
                                                <i class="fab fa-internet-explorer"></i>
                                            </a></li>
                                        </ul>

                                        <%--<ul class="social_icons sotialnet">
                                            <li><a href="https://telegram.me/<%#Eval(" dTelegram") %>"
                                                target="_blank" title='تلگرام: <%#Eval("dTelegram") %>'>
                                                <img src="/assets/images/telegram.png" />                                                
                                            </a></li>

                                            <li class="aparat"><a href='https://www.aparat.com/<%#Eval(" dAparat") %>'
                                                target="_blank" title='آپارات: <%#Eval("dAparat") %>'>
                                                <img src="/assets/images/aparat3.png" />                                                
                                            </a></li>

                                            <li><a href="https://www.instagram.com/<%#Eval(" dInstagram") %>/"
                                                target="_blank" title='اینستاگرام: <%#Eval("dInstagram") %>'>
                                                <img src="/assets/images/instagram.png" />
                                            </a></li>

                                            <li><a href="https://wa.me/98<%#Eval(" dWhatsapp") %>/" 
                                                target="_blank" title='واتساپ: <%#Eval("dWhatsapp") %>'>
                                                <img src="/assets/images/whatsapp1.png" />
                                            </a></li>

                                            <li><a href="mailto:<%#Eval(" dEmail") %>/"  title='ایمیل: <%#Eval("dEmail") %>'>
                                                <img src="/assets/images/email.png" />
                                            </a></li>

                                            <li><a href="http://<%#Eval(" dWebsite") %>/" target="_blank" title='وب سایت: <%#Eval(" dWebsite") %>'>
                                                <img src="/assets/images/web.png" />
                                            </a></li>
                                        </ul>--%>
                                    </div>
                                </div>
                                <hr />
                                <div class="cart_extra">
                                    <div class="cart_btn map-container">
                                        <h4>مسیریابی</h4>

                                        <iframe 
                                            height="250"
                                            style='border: 0;width:100%;'
                                            src='https://maps.google.com/maps?q=<%#Eval("dLat") %>, <%#Eval("dLong") %> &hl=es;z=14&amp;output=embed'></iframe>
                                    </div>
                                </div>
                                <hr />

                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDoctor" runat="server"
                        ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="selectDoctorDetail" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="did"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="large_divider clearfix"></div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="tab-style3">
                        <%-- <ul class="nav nav-tabs" role="tablist">
                             <li class="nav-item">
                                    <a class="nav-link active" id="Description-tab" data-toggle="tab"
                                        href="#Description" role="tab" aria-controls="Description"
                                        aria-selected="true">ویدئو</a>
                                    </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Additional-info-tab" data-toggle="tab"
                                    href="#Additional-info" role="tab" aria-controls="Additional-info"
                                    aria-selected="true">رزرو نوبت </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Reviews-tab" data-toggle="tab" href="#Reviews"
                                    role="tab" aria-controls="Reviews" aria-selected="false">نظرات </a>
                            </li>
                        </ul>--%>
                        <div class="tab-content shop_info_tab">
                            <%-- <div class="tab-pane fade show" id="Description" role="tabpanel"
                                    aria-labelledby="Description-tab">
                                    <div id="49390446358">
                                        <script type="text/JavaScript"
                                            src="https://www.aparat.com/embed/Xp4vY?data[rnddiv]=49390446358&data[responsive]=yes"></script>
                                    </div>
                            </div>--%>

                            <%--  <div class="tab-pane fade show active" id="Additional-info" role="tabpanel"
                                aria-labelledby="Additional-info-tab">
                                <asp:FormView ID="FormView6" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                                    <ItemTemplate>
                                        <!--  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3214.3820973990887!2d59.55789731462547!3d36.32728830187741!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzbCsDE5JzM4LjIiTiA1OcKwMzMnMzYuMyJF!5e0!3m2!1sen!2s!4v1611515751249!5m2!1sen!2s" width="100%" height="450" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>-->
                                        <iframe
                                            src='https://maps.google.com/maps?q=<%#Eval("dLat") %>, <%#Eval("dLong") %> &hl=es;z=14&amp;output=embed'></iframe>
                                    </ItemTemplate>
                                </asp:FormView>
                            </div>--%>

                            <div class="tab-pane fade show active" id="Additional-info" role="tabpanel"
                                aria-labelledby="Additional-info-tab">

                                <div class="doctor-appointment" id="appointment">
                                    <div class="apt-header">
                                        <h6><i class="fa fa-calendar-check"></i>نوبت‌دهی</h6>
                                        <span>برای رزرو، روی نوبت مورد نظر خود کلیک کنید.</span>
                                    </div>

                                    <!-- Days UpdatePanel -->
                                    <div class="upMain">
                                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                        <ContentTemplate>
                                            <asp:Label ID="err" runat="server" Text="" CssClass="alert alert-danger" Visible="false"></asp:Label>
                                            <!-- Date selector -->
                                            <div class="days-container">
                                                <button type="button" class="nav-btn prev" onclick="scrollDays(-1)" aria-label="روزهای قبلی">
                                                    <i class="fa fa-angle-right"></i>
                                                </button>
                                                <div class="days-wrapper" id="daysCarousel">
                                                    <asp:Repeater ID="rptDays" runat="server"
                                                        OnItemCommand="rptDays_ItemCommand"
                                                        OnItemDataBound="rptDays_ItemDataBound"
                                                        OnItemCreated="rptDays_ItemCreated">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="lnkDay"
                                                                CommandName="SelectDay"
                                                                CssClass="day-item"
                                                                UseSubmitBehavior="false"
                                                                CommandArgument='<%# Eval("AppointmentDate") %>'
                                                                CausesValidation="false">
                                <div>
                                    <span class="day-name">
                                        <%# ConvertToPersianDay(DateTime.Parse(Eval("AppointmentDate").ToString()).DayOfWeek.ToString()) %>
                                    </span>
                                    <span class="day-date">
                                        <%# ConvertToPersianDate(Eval("AppointmentDate").ToString()) %>
                                    </span>
                                </div>
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:HiddenField ID="HiddenSelectedDate" runat="server" />
                                                </div>
                                                <button type="button" class="nav-btn next" onclick="scrollDays(1)" aria-label="روزهای بعدی">
                                                    <i class="fa fa-angle-left"></i>
                                                </button>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                        </div>
                                    <!-- Times UpdatePanel -->
                                    <asp:UpdatePanel ID="upTimes" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="times-header">
                                                <div>
                                                    <i class="fa fa-clock-o"></i>
                                                    <span>نوبت‌های روز: </span>
                                                    <asp:Literal ID="litSelectedDate" runat="server" />
                                                </div>
                                                <div class="legend">
                                                    <span><span class="dot available"></span>قابل رزرو</span>
                                                    <span><span class="dot reserved"></span>رزرو شده</span>
                                                </div>
                                            </div>
                                            <div class="times-wrapper">
                                                <asp:Repeater ID="rptTimes" runat="server" OnItemCommand="rptTimes_ItemCommand">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnReserve" runat="server"
                                                            CssClass='<%# Convert.ToBoolean(Eval("IsReserved")) ? "time-slot reserved" : "time-slot" %>'
                                                            Enabled='<%# !Convert.ToBoolean(Eval("IsReserved")) %>'
                                                            UseSubmitBehavior="false"
                                                            CausesValidation="false"
                                                            CommandName="Reserve"
                                                            CommandArgument='<%# Eval("AppointmentDate") + "|" + ((TimeSpan)Eval("AppointmentTime")).ToString(@"hh\:mm") %>'>
                                                            <%# Eval("AppointmentTime") != DBNull.Value ? ((TimeSpan)Eval("AppointmentTime")).ToString(@"hh\:mm") : "" %>

                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <script>
                                    function scrollDays(direction) {
                                        var el = document.getElementById('daysCarousel');
                                        if (!el) return;
                                        el.scrollBy({ left: direction * 180, behavior: 'smooth' });
                                    }
                                </script>


                            </div>

                            <div class="tab-pane fade" id="Reviews" role="tabpanel" aria-labelledby="Reviews-tab">
                                در حال حاضر نظری برای این پزشک ثبت نشده است.
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="row">

                <div class="col-12">
                    <div class="small_divider"></div>
                    <div class="divider"></div>
                    <div class="medium_divider"></div>
                </div>

<%--                <div class="comments">
                    <asp:FormView ID="FormView6" runat="server" DataSourceID="SqlDoctor"
                        CssClass="w-100">
                        <ItemTemplate>
                            <h5 class="product_tab_title">نظرات در مورد <span>
                                <%#Eval("dName") %>
                            </span></h5>
                        </ItemTemplate>
                    </asp:FormView>
                    <ul class="list_none comment_list mt-4">
                        <li>
                            <div class="comment_img">
                                <img src="assets/images/user.jpg" alt="user1" />
                            </div>
                            <div class="comment_block">
                                <div class="rating_wrap">
                                    <div class="rating">
                                        <div class="product_rate" style="width: 80%"></div>
                                    </div>
                                </div>
                                <p class="customer_meta">
                                    <span class="review_author">ستاره جمشیدی</span>
                                    <span class="comment-date">5 اسفند 1399</span>
                                </p>
                                <div class="description">
                                    <p>
                                        لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با
                                                        استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله
                                                        در ستون و سطرآنچنان که لازم است
                                    </p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>--%>
                <div class="review_form field_form col-md-12">
                    <h5>ارسال نظرات</h5>
                    <div class="row mt-3">
                        <div class="form-group col-12">
                            <asp:TextBox ID="TxtDes" runat="server" TextMode="MultiLine"
                                placeholder="نظر شما *" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="TxtName" runat="server" placeholder="نام خود را وارد کنید *"
                                class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="TxtEmail" runat="server"
                                placeholder="ایمیل یا تلفن خود را وارد کنید *" class="form-control">
                            </asp:TextBox>
                        </div>

                        <div class="form-group col-12">
                            <asp:Button ID="Button1" runat="server" Text="ارسال نظر"
                                class="btn btn-fill-out" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="small_divider"></div>
                    <div class="divider"></div>
                    <div class="medium_divider"></div>
                </div>
            </div>


            <div class="row">
                <div class="col-12">
                    <div class="heading_s1">
                        <h3>سایر پزشکان</h3>
                    </div>
                    <div class="releted_product_slider carousel_slider owl-carousel owl-theme" data-margin="20"
                        data-responsive='{"0":{"items": "1"}, "481":{"items": "2"}, "768":{"items": "3"}, "1199":{"items": "4"}}'>
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlRelated">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="product">
                                        <div class="product_img">
                                            <a href='/DoctorDetail.aspx?did=<%#Eval("id") %>'>
                                                <img src='<%#Eval("dImg") %>' alt="<%#Eval(" dName") %>">
                                            </a>
                                            &nbsp;&nbsp;
                                        </div>
                                        <div class="product_info">
                                            <h2 class="product_title"><a href='/DoctorDetail.aspx?did=<%#Eval("id") %>'>
                                                <%#Eval("dName") %>
                                            </a></h2>
                                            <div class="product_price">
                                                <span class="price">
                                                    <%#Eval("bSubject") %>
                                                </span>
                                            </div>
                                            <div class="rating_wrap">
                                                <%#Eval("cName") %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlRelated" runat="server"
                            ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>" SelectCommand="SELECT top 4 dbo.TblDoctors.id, dbo.TblDoctors.dName, dbo.TblDoctors.dImg, dbo.TblBranch.bSubject, dbo.TblCity.cName, dbo.TblDoctors.dBranchFk 
                            FROM dbo.TblDoctors INNER JOIN dbo.TblBranch ON dbo.TblDoctors.dBranchFk = dbo.TblBranch.id 
                            INNER JOIN dbo.TblCity ON dbo.TblDoctors.dCityFk = dbo.TblCity.id 
                            WHERE (dbo.TblDoctors.dBranchFk = (select dBranchFk FROM TblDoctors where id =  @id)) AND 
                            (dbo.TblDoctors.dCityFk = (select dCityFk FROM TblDoctors where id =  @id))">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id" QueryStringField="did" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
