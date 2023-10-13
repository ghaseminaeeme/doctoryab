<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DoctorYab.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                        <li class="breadcrumb-item"><a href="/default.aspx">خانه</a></li>
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
                            <asp:Panel ID="Panel2" runat="server" DefaultButton="LinkButton1">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="heading_s1">
                                            <h3>ورود</h3>
                                        </div>
                                        <asp:Label ID="error" runat="server" Text="نام کاربری یا رمز اشتباه است." CssClass="lb-err" Visible="false"></asp:Label>
                                        <asp:Label ID="err" runat="server" Text="" CssClass="lb-err" Visible="false"></asp:Label>
                                        <div class="form-group">
                                            <asp:RequiredFieldValidator ID="v1" runat="server" ErrorMessage="نام کاربری را وارد کنید" CssClass="validation" ControlToValidate="TxtUser"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="TxtUser" runat="server" class="form-control" placeholder="نام کاربری"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:RequiredFieldValidator ID="v2" runat="server" ErrorMessage="کلمه عبور را وارد کنید" CssClass="validation" ControlToValidate="TxtPass"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="TxtPass" runat="server" class="form-control" placeholder="کلمه عبور" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="login_footer form-group">
                                            <a href="/forgotPass.aspx">رمز عبور را فراموش کرده اید؟</a>
                                        </div>
                                        <div class="form-group">
                                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-fill-out btn-block" OnClick="LinkButton1_Click">ورود</asp:LinkButton>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
