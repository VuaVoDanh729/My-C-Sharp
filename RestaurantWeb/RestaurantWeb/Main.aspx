<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="RestaurantWeb.Main" %>

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
         .lines{
            padding-left:40%;
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
            <div>
                <div>
                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" Height="350px" ImageUrl='<%# Eval("avatar") %>'
                                            Width="345px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="nameLb" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="priceLb" runat="server" Text='<%# Eval("price") %>'> </asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text='  VND   '> </asp:Label>
                                           
                                    </td>
                                </tr>
                                <tr>
                                    <td><asp:Button ID="btnDetail" runat="server" Text="Detail" Width="82px" CommandName="Detail"/> 
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" Width="82px" CommandName="Add" /> </td>
                                </tr>
  
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <br />
                <div>
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                        <asp:LinkButton ID="btnPage" Style="padding: 1px 3px; margin: 1px; background: #ccc; border: solid 1px #666; font: 8pt tahoma;"
                            CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server"><%# Container.DataItem %>
                        </asp:LinkButton>
                    </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
       
           
    </form>
</body>
</html>



