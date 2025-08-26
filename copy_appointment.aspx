<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="copy_appointment.aspx.cs" Inherits="DoctorYab.copy_appointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>



            
        <!--            <div class="doctor-appointment" id="appointment">
                <hr class="product-divider">

                <div class="apt-sub">

                    <h6 class="new-price"><i class="fa fa-calendar-check"></i>نوبت دهی</h6>
                    <span>برای رزرو، روی نوبت مورد نظر خود کلیک کنید.</span>
                </div>

                <asp:UpdatePanel ID="upMain" runat="server">
                    <ContentTemplate>

                        <div id="daysContainer">
                            <asp:Repeater ID="rptDays" runat="server" OnItemCommand="rptDays_ItemCommand">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="SelectDay" CommandName="SelectDay" CommandArgument='<%# Eval("AppointmentDate") %>'
                                        CssClass="day-item">
                                            <div>
                                                <%# ConvertToPersianDay(DateTime.Parse(Eval("AppointmentDate").ToString()).DayOfWeek.ToString()) %><br />
                                                <%# ConvertToPersianDate(Eval("AppointmentDate").ToString()) %>
                                            </div>
                                    </asp:LinkButton>
                                </ItemTemplate>

                            </asp:Repeater>
                        </div>

                        <hr />

                        <div id="timesContainer">
                            <asp:Repeater ID="rptTimes" runat="server">
                                <ItemTemplate>
                                    <div class='<%# Convert.ToBoolean(Eval("IsReserved")) ? "time-item reserved" : "time-item" %>'>
                                        <asp:LinkButton ID="btnReserve" runat="server" OnClick="btnReserve_Click">
                                        <%# Eval("AppointmentTime") != DBNull.Value ? ((TimeSpan)Eval("AppointmentTime")).ToString(@"hh\:mm") : "" %>
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="rptDays" EventName="ItemCommand" />
                    </Triggers>
                </asp:UpdatePanel>
                <script>
                    function selectDay(elem) {
                        // حذف active از همه
                        document.querySelectorAll('.day-item').forEach(el => el.classList.remove('active'));

                        // افزودن active به آیتم کلیک‌شده
                        elem.classList.add('active');

                        // ادامه اجرای پست‌بک
                        return true;
                    }

                    // فعال کردن روز اول به صورت پیش‌فرض (فقط برای ظاهرسازی)
                    window.onload = function () {
                        const firstDay = document.querySelector(".day-item");
                        if (firstDay) {
                            firstDay.classList.add("active");
                        }
                    };
                </script>               
            </div> -->





        </div>
    </form>
</body>
</html>
