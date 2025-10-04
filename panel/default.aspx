<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DoctorYab.panel._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>ورود به پنل پزشکان </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png"/>
    <!-- Bootstrap -->
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- Icons -->
    <link href="./assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
    <link href="./assets/css/remixicon.css" rel="stylesheet" type="text/css"/>

    <!-- Iconscout -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <link href="./assets/css/unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet"/>
    <!-- Css -->
    <link href="./assets/css/style-rtl.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="back-to-home rounded d-none d-sm-block">
            <a href="index.html" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
        </div>

        <!-- Hero Start -->
        <section class="bg-home d-flex bg-light align-items-center" style="background: url('../assets/images/bg/bg-lines-one.png') center;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-8">
                        <img src="/assets/images/doctoryab_logo.png" height="24" class="mx-auto d-block" alt="">
                        <div class="card login-page bg-white shadow mt-4 rounded border-0">
                            <div class="card-body">
                                <h4 class="text-center">وارد شوید </h4>
                                <asp:Panel ID="Panel1" runat="server" DefaultButton="btnLogin">
                                    <asp:Label ID="error" runat="server" Text="نام کاربری یا رمز عبور اشتباه است." CssClass="lb-err" Visible="false"></asp:Label>
                                    <div action="doctor-dashboard.html" class="login-form mt-4">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">نام کاربری <span class="text-danger">*</span></label>
                                                    <asp:TextBox ID="TxtUser" class="form-control" runat="server" placeholder="نام کاربری"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">رمزعبور<span class="text-danger">*</span></label>
                                                    <asp:TextBox ID="TxtPass" class="form-control" runat="server" TextMode="Password" placeholder="رمزعبور"></asp:TextBox>
                                                </div>
                                            </div>

                                           
                                            <div class="col-lg-12 mb-0">
                                                <div class="d-grid">
                                                    <asp:LinkButton ID="btnLogin" runat="server" class="btn btn-primary" OnClick="btnLogin_Click"> وارد شوید </asp:LinkButton>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <!---->
                    </div>
                    <!--end col-->
                </div>
                <!--end row-->
            </div>
            <!--end container-->
        </section>
        <!--end section-->
        <!-- Hero End -->

        <!-- javascript -->
        <script src="./assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="./assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="./assets/js/app.js"></script>
    </form>
</body>
</html>
