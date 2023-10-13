<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="video.aspx.cs" Inherits="DoctorYab.Admin.video" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">ویدئو ها</h1>
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

                 <div class="form-group col-md-3 col-xs-12 pull-right">
                    <label>زبان</label>
                    <asp:DropDownList ID="DrdLng" runat="server" CssClass="form-control">
                        <asp:ListItem Value="1" Text="فارسی"></asp:ListItem>
                        <asp:ListItem Value="2" Text="عربی"></asp:ListItem>
                        <asp:ListItem Value="3" Text="انگلیسی"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>استان</label>
                    <asp:DropDownList ID="DrdState" runat="server" DataSourceID="SqlState" DataTextField="sName" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlState" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                        SelectCommand="SELECT [id], [SName] FROM [TblState] WHERE ([sIsDeleted] &lt;&gt; @sIsDeleted) ORDER BY [sName]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="sIsDeleted" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <hr />
                <div class="form-group">
                    <label>عنوان</label>
                    <asp:TextBox ID="TxtSub" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group">
                    <label>آدرس ویدئو (کد اسکریپت)</label> <a href="../assets/images/video.jpg" target="_blank">راهنما</a>
                    <asp:TextBox ID="TxtVideo" class="form-control" runat="server"></asp:TextBox>
                    <div id="videobox" runat="server" style="width:250px"></div>
                </div>
                <hr />
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>وضعیت نمایش</label>
                    <asp:DropDownList ID="DrdActive" runat="server" CssClass="form-control">
                        <asp:ListItem Value="1" Text="فعال"></asp:ListItem>
                        <asp:ListItem Value="0" Text="غیر فعال"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                
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
                            <asp:BoundField DataField="vSubject" HeaderText="عنوان" SortExpression="vSubject"></asp:BoundField>
                            <%--<asp:TemplateField>
                                <HeaderTemplate>ویدئو </HeaderTemplate>
                                <ItemTemplate>
                                  <%# Eval("vSrc") %>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:BoundField DataField="sName" HeaderText="استان" SortExpression="sName"></asp:BoundField>
                            <asp:BoundField DataField="status" HeaderText="وضعیت" SortExpression="status"></asp:BoundField>
                            <asp:BoundField DataField="language" HeaderText="زبان" SortExpression="language"></asp:BoundField>
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
                        SelectCommand="SELECT TblVideo.id, ROW_NUMBER() OVER (ORDER BY TblVideo.id DESC) Row, TblVideo.vSrc, TblVideo.vSubject, 
                        case TblVideo.vStatus when 0 then N'غیر فعال' else N'فعال' end as status, TblState.sName ,
                        case [vLanguage] when 1 then N'فارسی'  when 2 then N'عربی'  when 3 then N'انگلیسی' end as language
                        FROM TblVideo left join TblState on TblVideo.vStateFk = TblState.id  ORDER BY TblVideo.id DESC"></asp:SqlDataSource>


                </div>

            </div>
        </div>
    </div>
</asp:Content>
