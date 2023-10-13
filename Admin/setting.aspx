<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="setting.aspx.cs" Inherits="_DoctorYab.Admin.setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">درباره ما و اطلاعات تماس</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel-body">
                <div class="alert alert-danger" runat="server" id="err" visible="false">
                    متاسفانه خطایی رخ داده است! لطفا مجددا سعی نمایید.
                </div>
                <div class="alert alert-success" runat="server" id="suc" visible="false">
                    عملیات با موفقیت انجام شد.
                </div>
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>نحوه نمایش لیست آخرین پزشکان در صفحه اول سایت</label>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="" RepeatDirection="Vertical">
                        <asp:ListItem Value="1" Text="به شکل ثابت (پیش فرض)"></asp:ListItem>
                        <asp:ListItem Value="2" Text="به صورتی اسلایدی"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <hr>
                <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="ذخـــیره" class="btn btn-info pull-right" OnClick="btnSave_Click" />
                </div>
                <hr>
            </div>
        </div>
    </div>

</asp:Content>
