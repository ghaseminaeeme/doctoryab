<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="reserve.aspx.cs" Inherits="DoctorYab.reserve1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                    <ItemTemplate>
                        <div class="col-md-6">
                            <div class="page-title">
                                <h1>رزرو نوبت </h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb justify-content-md-end">
                                <li class="breadcrumb-item"><a href="/">خانه</a></li>
                                <li class="breadcrumb-item"><a href="DoctorDetail.aspx?did=<%#Eval("id") %>"><%#Eval("dName") %></a></li>
                                <li class="breadcrumb-item active">رزرو نوبت </li>
                            </ol>
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
        <!-- END CONTAINER-->
    </div>



    <div class="section pt-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="heading_s1">
                        <h2>رزرو نوبت برای تاریخ 
                            <asp:Label ID="lbDate" runat="server" Text=""></asp:Label>، ساعت 
                            <asp:Label ID="lbTime" runat="server" Text=""></asp:Label>
                        </h2>
                    </div>
                    <p class="leads txt-stronger">لطفا نام و تلفن تماس خود را در فرم زیر وارد کنید و روی دکمه رزرو نوبت کلیک کنید.</p>
                    <div class="field_form">

                        <asp:Panel ID="Panel2" runat="server" DefaultButton="Button1" class="form contact-us-form">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="error" runat="server" Text="متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید" CssClass="lb-err" Visible="false"></asp:Label>
                                    <asp:Label ID="success" runat="server" Text=" " CssClass="lb-suc" Visible="false"></asp:Label>

                                    <div class="form-group">
                                        <label for="username">نام شما *</label>
                                        <asp:TextBox ID="TxtName" runat="server" placeholder="نام و نام خانوادگی خود را وارد کنید" class="form-control" MaxLength="40"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="v1" CssClass="validator" runat="server" ErrorMessage="نام و نام خانوادگی الزامی است." ControlToValidate="TxtName" ValidationGroup="save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="email_1">شماره موبایل * </label>
                                        <asp:TextBox ID="TxtTel" runat="server" placeholder="شماره موبایل خود را وارد کنید " class="form-control" MaxLength="30"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="v2" CssClass="validator" runat="server" ErrorMessage="شماره موبایل الزامی است." ControlToValidate="TxtTel" ValidationGroup="save"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Button ID="Button1" runat="server" Text="رزرو نوبت"
                                        class="btn btn-dark btn-rounded"
                                        OnClientClick="return showConfirmModal(this);"
                                        OnClick="LinkButton1_Click" ValidationGroup="save" />
                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-dark btn-rounded" OnClientClick="return confirm('آیا از ثبت نوبت اطمینان دارید؟')" OnClick="LinkButton1_Click" ValidationGroup="save">رزرو نوبت</asp:LinkButton>--%>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>

                    </div>
                </div>

            </div>
        </div>
    </div>


    <div id="customConfirmModal" class="modal-overlay confirm" style="display: none;">
        <div class="modal-box">
            <h3>تأیید رزرو</h3>
            <p>آیا از ثبت نوبت اطمینان دارید؟</p>
            <div class=" modal-buttons">
                <button type="button" class="btn-yes">بله</button>
                <button type="button" class="btn-no">خیر</button>
            </div>
        </div>
    </div>


<script>
    function showConfirmModal(btn) {
        // اول ولیدیشن ASP.NET اجرا بشه
        if (typeof (Page_ClientValidate) == 'function') {
            if (!Page_ClientValidate('save')) {
                return false;
            }
        }

        // دکمه رو نگه داریم
        window.__postbackBtn = btn;

        // مدال رو نشون بده
        document.getElementById("customConfirmModal").style.display = "flex";

        return false; // جلوی ارسال فرم رو بگیر تا کاربر انتخاب کنه
    }

    // وقتی صفحه لود شد، دکمه‌های مدال رو وصل کن
    window.onload = function () {
        document.querySelector("#customConfirmModal .btn-yes").onclick = function () {
            document.getElementById("customConfirmModal").style.display = "none";
            if (window.__postbackBtn) {
                __doPostBack(window.__postbackBtn.name, ""); // ارسال فرم
            }
        };
        document.querySelector("#customConfirmModal .btn-no").onclick = function () {
            document.getElementById("customConfirmModal").style.display = "none";
        };
    };
</script>





</asp:Content>

