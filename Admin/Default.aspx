<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_DoctorYab.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- <div class="row">
        <div class="col-md-12">
            <div class="panel-body">
                <div class="login-page">
                    <div class="alert alert-danger" runat="server" id="err" visible="false">
                        نام کاربری یا رمز عبور اشتباه وارد شده است.
                    </div>

                    <div class="form-group col-md-12 col-xs-12 pull-right">
                        <label>نام کاربری</label>
                        <asp:TextBox ID="TxtUser" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-12 col-xs-12 pull-right">
                        <label>رمز عبور</label>
                        <asp:TextBox ID="TxtPass" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <hr />
                    <div class="form-group col-md-12">
                        <asp:Button ID="btnSave" runat="server" Text="ورود" class="btn btn-info pull-right" OnClick="BtnLogin_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="page-title">
                        <h1>ورود</h1>
                    </div>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb justify-content-md-end">
                        <li class="breadcrumb-item"><a href="#">خانه</a></li>
                        <li class="breadcrumb-item"><a href="#">صفحات</a></li>
                        <li class="breadcrumb-item active">ورود</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- END CONTAINER-->
    </div>

    <div class="login_register_wrap section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-md-10">
                    <div class="login_wrap">
                        <div class="padding_eight_all bg-white">
                            <div class="heading_s1">
                                <h3>ورود</h3>
                            </div>
                            <div>
                                <asp:Panel ID="Panel1" runat="server">
                                    <div class="alert alert-danger" runat="server" id="err" visible="false">
                                        نام کاربری یا رمز عبور اشتباه وارد شده است.
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtUser" class="form-control" runat="server" placeholder="نام کاربری"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TxtPass" class="form-control" runat="server" TextMode="Password" placeholder="کلمه عبور"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                       <%-- <a href="home.aspx" class="btn btn-fill-out btn-block" >ورود</a>--%>
                                        <asp:LinkButton ID="btnSave" runat="server" class="btn btn-fill-out btn-block" OnClick="BtnLogin_Click">ورود</asp:LinkButton>
                                       <%-- <asp:Button ID="btnSave" runat="server" Text="ورود" class="btn btn-fill-out btn-block" OnClick="BtnLogin_Click" />--%>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
