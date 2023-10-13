<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="advantage.aspx.cs" Inherits="DoctorYab.Admin.advantage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">خدمات و امتیازات</h1>
            <span>خدمات در صفحه درباره ما، نمایش داده می شوند.</span>
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

               <%-- <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>زبان</label>
                    <asp:DropDownList ID="DrdLng" runat="server" class="form-control">
                        <asp:ListItem Value="1" Text="فارسی"></asp:ListItem>
                        <asp:ListItem Value="2" Text="عربی"></asp:ListItem>
                        <asp:ListItem Value="3" Text="انگلیسی"></asp:ListItem>
                    </asp:DropDownList>
                </div>--%>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>عنوان</label>
                    <asp:TextBox ID="TxtSub" class="form-control" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-12 col-xs-12 pull-right">
                    <label>توضیحات</label>
                    <asp:TextBox ID="TxtDes" class="form-control" runat="server" MaxLength="150"></asp:TextBox>
                </div>
                <hr>
                 <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="ویرایش" class="btn btn-info pull-right" OnClick="btnSave_Click" Enabled="false" />
                </div>
                <hr>


                

                   <!--*****************************************-->
                <div class="grid-list">
                    <!---------------------------------------------- -->
                    <asp:GridView ID="GV" runat="server"
                        AutoGenerateColumns="False" DataKeyNames="id"
                        PageSize="15" PagerStyle-CssClass="pgr" AllowPaging="True"
                        class="table table-striped table-advance table-hover" DataSourceID="SqlAll"
                        OnSelectedIndexChanged="GV_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Row" HeaderText="ردیف" SortExpression="Row"></asp:BoundField>
                            <asp:BoundField DataField="sSubject" HeaderText="عـنوان" SortExpression="sSubject"></asp:BoundField>
                            <asp:BoundField DataField="language" HeaderText="زبان" SortExpression="language"></asp:BoundField>
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
                        SelectCommand="SELECT id, ROW_NUMBER() OVER (ORDER BY id desc) Row, sSubject, 
                        case sLanguage when 1 then N'فارسی' when 2 then N'عربی' when 3 then N'انگلیسی' end as language FROM dbo.TblAdvantage"
                       ></asp:SqlDataSource>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
