<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="city.aspx.cs" Inherits="_DoctorYab.Admin.city" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">شهرها</h1>
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

<%--                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>استان</label>
                    <asp:DropDownList ID="DrdState" runat="server" DataSourceID="SqlState" DataTextField="sName" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlState" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="SELECT [id], [sName] FROM [TblState] WHERE ([sIsDeleted] &lt;&gt; @sIsDeleted) ORDER BY [sName]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="sIsDeleted" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>--%>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>نام شهر - فارسی</label>
                    <asp:TextBox ID="TxtName" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                 <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>نام شهر - عربی</label>
                    <asp:TextBox ID="TxtAr" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                  <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>نام شهر - انگلیسی</label>
                    <asp:TextBox ID="TxtEn" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="ذخـــیره" class="btn btn-info pull-right" OnClick="btnSave_Click" />
                </div>
                <hr>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel-body">
                <div class="grid-list">
                   <%-- <div class="form-group col-md-4 col-xs-12 pull-right">
                        <label>فیلتر بر اساس استان</label>
                        <asp:DropDownList ID="DrdFilter" runat="server" DataSourceID="SqlState" DataTextField="sName" DataValueField="id"
                            CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true">
                            <asp:ListItem Value="0" Text="همه موارد"></asp:ListItem>
                        </asp:DropDownList>
                    </div>--%>
                    <!---------------------------------------------- -->
                    <asp:Button ID="BtnDel" runat="server" CssClass="btn btn-theme BtnDel pull-left" Text="حذف ردیفهای انتخاب شده"
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
                            <asp:BoundField DataField="cName" HeaderText="نام شهر" SortExpression="cName"></asp:BoundField>
                            <asp:BoundField DataField="cEnName" HeaderText="نام شهر انگلیسی" SortExpression="cEnName"></asp:BoundField>
                            <asp:CommandField ShowSelectButton="True" HeaderText="ویرایش" ControlStyle-CssClass="btn btn-danger btn-xs fa fa-trash-o" SelectText="">
                                <ControlStyle CssClass="btn btn-success btn-xs fa fa-pencil"></ControlStyle>
                            </asp:CommandField>
                            <%--                            <asp:CommandField ShowDeleteButton="True" HeaderText="حذف" ControlStyle-CssClass="btn btn-danger btn-xs fa fa-trash-o" DeleteText="">
                                <ControlStyle CssClass="btn btn-danger btn-xs fa fa-trash-o"></ControlStyle>
                            </asp:CommandField>--%>
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
                        SelectCommand="SELECT dbo.TblCity.id, ROW_NUMBER() OVER (ORDER BY dbo.TblCity.id DESC) Row, dbo.TblCity.cName, dbo.TblCity.cEnName, 
                         dbo.TblCity.cIsDeleted  FROM dbo.TblCity  WHERE (dbo.TblCity.cIsDeleted &lt;&gt; 1)">
                    </asp:SqlDataSource>



                    <%-- <asp:SqlDataSource ID="SqlAll" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="selectCity"
                        DeleteCommand="deleteCity" DeleteCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="cityId" Type="Int32" />
                        </DeleteParameters>
                    </asp:SqlDataSource>--%>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
