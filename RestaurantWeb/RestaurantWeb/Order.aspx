<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="RestaurantWeb.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       
    <script type="text/javascript" language="javascript">
	function Added(){
	   alert("Order Sucess full !");	
        }
        function NotAdded() {
            alert("Order Error");
        }
</script>
    <style type="text/css">
        .formatAll {
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

        .auto-style5 {
            width: 117px;
        }

        .auto-style6 {
            height: 75px;
            width: 47px;
        }

        .auto-style7 {
            width: 117px;
            height: 75px;
        }
        .order{
            margin-left:100;
            
        }
        .auto-style8 {
            width: 708px;
        }
        .auto-style9 {
            height: 107px;
            width: 47px;
        }
        .auto-style10 {
            width: 117px;
            height: 107px;
        }
        .auto-style11 {
            width: 47px;
        }
        .auto-style12 {
            width: 47px;
            height: 92px;
        }
        .auto-style13 {
            width: 117px;
            height: 92px;
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
            <div class="order">
                <table border="0" cellspacing=50 >
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="https://static.hotdeal.vn/images/1579/1579118/60x60/354654-set-menu-mon-nhat-cho-1-nguoi-tai-yuki-sushi.jpg"
                            Height="574px" Width="577px" />
                    </td>
                    <td class="auto-style8">
                        <table border="0" cellspacing="50">
                            <tr >
                                <td>Your Choose : </td>
                                <td>
                                    <asp:Label ID="Dish_name" runat="server" Text="Dish_name"></asp:Label> </td>
                            </tr>
                            <tr>
                                <td class="auto-style11">Name</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="TextBox3" runat="server" Height="41px" Width="328px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style11">Phone</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="TextBox5" runat="server" Height="41px" Width="328px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style11">Address</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="TextBox6" runat="server" Height="41px" Width="328px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Number Table </td>

                                <td class="auto-style7">
                                    <asp:TextBox ID="TextBox1" runat="server" Height="37px" Width="322px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style12"> Quantity</td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="TextBox2" runat="server" Height="35px" Width="323px"></asp:TextBox></td>
                            </tr>
                             <tr>
                                <td class="auto-style11">Description</td>
                                <td class="auto-style5"> 
                                    <asp:TextBox ID="TextBox4" runat="server" Height="83px" Width="323px" TextMode="MultiLine"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:Button ID="Button2" runat="server" Text="Order" Height="54px" Width="88px" OnClick="Button2_Click" /></td>
                                <td class="auto-style10">
                                    <asp:Button ID="Button1" runat="server" Text="Home" Height="56px" Width="94px" OnClick="Button1_Click" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </div>
        </div>
       
    </form>
</body>
</html>



