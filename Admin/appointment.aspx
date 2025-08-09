<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="DoctorYab.Admin.appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="row">
        <div class="col-md-12">
            <h1 class="page-head-line">تنظیمات نوبت دهی پزشک: 
                <asp:Label ID="LbSubject" runat="server" Text="Label"></asp:Label>

            </h1>
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
                    <label>انتخاب روز هفته</label>
                    <asp:DropDownList ID="drdDays" runat="server" class="form-control form-control-md">
                        <asp:ListItem Value="1" Text="شنبه"></asp:ListItem>
                        <asp:ListItem Value="2" Text="یکشنبه"></asp:ListItem>
                        <asp:ListItem Value="3" Text="دوشنبه"></asp:ListItem>
                        <asp:ListItem Value="4" Text="سه شنبه"></asp:ListItem>
                        <asp:ListItem Value="5" Text="چهارشنبه"></asp:ListItem>
                        <asp:ListItem Value="6" Text="پنجشنبه"></asp:ListItem>
                        <asp:ListItem Value="7" Text="جمعه"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>انتخاب شیفت</label>
                    <asp:DropDownList ID="DrdShift" runat="server" class="form-control form-control-md">
                        <asp:ListItem Value="1" Text="شیفت اول"></asp:ListItem>
                        <asp:ListItem Value="2" Text="شیفت دوم"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <hr />
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>ساعت شروع نوبت</label>
                    <asp:TextBox ID="TxtTime" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>تعداد</label>
                    <asp:TextBox ID="TxtNum" class="form-control" runat="server"></asp:TextBox>
                </div>
                <hr />
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>فاصله بین ملاقات ها به دقیقه</label>
                    <asp:TextBox ID="TxtGap" class="form-control" runat="server" MaxLength="300"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>وضعیت</label>
                    <asp:DropDownList ID="DrdState" runat="server" class="form-control form-control-md">
                        <asp:ListItem Value="1" Text="فعال"></asp:ListItem>
                        <asp:ListItem Value="0" Text="غیر فعال"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <hr />
                <div class="form-group col-md-12">
                    <asp:Button ID="btnSave" runat="server" Text="ذخـــیره" class="btn btn-info pull-right" OnClick="btnSave_Click" />
                </div>
                <hr />
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>


    <div class="row">
        <div class="col-md-12">
            <div class="panel-body">
                <div class="grid-list">

                    <!---------------------------------------------- -->
                    <asp:Button ID="BtnDel" runat="server" CssClass="btn btn-theme BtnDel pull-left" Text="حذف ردیفهای انتخاب شده"
                        OnClick="BtnDel_Click"
                        OnClientClick="return confirm('آیا از حذف موارد انتخابی مطمئن هستید؟');" />
                    <!------------------------------------------------  -->
                    <asp:GridView ID="GV" runat="server"
                        AutoGenerateColumns="False" DataKeyNames="id"
                        PageSize="15" PagerStyle-CssClass="pgr" AllowPaging="True"
                        class="table table-striped table-advance table-hover" DataSourceID="SqlAll">
                        <Columns>
                            <asp:BoundField DataField="dayName" HeaderText="روز" SortExpression="dayName"></asp:BoundField>
                            <asp:BoundField DataField="shift" HeaderText="شیفت" SortExpression="shift"></asp:BoundField>
                            <asp:BoundField DataField="startTime" HeaderText="ساعت شروع" SortExpression="startTime"></asp:BoundField>
                            <asp:BoundField DataField="time" HeaderText="مدت هر نوبت" SortExpression="time"></asp:BoundField>
                            <asp:BoundField DataField="number" HeaderText="تعداد نوبت" SortExpression="number"></asp:BoundField>
                            <asp:BoundField DataField="gap" HeaderText="فاصله بین نوبت" SortExpression="gap"></asp:BoundField>
                            <asp:BoundField DataField="activeDes" HeaderText="وضعیت" SortExpression="activeDes"></asp:BoundField>
                            <%-- <asp:CommandField ShowSelectButton="True" HeaderText="ویرایش" ControlStyle-CssClass="btn btn-danger btn-xs fa fa-trash-o" SelectText="">
                                <ControlStyle CssClass="btn btn-success btn-xs fa fa-pencil"></ControlStyle>
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
                        SelectCommand="SELECT [id], [shift], [day], [startTime], [Time], [number], [doctorId], [code], [active] , [gap] 
                        , case active when 1 then N'فعال' else N'غیر فعال' end as activeDes
                        , case day when 1 then N'شنبه'
                        when 2 then N'یکشنبه'
                        when 3 then N'دوشنبه'
                        when 4 then N'سه شنبه'
                        when 5 then N'چهارشنبه'
                        when 6 then N'پنجشنبه'
                        when 7 then N'جمعه'
                        end as dayName
                        FROM [appointmentConfig] WHERE ([doctorId] = @doctorId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="doctorId" QueryStringField="did" Type="Int32" DefaultValue="" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                </div>

            </div>
        </div>
    </div>

</asp:Content>
