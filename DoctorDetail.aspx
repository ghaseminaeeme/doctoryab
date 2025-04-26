<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorDetail.aspx.cs" Inherits="DoctorYab.DoctorDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                    <ItemTemplate>
                        <div class="col-md-6 pull-right">
                            <div class="page-title">
                                <h4><%#Eval("dName") %></h4>
                            </div>
                        </div>
                        <div class="col-md-6 bc-path">
                            <ol class="breadcrumb justify-content-md-end">
                                <li class="breadcrumb-item"><a href="Default.aspx">خانه</a></li>
                                <li class="breadcrumb-item"><a href="Doctors.aspx?city=<%#Eval("dCityFk") %>&branch=<%#Eval("dBranchFk") %>">پزشکان <%#Eval("bSubject") %> <%#Eval("cName") %></a></li>
                                <li class="breadcrumb-item active"><a href="DoctorDetail.aspx?did=<%#Eval("id") %>"><%#Eval("dName") %></a></li>
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
                                    <img id="product_img" src='<%#Eval("dImg") %>' alt="<%#Eval("dName") %>" />
                                    <%--<a href="" class="product_img_zoom" title="Zoom">
                                        <span class="linearicons-zoom-in"></span>
                                    </a>--%>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                        <div id="pr_item_gallery" class="product_gallery_item slick_slider" data-slides-to-show="4" data-slides-to-scroll="1" data-infinite="false">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlImages">
                                <ItemTemplate>
                                    <div class="item">
                                        <a href="#" class="product_gallery_item active" data-image='<%#Eval("dPicture") %>' data-zoom-image='<%#Eval("dPicture") %>'>
                                            <img src='<%#Eval("dPicture") %>' alt="دکتریاب ایران" />
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlImages" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                                SelectCommand="SELECT [id], [dPicture], [dDoctorFk] FROM [TblDoctorImage] WHERE ([dDoctorFk] = @dDoctorFk)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="dDoctorFk" QueryStringField="did" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDoctor">
                                <ItemTemplate>
                                    <div class="item">
                                        <a href="#" class="product_gallery_item" data-image='<%#Eval("dImg") %>' data-zoom-image='<%#Eval("dImg") %>'>
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
                                <hr />
                                 <%#Eval("dVideo2") %>
                                <hr />
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
                                   <a href="DoctorDetail.aspx"> <h1 class="product_title"><%#Eval("dName") %></h1></a>
                                    <div class="product_price">
                                        <span class="subtitle"><%#Eval("bSubject") %></span>
                                        <p><%#Eval("dSpecialty") %></p>
                                    </div>

                                    <div class="pr_desc detail-des">
                                       <p> <%#Eval("dDes") %></p>
                                    </div>
                                    <div class="product_sort_info">
                                        <ul>
                                            <li><i class="linearicons-self-timer"></i>ساعت کاری: <%#Eval("dWorkTime") %></li>
                                            <li><i class="linearicons-telephone"></i>تلفن: <a href="tel:<%#Eval("dTel") %>"><%#Eval("dTel") %></a></li>
                                            <li><i class="linearicons-telephone"></i>موبایل: <a href="tel:<%#Eval("dMobile") %>"><%#Eval("dMobile") %> </a></li>
                                            <li><i class="linearicons-map-marker"></i>آدرس: <%#Eval("cName") %> - <%#Eval("dAddress") %></li>
<%--                                            <li><i class="linearicons-envelope"></i>ایمیل: <a href='mailto:<%#Eval("dEmail") %>'><%#Eval("dEmail") %></a></li>
                                            <li><i class="linearicons-network"></i>وب سایت:<a href="http://<%#Eval("dWebsite") %>" target="_blank"> <%#Eval("dWebsite") %></a> </li>--%>

                                        </ul>
                                    </div>
                                </div>
                                <hr />
                                <div class="cart_extra">
                                    <div class="product_share">
                                        <span>این پزشک را در شبکه های اجتماعی دنبال کنید:</span>
                                        <ul class="social_icons sotialnet">
                                            <li><a href="https://telegram.me/<%#Eval("dTelegram") %>" target="_blank">
                                                <img src="/assets/images/telegram.png" />
                                                <%#Eval("dTelegram") %></a></li>

                                            <li class="aparat"><a href="https://www.aparat.com/<%#Eval("dAparat") %>" target="_blank">
                                                <img src="/assets/images/aparat3.png" />
                                                <%#Eval("dAparat") %></a></li>

                                            <li><a href="https://www.instagram.com/<%#Eval("dInstagram") %>/" target="_blank">
                                                <img src="/assets/images/instagram.png" />
                                                <%#Eval("dInstagram") %></a></li>

                                            <li><a href="https://wa.me/98<%#Eval("dWhatsapp") %>/" target="_blank">
                                                <img src="/assets/images/whatsapp1.png" />
                                                <%#Eval("dWhatsapp") %></a></li>

                                            <li><a href="mailto:<%#Eval("dEmail") %>/">
                                                <img src="/assets/images/email.png" />
                                                <%#Eval("dEmail") %></a></li>

                                            <li><a href="http://<%#Eval("dWebsite") %>/" target="_blank">
                                                <img src="/assets/images/web.png" />
                                                <%#Eval("dWebsite") %></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <hr />
                                <div class="cart_extra">
                                    <div class="cart_btn">
                                        <h4>مسیریابی</h4>
                                        <a target="_blank" class="btn btn-fill-out btn-addtocart btn-map" href="https://maps.google.com/?q=<%#Eval("dLat") %>, <%#Eval("dLong") %>">نقشه گوگل</a>

                                        <a target="_blank" class="btn btn-addtocart-revers btn-map" href="https://www.waze.com/ul?ll=<%#Eval("dLat") %>,<%#Eval("dLong") %>&navigate=yes&zoom=17" >نقشه ویز</a>

<%--                                        <a target="_blank" class="btn btn-addtocart-revers btn-map" href="https://balad.ir/#15.02/36.33781/59.52464">نقشه بلد</a>
                                        <a target="_blank" class="btn btn-fill-out btn-addtocart btn-map" href="https://neshan.org/maps/">نقشه نشان</a>--%>
<%--                                        <a href="https://api.neshan.org/v2/static?key=service.tvW86Wz9ZwzMQkVUvrsfvVUHG1mVCpLra1xkQcwO&type=MAPTYPE&zoom=ZOOM_LEVEL&center=<%#Eval("dLat") %>,<%#Eval("dLong") %>&width=300&height=300&marker=red">map</a>--%>

                                        <%--  GET:
	https://api.neshan.org/v1/search?term=YOUR_SEARCH_TERM&lat=LATITUDE&lng=LONGITUDE
Headers:
	Api-Key: YOUR_API_KEY    --%>
                                    </div>
                                </div>
                                <hr />

                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="selectDoctorDetail" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="did" Type="Int32" />
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
                        <ul class="nav nav-tabs" role="tablist">
                            <%--                            <li class="nav-item">
                                <a class="nav-link active" id="Description-tab" data-toggle="tab" href="#Description" role="tab" aria-controls="Description" aria-selected="true">ویدئو</a>
                            </li>--%>
                            <li class="nav-item">
                                <a class="nav-link" id="Additional-info-tab" data-toggle="tab" href="#Additional-info" role="tab" aria-controls="Additional-info" aria-selected="true">موقعیت</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Reviews-tab" data-toggle="tab" href="#Reviews" role="tab" aria-controls="Reviews" aria-selected="false">نظرات </a>
                            </li>
                        </ul>
                        <div class="tab-content shop_info_tab">
                            <%-- <div class="tab-pane fade show" id="Description" role="tabpanel" aria-labelledby="Description-tab">
                                <div id="49390446358">
                                    <script type="text/JavaScript" src="https://www.aparat.com/embed/Xp4vY?data[rnddiv]=49390446358&data[responsive]=yes"></script>
                                </div>
                            </div>--%>

                            <div class="tab-pane fade show active" id="Additional-info" role="tabpanel" aria-labelledby="Additional-info-tab">
                                <asp:FormView ID="FormView6" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                                    <ItemTemplate>
                                        <!--  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3214.3820973990887!2d59.55789731462547!3d36.32728830187741!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzbCsDE5JzM4LjIiTiA1OcKwMzMnMzYuMyJF!5e0!3m2!1sen!2s!4v1611515751249!5m2!1sen!2s" width="100%" height="450" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>-->
                                        <iframe src='https://maps.google.com/maps?q=<%#Eval("dLat") %>, <%#Eval("dLong") %> &hl=es;z=14&amp;output=embed'></iframe>
                                    </ItemTemplate>
                                </asp:FormView>
                            </div>
                            <div class="tab-pane fade" id="Reviews" role="tabpanel" aria-labelledby="Reviews-tab">

                                <%--<div class="comments">
                                    <asp:FormView ID="FormView5" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                                        <ItemTemplate>
                                            <h5 class="product_tab_title">نظرات در مورد <span><%#Eval("dName") %></span></h5>
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
                                                    <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است</p>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </div>--%>
                                <div class="review_form field_form">
                                    <h5>ارسال نظرات</h5>
                                    <div class="row mt-3">
                                        <div class="form-group col-12">
                                            <asp:TextBox ID="TxtDes" runat="server" TextMode="MultiLine" placeholder="نظر شما *" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="TxtName" runat="server" placeholder="نام خود را وارد کنید *" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="TxtEmail" runat="server" placeholder="ایمیل یا تلفن خود را وارد کنید *" class="form-control"></asp:TextBox>
                                        </div>

                                        <div class="form-group col-12">
                                            <asp:Button ID="Button1" runat="server" Text="ارسال نظر" class="btn btn-fill-out" />
                                        </div>
                                    </div>
                                </div>
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
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="heading_s1">
                        <h3>سایر پزشکان</h3>
                    </div>
                    <div class="releted_product_slider carousel_slider owl-carousel owl-theme" data-margin="20" data-responsive='{"0":{"items": "1"}, "481":{"items": "2"}, "768":{"items": "3"}, "1199":{"items": "4"}}'>
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlRelated">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="product">
                                        <div class="product_img">
                                            <a href='/DoctorDetail.aspx?did=<%#Eval("id") %>'>
                                                <img src='<%#Eval("dImg") %>' alt="<%#Eval("dName") %>">
                                            </a>
                                            &nbsp;&nbsp;
                                        </div>
                                        <div class="product_info">
                                            <h2 class="product_title"><a href='/DoctorDetail.aspx?did=<%#Eval("id") %>'><%#Eval("dName") %></a></h2>
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
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlRelated" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                            SelectCommand="SELECT top 4 dbo.TblDoctors.id, dbo.TblDoctors.dName, dbo.TblDoctors.dImg, dbo.TblBranch.bSubject, dbo.TblCity.cName, dbo.TblDoctors.dBranchFk 
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
