<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="configAppointment.aspx.cs" Inherits="DoctorYab.panel.configAppointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>دکتریاب ایران - پنل پزشکان  </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- favicon -->
    <link rel="shortcut icon" href="./assets/images/favicon.ico">
    <!-- Bootstrap -->
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Icons -->
    <link href="./assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css">
    <link href="./assets/css/remixicon.css" rel="stylesheet" type="text/css">

    <!-- Iconscout -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link href="./assets/css/unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
    <link href="/assets/fonts/fontawesome-free-5.15.1-web/css/all.min.css" rel="stylesheet" />
    <!-- Css -->
    <link href="./assets/css/style-rtl.min.css" rel="stylesheet" type="text/css">
    <link href="./assets/css/custom.css" rel="stylesheet" type="text/css">


    <link rel="stylesheet" type="text/css" href="./assets/css/calendar/calendar-blue.css">
    <script src="./assets/js/jquery-3.3.1.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/js/jalali.js"></script>
    <script src="./assets/js/calendar.js"></script>
    <script src="./assets/js/calendar-setup.js"></script>
    <script src="./assets/lang/calendar-dari.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header id="topnav" class="defaultscroll sticky">
            <div class="container-fluid">
                <!-- Logo container-->
                <a class="logo" href="/">
                    <img src="/assets/images/doctoryab_logo.png" height="24" class="logo-light-mode" alt="دکتریاب ایران" />
                    <img src="/assets/images/doctoryab_logo.png" height="24" class="logo-dark-mode" alt="دکتریاب ایران" />
                </a>
                <!-- Logo End -->
            </div>
            <!--end container-->
        </header>
        <!--end header-->


        <section class="bg-dashboard">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-4 col-md-5 col-12">
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDoctor">
                            <ItemTemplate>
                                <div class="rounded shadow overflow-hidden sticky-bar">
                                    <div class="card border-0">
                                        <img src="./assets/images/doctors/profile-bg.jpg" class="img-fluid" alt="">
                                    </div>

                                    <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                        <img src='<%#Eval("dImg") %>' class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        <h5 class="mt-3 mb-1"><%#Eval("dName") %></h5>
                                        <p class="text-muted mb-0"><%#Eval("dWorkTime") %> </p>
                                    </div>

                                    <ul class="list-unstyled sidebar-nav mb-0">
                                        <li class="navbar-item"><a href="/" class="navbar-link"><i class="ri-home-2-line align-middle navbar-icon"></i>صفحه اصلی دکتریاب </a></li>
                                        <li class="navbar-item"><a href="configAppointment.aspx" class="navbar-link"><i class="ri-calendar-check-line align-middle navbar-icon"></i>نوبت‌دهی</a></li>
                                        <li class="navbar-item"><a href="appointments.aspx" class="navbar-link"><i class="ri-timer-line align-middle navbar-icon"></i>نوبت های ثبت شده </a></li>
                                        <li class="navbar-item"><a href="reserves.aspx" class="navbar-link"><i class="ri-pages-line align-middle navbar-icon"></i>رزروها</a></li>
                                        <li class="navbar-item">
                                            <asp:LinkButton ID="btnLogout" runat="server" class="navbar-link" OnClick="btnLogout_Click">خروج  </asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                            SelectCommand="SELECT top(1) [id], [dName], [dImg], [dMobile], [dWorkTime] FROM [TblDoctors] WHERE ([id] = @id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="doctorId" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <!--end col-->

                    <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
                        <h5 class="mb-0 pb-2">زمانبندی نوبت دهی</h5>
                        <div class="rounded shadow mt-4">

                            <div class="p-4">
                                <asp:Panel ID="Panel2" runat="server" DefaultButton="btnSave" class="full-box">
                                    <div class="row">

                                        <asp:Label ID="error" runat="server" Text="متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید" CssClass="lb-err" Visible="false"></asp:Label>
                                        <asp:Label ID="success" runat="server" Text="عملیات با موفقیت انجام شد. " CssClass="lb-suc" Visible="false"></asp:Label>


                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">شیفت </label>
                                                <asp:DropDownList ID="DrdShift" runat="server" class="form-control form-control-md">
                                                    <asp:ListItem Value="1" Text="شیفت اول"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="شیفت دوم"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">تاریخ و ساعت شروع نوبت </label>
                                                <asp:RequiredFieldValidator ID="v2" runat="server" ErrorMessage="فیلد ضروری" ControlToValidate="TxtDate" CssClass="errormsg" ValidationGroup="save"></asp:RequiredFieldValidator>

                                                <asp:TextBox ID="TxtDate" runat="server" class="form-control farsi-input farsi-font" placeholder="تاریخ شمسی و ساعت قالب ۲۴ ساعته"></asp:TextBox>
                                                <div class="input-group-btn">
                                                    <button id="date_btn_two" class="btn btn-info" type="submit">
                                                        <i class="fa fa-calendar"></i>انتخاب تاریخ
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">تعداد </label>
                                                <asp:TextBox ID="TxtNum" runat="server" class="form-control form-control-md" TextMode="Number" MaxLength="2"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">زمان هر ملاقات به دقیقه </label>
                                                <asp:TextBox ID="TxtTime" runat="server" class="form-control form-control-md" Text="" TextMode="Number" MaxLength="2"></asp:TextBox>

                                            </div>
                                        </div>
                                        <!--end col-->


                                    </div>
                                    <!--end row-->

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:LinkButton ID="btnSave" runat="server" class="btn btn-dark btn-rounded mb-4" title="ثبت" OnClick="btnSave_Click">ثبت</asp:LinkButton>

                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </asp:Panel>
                                <!--end form-->
                            </div>
                        </div>

                    </div>
                    <!--end col-->


                    <script type="text/javascript">
                        Calendar.setup({
                            inputField: "TxtDate",   // id of the input field
                            button: "date_btn_two",   // trigger for the calendar (button ID)
                            ifFormat: "%Y/%m/%d %H:%M",       // format of the input field
                            showsTime: true,
                            dateType: 'jalali',
                            timeFormat: "24",
                            weekNumbers: false
                        });
                    </script>


                </div>
                <!--end row-->
            </div>
            <!--end container-->
        </section>


        <footer class="bg-footer py-4">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="text-sm-start text-center">
                            <p class="mb-0">
                                دکتریاب ایران <i class="mdi mdi-heart text-danger"></i><a href=" "
                                    target="_blank" class="text-reset">NGH</a>.
                            </p>
                        </div>
                    </div>
                    <!--end col-->

                    <div class="col-sm-6 mt-4 mt-sm-0">
                        <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                            <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">مقررات</a></li>
                            <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">حریم شخصی</a></li>
                            <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">درباره ما</a></li>
                            <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">ارتباط با ما</a></li>
                        </ul>
                    </div>
                    <!--end col-->
                </div>
                <!--end row-->
            </div>
            <!--end container-->
        </footer>
        <!--end footer-->
        <!-- End -->

        <!-- Back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->

    </form>
</body>
</html>
