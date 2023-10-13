<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="doctors.aspx.cs" Inherits="_DoctorYab.Admin.doctors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">لیست پزشکان</h1>
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
                    <label>گروه</label>
                    <asp:DropDownList ID="DrdGrp" runat="server" class="form-control" DataSourceID="SqlGroup" DataTextField="bSubject"
                        DataValueField="id" AppendDataBoundItems="true">
                        <asp:ListItem Value="0" Text="همه موارد"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlGroup" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="SELECT [id], [bSubject] FROM [TblBranch] where [bIsDeleted] &lt;&gt; 1"></asp:SqlDataSource>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>شهر</label>
                    <asp:DropDownList ID="DrdCity" runat="server" class="form-control" DataSourceID="SqlCity" DataTextField="cName" DataValueField="id"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="0" Text="همه موارد"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlCity" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="SELECT [id], [cName] FROM [TblCity] where [cIsDeleted] &lt;&gt; 1"></asp:SqlDataSource>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>نام</label>
                    <asp:TextBox ID="TxtSearch" class="form-control" runat="server" placeholder="جستجوی نام"></asp:TextBox>
                </div>
                <hr>
                <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="جستجو" class="btn btn-info pull-right" OnClick="btnSave_Click" />
                </div>
                <hr>

                <!--*****************************************-->
                <div class="grid-list">
                    <!---------------------------------------------- -->
                    <asp:Button ID="BtnDel" runat="server" CssClass="btn btn-theme BtnDel" Text="حذف ردیفهای انتخاب شده" OnClick="BtnDel_Click"
                        OnClientClick="return confirm('آیا از حذف موارد انتخابی مطمئن هستید؟');" />
                    <!------------------------------------------------  -->
                    <asp:GridView ID="GV" runat="server"
                        AutoGenerateColumns="False" DataKeyNames="id"
                        PageSize="15" PagerStyle-CssClass="pgr" AllowPaging="True"
                        class="table table-striped table-advance table-hover" DataSourceID="SqlAll">
                        <Columns>
                            <asp:BoundField DataField="Row" HeaderText="ردیف" SortExpression="Row"></asp:BoundField>
                            <asp:BoundField DataField="dName" HeaderText="نام" SortExpression="dName"></asp:BoundField>
                            <asp:BoundField DataField="cName" HeaderText="شهر" SortExpression="cName"></asp:BoundField>
                            <asp:BoundField DataField="bSubject" HeaderText="گروه" SortExpression="bSubject"></asp:BoundField>
                            <asp:BoundField DataField="dSpecialty" HeaderText="زیر گروه" SortExpression="dSpecialty"></asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="id" HeaderText="ویرایش" DataNavigateUrlFormatString="editDoctor.aspx?did={0}">
                                <ControlStyle CssClass="btn btn-success btn-xs fa fa-pencil"></ControlStyle>
                            </asp:HyperLinkField>
                            <asp:HyperLinkField Text="تصاویر بیشتر" DataNavigateUrlFields="id" HeaderText="تصاویر بیشتر" DataNavigateUrlFormatString="doctorImages.aspx?did={0}"></asp:HyperLinkField>
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
                        SelectCommand="SELECT dbo.TblDoctors.id, ROW_NUMBER() OVER (ORDER BY dbo.TblDoctors.id desc) Row, dbo.TblDoctors.dName, 
                        dbo.TblDoctors.dMobile, dbo.TblDoctors.dMobile, dbo.TblDoctors.dSpecialty,
                        dbo.TblBranch.bSubject AS bSubject, dbo.TblCity.cName, dbo.TblDoctors.dIsDeleted
                        
                        FROM dbo.TblDoctors 
                        inner JOIN dbo.TblBranch ON (dbo.TblDoctors.dBranchFk = dbo.TblBranch.id)  and (dbo.TblBranch.bIsDeleted  &lt;&gt; 1)
                        inner JOIN dbo.TblCity ON (dbo.TblDoctors.dCityFk = dbo.TblCity.id) AND (dbo.TblCity.cIsDeleted &lt;&gt; 1)
                        WHERE (dbo.TblDoctors.dIsDeleted &lt;&gt; 1) AND ((dbo.TblDoctors.dBranchFk = @branch) OR (@branch = 0) )
                         AND ((dbo.TblDoctors.dCityFk = @city) OR (@city = 0))
                         AND ((dbo.TblDoctors.dName  LIKE N'%' + @search + '%') OR (@search = '0'))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DrdGrp" Name="branch" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="DrdCity" Name="city" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TxtSearch" Name="search" PropertyName="Text" DefaultValue="0" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
