<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="branch.aspx.cs" Inherits="_DoctorYab.Admin.branch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">تخصص ها</h1>
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
                    <label>عنوان</label>
                    <asp:TextBox ID="TxtSub" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                 <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>عنوان انگلیسی</label>
                    <asp:TextBox ID="TxtEnSub" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                 <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>عنوان عربی</label>
                    <asp:TextBox ID="TxtArSub" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>کلمات کلیدی</label>
                    <asp:TextBox ID="TxtKey" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="ذخـــیره" class="btn btn-info pull-right" OnClick="btnSave_Click" />
                </div>
                <hr>

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
                        SelectCommand="SELECT [id], ROW_NUMBER() OVER (ORDER BY id desc) Row, [bSubject] 
                        FROM [TblBranch] WHERE ([bIsDeleted] &lt;&gt; 1) ORDER BY [id] DESC"></asp:SqlDataSource>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
