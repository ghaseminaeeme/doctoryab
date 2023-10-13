<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="addDoctor.aspx.cs" Inherits="_DoctorYab.Admin.addDoctor" %>

<%--<%@ Register Assembly="IR.Web.UI.PersianDatePicker" Namespace="IR.Web.UI.PersianDatePicker" TagPrefix="ir" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Admin/tiny_mce/tiny_mce_src.js" type="text/javascript"></script>
    <script src="Admin/tiny_mce/Full.js" type="text/javascript"></script>
    <!-- for datepicker -->
    <script src="assets/js/PersianDatePicker.js"></script>
    <link href="assets/css/PersianDatePicker.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">ثبت پزشک جدید</h1>
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
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>گروه تخصصی</label>
                    <asp:DropDownList ID="DrdGrp" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="bSubject" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="SELECT [id], [bSubject] FROM [TblBranch] where [bIsDeleted] &lt;&gt; 1"></asp:SqlDataSource>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                     <label>تاریخ انقضا</label>
                    <asp:RequiredFieldValidator ID="v2" runat="server" ErrorMessage="فیلد ضروری" ControlToValidate="TxtDate" CssClass="errormsg" ValidationGroup="save"></asp:RequiredFieldValidator>
                   <%-- <ir:PDatePicker ID="TxtDate" FormatDate="YYYY/MM/DD" class="datepicker form-control" runat="server" Theme="dark"></ir:PDatePicker>--%>
                    <asp:TextBox runat="server" ID="TxtDate" onclick="PersianDatePicker.Show(this);" class="form-control"></asp:TextBox>                   
                </div>
                <hr>
                
               
                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>نام و نام خانوادگی</label>
                    <asp:RequiredFieldValidator ID="v1" runat="server" ErrorMessage="فیلد ضروری" ControlToValidate="TxtName" CssClass="errormsg"  ValidationGroup="save"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtName" class="form-control" runat="server"></asp:TextBox>
                </div> 
                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>نام انگلیسی </label>
                    <asp:TextBox ID="TxtEnName" class="form-control" runat="server"></asp:TextBox>
                </div> 
                 <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>نام عربی </label>
                    <asp:TextBox ID="TxtArName" class="form-control" runat="server"></asp:TextBox>
                </div> 
                <hr>

                 <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>تخصص</label>
                    <asp:TextBox ID="TxtSpe" class="form-control" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>تخصص انگلیسی</label>
                    <asp:TextBox ID="TxtEnSpe" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>تخصص عربی</label>
                    <asp:TextBox ID="TxtArSpe" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>تلفن</label>
                    <asp:TextBox ID="TxtTel" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>موبایل</label>
                    <asp:TextBox ID="TxtMobile" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>

                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>تلگرام</label>
                    <asp:TextBox ID="TxtTlg" class="form-control" runat="server"></asp:TextBox>
                    <p class="help-block">فقط آیدی را وارد کنید. مثال: doctoryab </p>
                </div>
                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>اینستاگرام</label>
                    <asp:TextBox ID="TxtIns" class="form-control" runat="server"></asp:TextBox>
                    <p class="help-block">فقط آیدی را وارد کنید</p>
                </div>
                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>واتساپ</label>
                    <asp:TextBox ID="TxtWts" class="form-control" runat="server"></asp:TextBox>
                    <p class="help-block">آیدی یا شماره موبایل وارد کنید</p>
                </div>
                <hr>

                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>ایمیل</label>
                    <asp:TextBox ID="TxtEmail" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>آپارات</label>
                    <asp:TextBox ID="TxtAparat" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>وب سایت</label>
                    <asp:TextBox ID="TxtWeb" class="form-control" runat="server"></asp:TextBox>
                    <p class="help-block">فقط آدرس سایت را وارد کنید بدون http مثلا: doctoryab.com</p>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>ساعت کاری</label>
                    <asp:TextBox ID="TxtTime" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                <hr />
                 <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>ساعت کاری عربی</label>
                    <asp:TextBox ID="TxtArTime" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                 <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>ساعت کاری انگلیسی</label>
                    <asp:TextBox ID="TxtEnTime" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>نام کاربری</label>
<%--                    <asp:RequiredFieldValidator ID="v3" runat="server" ErrorMessage="فیلد ضروری" ControlToValidate="TxtUser" CssClass="errormsg" ValidationGroup="save"></asp:RequiredFieldValidator>--%>
                    <asp:TextBox ID="TxtUser" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
<%--                    <asp:RegularExpressionValidator ID="v4" CssClass="errormsg" runat="server" ControlToValidate="TxtUser" ValidationGroup="save" ValidationExpression="[a-zA-Z0-9!@&*_.,]{3,30}$"
                        ErrorMessage=" حداقل 6 کاراکتر و فقط شامل اعداد ، حروف انگلیسی و علائم (!@&*_.,) "></asp:RegularExpressionValidator>--%>
                </div>

                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>رمز عبور</label>
<%--                    <asp:RequiredFieldValidator ID="v6" runat="server" ErrorMessage="فیلد ضروری" ControlToValidate="TxtPass" CssClass="errormsg" ValidationGroup="save"></asp:RequiredFieldValidator>--%>
                    <asp:TextBox ID="TxtPass" class="form-control" runat="server" MaxLength="15"></asp:TextBox>
<%--                    <asp:RegularExpressionValidator ID="v5" CssClass="errormsg" runat="server" ControlToValidate="TxtPass" ValidationGroup="save" ValidationExpression="[a-zA-Z0-9!@&*_.,]{1,15}"
                        ErrorMessage=" فقط اعداد ، حروف انگلیسی و علائم (!@&*_.,) "></asp:RegularExpressionValidator>--%>
                </div>

                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>وضعیت</label>
                    <asp:DropDownList ID="DrdStatus" runat="server" class="form-control">
                        <asp:ListItem Value="1" Text="فعال"></asp:ListItem>
                        <asp:ListItem Value="0" Text="غیر فعال"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <hr />

                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>شهر</label>
                    <asp:DropDownList ID="DrdCity" runat="server" class="form-control" DataSourceID="SqlCity" DataTextField="cName" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlCity" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>" 
                        SelectCommand="SELECT [id], [cName] FROM [TblCity] WHERE ([cIsDeleted] &lt;&gt; @cIsDeleted) ORDER BY [cName]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="cIsDeleted" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <hr>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>آدرس</label>
                    <asp:TextBox ID="TxtAdrs" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-xs-12 pull-right">
                    <label>Lat</label>
                    <asp:TextBox ID="TxtLat" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-xs-12 pull-right">
                    <label>Long</label>
                    <asp:TextBox ID="TxtLong" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                 <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>آدرس عربی</label>
                    <asp:TextBox ID="TxtArAdrs" class="form-control" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>آدرس انگلیسی</label>
                    <asp:TextBox ID="TxtEnAdrs" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>کلمات کلیدی </label>
                    <asp:TextBox ID="TxtKey" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>توضیحات</label>
                    <asp:TextBox ID="TxtDes" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>توضیحات عربی</label>
                    <asp:TextBox ID="TxtArDes" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>توضیحات انگلیسی</label>
                    <asp:TextBox ID="TxtEnDes" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>توضیحاتی برای مدیر سایت</label>
                    <asp:TextBox ID="TxtNote" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group">
                    <label>تصویر</label>
                    <asp:FileUpload ID="Fu1" runat="server" accept="image/*" onchange="loadFile(event)" />
                    <img id="output" style="width: 100px; height: 60px; margin-top: 5px;" />
                    <span class="help-block">سایز عکس باید 600 در 540 پیکسل و با رزولوشن 72 باشد</span>
                </div>
                <hr>
                <div class="form-group">
                    <label> آدرس ویدئو</label>
                    <asp:TextBox ID="TxtVideo" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>آگهی ویژه</label>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </div>

                <%--<div class="form-group">
                    <label>ویدئو</label>
                    <asp:RegularExpressionValidator ID="UpLoadValidator" runat="server" ErrorMessage="فرمت فایل ویدئو فقط میتوانید یکی از موارد  mp4, webm, flv و mov باشد"
                        ValidationExpression="(.*?)\.(mov|mp4|flv|webm)$" ControlToValidate="FileUpload1" ValidationGroup="mtbsave" CssClass="errormsg" Display="Dynamic"> </asp:RegularExpressionValidator>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:LinkButton ID="LbVideo" runat="server"></asp:LinkButton>
                    <span class="help-block"></span>
                </div>--%>
                <hr />
                <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="ذخـــیره" class="btn btn-info pull-right" OnClick="btnSave_Click" ValidationGroup="save" />
                </div>
            </div>
        </div>
    </div>

    <!--*****************************************-->
    <script>
        var loadFile = function (event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('output');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        };
    </script>
    <!--*****************************************-->
    <!-- for datepicker -->
    <script src="../js/jquery/jquery.js"></script>

</asp:Content>
