<%@ Page Title="" Language="C#" MasterPageFile="~/panel/PanelSite1.Master" AutoEventWireup="true" CodeBehind="appointmentConfig.aspx.cs" Inherits="DoctorYab.panel.appointmentConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
        <h5 class="mb-0 pb-2">زمانبندی نوبت دهی</h5>
        <div class="rounded shadow mt-4">

            <div class="p-4">
                <asp:Panel ID="Panel2" runat="server" DefaultButton="btnSave" class="full-box">
                    <div class="row">

                        <asp:Label ID="error" runat="server" Text="متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید" CssClass="lb-err" Visible="false"></asp:Label>
                        <asp:Label ID="success" runat="server" Text="عملیات با موفقیت انجام شد. " CssClass="lb-suc" Visible="false"></asp:Label>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">انتخاب روز هفته </label>
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
                        </div>
                        <!--end col-->

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">شیفت </label>
                                <asp:DropDownList ID="DrdShift" runat="server" class="form-control form-control-md">
                                    <asp:ListItem Value="1" Text="شیفت اول"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="شیفت دوم"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!--end col-->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">ساعت شروع نوبت </label>
                                <asp:TextBox ID="TxtTime" runat="server" class="form-control form-control-md" TextMode="Time"></asp:TextBox>
                            </div>
                        </div>
                        <!--end col-->

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">تعداد </label>
                                <asp:TextBox ID="TxtNum" runat="server" class="form-control form-control-md" TextMode="Number" MaxLength="2"></asp:TextBox>
                            </div>
                        </div>
                        <!--end col-->

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">فاصله بین ملاقات ها به دقیقه</label>
                                <asp:TextBox ID="TxtGap" runat="server" class="form-control form-control-md" Text="" TextMode="Number" MaxLength="2"></asp:TextBox>

                            </div>
                        </div>
                        <!--end col-->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">وضعیت</label>
                                <asp:DropDownList ID="DrdState" runat="server" class="form-control form-control-md">
                                    <asp:ListItem Value="1" Text="فعال"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="غیر فعال"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                    </div>
                    <!--end row-->

                    <div class="row">
                        <div class="col-sm-12">
                            <asp:LinkButton ID="btnSave" runat="server" class="btn btn-dark btn-rounded mb-4" title="ثبت" OnClick="btnSave_Click">ثبت</asp:LinkButton>

                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->
                </asp:Panel>
                <!--end form-->
            </div>
        </div>


        <div class="rounded shadow mt-4">
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
                        FROM [appointmentConfig] WHERE ([doctorId] = @doctorId)
                    order by day">
                    <SelectParameters>
                        <asp:SessionParameter Name="doctorId" SessionField="doctorId" Type="Int32" DefaultValue="" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </div>

        </div>
    </div>



</asp:Content>
