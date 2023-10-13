<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="_DoctorYab.Admin.blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Admin/tiny_mce/tiny_mce_src.js" type="text/javascript"></script>
    <script src="Admin/tiny_mce/Full.js" type="text/javascript"></script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">مقالات</h1>
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
                <%--<div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>گروه</label>
                    <asp:DropDownList ID="DrdGrp" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="subject" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="SELECT [id], [subject] FROM [TblBlogGroup] where [isDeleted] &lt;&gt; 1"></asp:SqlDataSource>
                </div>--%>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>عنوان</label>
                    <asp:TextBox ID="TxtSub" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>نویسنده</label>
                    <asp:TextBox ID="TxtWrt" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>تاریخ</label>
                    <asp:TextBox ID="TxtDate" class="form-control" runat="server" MaxLength="20"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>خلاصه مطلب (حداکثر 500 کاراکتر)</label>
                    <asp:TextBox ID="TxtSum" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>متن کامل</label>
                    <asp:TextBox ID="TxtDes" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>کلمات کلیدی</label>
                    <asp:TextBox ID="TxtKey" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>متا دسکریپشن</label>
                    <asp:TextBox ID="TxtMdes" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                <hr />
                 <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>تگ ها</label>
                    <asp:TextBox ID="TxtTag" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                     <span class="help-block">تگ ها باید با خط فاصله (-) از هم جدا شوند. مثال: پزشک درمان تغذیه. حداکثر 50 کاراکتر</span>
                </div>
                <hr />
                <div class="form-group">
                    <label>تصویر</label>
                    <asp:FileUpload ID="Fu1" runat="server" accept="image/*" onchange="loadFile(event)" />
                    <img id="output" style="width: 60px; height: 60px; margin-top: 5px;" /><asp:Image ID="Image1" runat="server" Style="width: 60px; height: 60px; margin-top: 5px;" />
                    <span class="help-block"></span>
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
                <div class="grid-list">
                    <!---------------------------------------------- -->
                    <asp:Button ID="BtnDel" runat="server" CssClass="btn btn-theme BtnDel" Text="حذف ردیفهای انتخاب شده"
                        OnClick="BtnDel_Click"
                        OnClientClick="return confirm('آیا از حذف موارد انتخابی مطمئن هستید؟');" />
                    <!------------------------------------------------  -->
                    <asp:GridView ID="GV" runat="server"
                        AutoGenerateColumns="False" DataKeyNames="id"
                        PageSize="15" PagerStyle-CssClass="pgr" AllowPaging="True"
                        class="table table-striped table-advance table-hover" DataSourceID="SqlAll"
                        OnSelectedIndexChanged="GV_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Row" HeaderText="ردیف" SortExpression="Row"></asp:BoundField>
                            <asp:BoundField DataField="bSubject" HeaderText="عـنوان" SortExpression="bSubject"></asp:BoundField>
                           <%-- <asp:BoundField DataField="subject" HeaderText="گروه" SortExpression="subject"></asp:BoundField>--%>
                            <asp:CommandField ShowSelectButton="True" HeaderText="ویرایش" ControlStyle-CssClass="btn btn-danger btn-xs fa fa-trash-o" SelectText="">
                                <ControlStyle CssClass="btn btn-success btn-xs fa fa-pencil"></ControlStyle>
                            </asp:CommandField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="ChkDelAll" runat="server" OnCheckedChanged="ChkDelAll_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkDelete" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <EmptyDataTemplate>
                            <asp:Label ID="Label8" runat="server" Text="هیچ داده ای برای نمایش موجود نیست"></asp:Label>
                        </EmptyDataTemplate>

                        <PagerStyle CssClass="pgr"></PagerStyle>
                    </asp:GridView>


                    <asp:SqlDataSource ID="SqlAll" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="SELECT dbo.TblBlog.id, ROW_NUMBER() OVER (ORDER BY dbo.TblBlog.id desc) Row, dbo.TblBlog.bSubject, dbo.TblBlog.bGroupFk
                        FROM dbo.TblBlog"></asp:SqlDataSource>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
