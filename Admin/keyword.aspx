<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="keyword.aspx.cs" Inherits="_DoctorYab.Admin.keyword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">کلمات کلیدی</h1>
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
                    <asp:TextBox ID="TxtSub" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>تایتل</label>
                    <asp:TextBox ID="TxtTitle" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>کلمات کلیدی</label>
                    <asp:TextBox ID="TxtKey" class="form-control" runat="server" MaxLength="250"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>متا دسکریپشن</label>
                    <asp:TextBox ID="TxtMdes" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                </div>
                <hr />

                <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="ویرایش" class="btn btn-info pull-right" OnClick="btnSave_Click" />
                </div>
                <hr>

                <div class="grid-list">
                    <asp:GridView ID="GV" runat="server"
                        AutoGenerateColumns="False" DataKeyNames="id"
                        PageSize="15" PagerStyle-CssClass="pgr" AllowPaging="True"
                        class="table table-striped table-advance table-hover" DataSourceID="SqlAll"
                        OnSelectedIndexChanged="GV_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Row" HeaderText="ردیف" SortExpression="Row"></asp:BoundField>
                            <asp:BoundField DataField="pPage" HeaderText="عـنوان صفحه" SortExpression="pPage"></asp:BoundField>
                            <asp:BoundField DataField="pTitle" HeaderText="تایتل" SortExpression="pTitle"></asp:BoundField>
                            <asp:CommandField ShowSelectButton="True" HeaderText="ویرایش" ControlStyle-CssClass="btn btn-danger btn-xs fa fa-trash-o" SelectText="">
                                <ControlStyle CssClass="btn btn-success btn-xs fa fa-pencil"></ControlStyle>
                            </asp:CommandField>
                        </Columns>

                        <EmptyDataTemplate>
                            <asp:Label ID="Label8" runat="server" Text="هیچ داده ای برای نمایش موجود نیست"></asp:Label>
                        </EmptyDataTemplate>

                        <PagerStyle CssClass="pgr"></PagerStyle>
                    </asp:GridView>

                    
                    <asp:SqlDataSource ID="SqlAll" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="SELECT [id], ROW_NUMBER() OVER (ORDER BY id desc) Row, [pPage], [pTitle] FROM [TblPage]"></asp:SqlDataSource>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
