<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RestaurantWeb.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
    <style type="text/css">
        .formatAll {
            padding-left: 50px;
            padding-top: 5px;
            padding-right: 50px;
        }

        .bg {
            padding-top: 5px;
            width:90%;
        }
        .lines{
            padding-left:40%;
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
            </div>
            <div class="bg">
                <img src="./img/BG.jpg" width="1404" />
            </div>
            
        </div>
      
    </form>
</body>
</html>
