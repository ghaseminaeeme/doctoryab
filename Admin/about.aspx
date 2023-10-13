<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="_DoctorYab.Admin.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="Admin/tiny_mce/tiny_mce_src.js" type="text/javascript"></script>
    <script src="Admin/tiny_mce/Full.js" type="text/javascript"></script>
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
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>تلفن</label>
                    <asp:TextBox ID="TxtTel" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>موبایل</label>
                    <asp:TextBox ID="TxtMob" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                 <hr>
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>آدرس</label>
                    <asp:TextBox ID="TxtAdrs" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label> آدرس عربی</label>
                    <asp:TextBox ID="TxtArAdrs" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>آدرس انگلیسی</label>
                    <asp:TextBox ID="TxtEnAdrs" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                </div>
                <hr>
                 <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>تلگرام</label>
                    <asp:TextBox ID="TxtTlg" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                    <p class="help-block">فقط آیدی را وارد کنید. مثال: Doctoryab  </p>
                </div>
                <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>اینستاگرام</label>
                    <asp:TextBox ID="TxtIns" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                    <p class="help-block">فقط آیدی را وارد کنید</p>
                </div>
                 <div class="form-group col-md-4 col-xs-12 pull-right">
                    <label>واتس اپ</label>
                    <asp:TextBox ID="TxtWts" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                    <p class="help-block">شماره موبایل مربوط به واتساپ را وارد کنید</p>
                </div>
                <hr>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>ایمیل</label>
                    <asp:TextBox ID="TxtEmail" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>آپارات</label>
                    <asp:TextBox ID="TxtAparat" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>کلمات کلیدی</label>
                    <asp:TextBox ID="TxtKey" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>درباره ما (حداکثر 4000 کاراکتر)</label>
                    <asp:TextBox ID="TxtDes" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr /> 
                 <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>درباره ما عربی(حداکثر 4000 کاراکتر)</label>
                    <asp:TextBox ID="TxtArDes" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr /> 
                 <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>درباره ما انگلیسی(حداکثر 4000 کاراکتر)</label>
                    <asp:TextBox ID="TxtEnDes" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr /> 
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>متن فوتر</label>
                    <asp:TextBox ID="TxtFooter" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                    <span class="help-block">حداکثر 300 حرف می تواند باشد. با احتساب فاصله ها</span>
                </div>
                 <hr />
                 <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>متن فوتر عربی</label>
                    <asp:TextBox ID="TxtArFooter" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                    <span class="help-block">حداکثر 300 حرف می تواند باشد. با احتساب فاصله ها</span>
                </div>
                 <hr />
                 <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>متن فوتر انگلیسی</label>
                    <asp:TextBox ID="TxtEnFooter" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                    <span class="help-block">حداکثر 300 حرف می تواند باشد. با احتساب فاصله ها</span>
                </div>
                <hr />

                <div class="form-group">
                    <label>تصویر 1</label>
                    <asp:FileUpload ID="Fu1" runat="server" accept="image/*" onchange="loadFile(event)" />
                    <img id="output" style="width: 100px; height: 40px; margin-top: 5px;" /><asp:Image ID="Image1" runat="server" Style="width: 100px; height: 40px; margin-top: 5px;" />
                    <span class="help-block">سایز عکس 360 *540 پیکسل </span>
                </div>
                <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="ذخـــیره" class="btn btn-info pull-right" OnClick="btnSave_Click" />
                </div>
                <hr>

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
                </div>
            </div>
        </div>
    
</asp:Content>
