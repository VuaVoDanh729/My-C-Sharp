<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="RestaurantWeb.Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        .formatAll {
            width:90%;
            padding-left: 50px;
            padding-top: 5px;
            padding-right: 50px;
        }

        .bg {
            padding-top: 5px;
        }

        .lines {
            padding-left: 40%;
        }

        .Logo {
            background: #99FF66;
            margin: 0; /* thụt lề bằng 0 */
            padding: 0;
            font-family: 'Times New Roman', Times, serif;
        }

        ul { /* định nghĩa một list / tức danh sách */
            list-style-type: none; /* kiểu của các dòng trong danh sách là không có gì đầu dòng */
            margin: 0; /* thụt lề bằng 0 */
            padding: 0; /* vùng đệm để đẩy thành phần chứa bên trong thụt vô bằng 0 */
            overflow: hidden; /* nếu chữ/ hình bị tràn ra ngoài, cắt bỏ */
            background-color: #333333; /* màu chữ của các thứ chứa trong danh sách là màu đen hơi xám */
        }

        li { /* định nghĩ cho các dòng trong danh sách */
            float: left; /* cho các dòng trôi nổi về góc bên trái như những cục shit trôi sông tấp vào bờ trái */
        }

            li a { /* định nghĩa thẻ a nằm bên trong một thẻ li */
                display: block; /* bình thường thẻ a là thẻ inline, không phải block, giờ cho nó thành block */
                color: white; /* màu chữ sẽ là màu trắng */
                text-align: center; /* canh lề giữa cho chữ, tức thẻ a sẽ là khối chữ nhật, chữ nằm giữa, canh đều hai bên */
                padding: 16px; /* vùng đệm thụt vào 16px rồi mới đến nội dung bên trong a */
                text-decoration: none; /* không trang trí hoa hòe hoa sói, tức rà chuột, kích chuột,... chữ vẫn trắng mà không ra màu khác hay chớp nháy, gạch chân gì cả */
            }

        .Menu {
        }

        .auto-style1 {
            height: 24px;
            width: 444px;
        }
        .auto-style2 {
            width: 444px;
        }
        .auto-style3 {
            margin-right: 0px;
        }
        .auto-style4 {
            width: 444px;
            height: 52px;
        }
        
        .auto-style5 {
            width: 444px;
            height: 91px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="formatAll">
            <div class="Logo">
                <table>
                    <tr>
                        <td>
                            <img src="./img/Logo.jpg" width="150" height="100" /></td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="NgocHoi Restaurant" Font-Size="40pt"></asp:Label></td>
                    </tr>
                </table>
            </div>
            <div class="Menu">
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="Main.aspx?type=MainDish">Main Dish</a></li>
                    <li><a href="Main.aspx?type=Drink">Drink</a></li>
                    <li><a href="Main.aspx?type=Salad">Salad</a></li>
                    <li><a href="Main.aspx?type=Cake">Cake</a></li>
                </ul>
            </div>
            <div class="lines">
                <p>---------------------- Easy pass c# ---------------------------------</p>
            </div >
            <div style="font-size:150%" >
            <table border="0" cellspacing=50  >
                <tr>
                    <td rowspan="5">
                        <asp:Image ID="Image1" runat="server" Height="607px" 
                            Width="613px" /></td>
                    <td class="auto-style1">
                        <asp:Label ID="nameLb" runat="server" ></asp:Label>
                    </td>


                </tr>
                <tr>
                    <td class="auto-style5">Price : 
                        <asp:Label ID="priceLb" runat="server" > </asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='  VND   '> </asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style2">Discount :
                        <asp:Label ID="Label2" runat="server" > </asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server" Columns="8" Width="550px" TextMode="MultiLine" CssClass="auto-style3"  Border="0" Height="359px" Font-Size="X-Large" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="Button1" runat="server" Text="Add" Height="50" Width="100" OnClick="Button1_Click" /></td>
                </tr>

            </table>

                </div>
       

            </div>

        
    </form>
</body>
</html>
