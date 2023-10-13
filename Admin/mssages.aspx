<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="mssages.aspx.cs" Inherits="_DoctorYab.Admin.mssages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">پیام ها</h1>
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
                <asp:Panel ID="Panel1" runat="server" Visible="false">
                    <p>
                        <strong>نام: </strong>
                        <asp:Label ID="lbName" runat="server" Text="Label"></asp:Label>
                    </p>
                    <p>
                        <strong>تلفن: </strong>
                        <asp:Label ID="lbTel" runat="server" Text="Label"></asp:Label>
                    </p>
                    <p>
                        <strong>تاریخ: </strong>
                        <asp:Label ID="lbDate" runat="server" Text="Label"></asp:Label>
                    </p>
                    <p><strong>متن پیام: </strong></p>
                    <asp:Label ID="lbDes" runat="server" Text="Label"></asp:Label>
                    <hr />
                    <div class="form-group col-md-12">
                        <asp:Button ID="btnClose" runat="server" Text="بستن" class="btn btn-info pull-right" OnClick="btnClose_Click" />
                    </div>
                </asp:Panel>

                <!---------------------------------------------- -->
                <asp:Button ID="BtnDel" runat="server" CssClass="btn btn-theme BtnDel" Text="حذف ردیفهای انتخاب شده"
                    OnClick="BtnDel_Click"
                    OnClientClick="return confirm('آیا از حذف موارد انتخابی مطمئن هستید؟');" />
                <!------------------------------------------------  -->
                <asp:GridView ID="GV" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="id,mStatus"
                    PageSize="15" PagerStyle-CssClass="pgr" AllowPaging="True"
                    class="table table-striped table-advance table-hover" DataSourceID="SqlAll"
                    OnSelectedIndexChanged="GV_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="mName" HeaderText="نــام" SortExpression="mName"></asp:BoundField>
                        <asp:BoundField DataField="mSaveDate" HeaderText="تاریـخ" SortExpression="mSaveDate"></asp:BoundField>
                        <asp:CommandField ShowSelectButton="True" HeaderText="نمایش" ControlStyle-CssClass="btn btn-danger btn-xs fa fa-trash-o" SelectText="">
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
                    SelectCommand="SELECT [id], [mName], [mSaveDate], [mStatus]
                FROM [TblMessage] ORDER BY [id] DESC"
                    DeleteCommand="DELETE FROM [TblMessage] WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
