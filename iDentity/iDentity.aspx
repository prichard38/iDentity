<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iDentity.aspx.cs" Inherits="iDentity.iDentity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="iDentify.css" />
    <style type="text/css">
        .auto-style1 {
            width: 340px;
            height: 340px;
        }
    </style>

    <script>
        // Show-Hide Divs
        function SHD() {
            var ageSelectValue = document.getElementById("form1").ageSelector.value;
            var div1 = document.getElementById("randAge");
            var div2 = document.getElementById("setAge");
            var div3 = document.getElementById("ageRange");
            
            if (ageSelectValue == 0) {
                div1.style.display = "inline-block";
                div2.style.display = "none";
                div3.style.display = "none";
            }
            if (ageSelectValue == 1) {
                div1.style.display = "none";
                div2.style.display = "inline-block";
                div3.style.display = "none";
            }
            if (ageSelectValue == 2) {
                div1.style.display = "none";
                div2.style.display = "none";
                div3.style.display = "inline-block";
            }

        }

    </script>

</head>
<body onload="SHD()">
    <form id="form1" runat="server">
    <div class="intro"">
        <h1>iDENTIFY</h1>
        <p>A CS310 Group's Project to Provide Fake Identities Worldwide!</p>
    </div>

    <div class="float-container">
        <div id="picture" class="float-child" runat="server">
            <div class="auto-style1">
                <img id="face" src="" runat="server"/>
            </div>
        </div>
        <div class="float-child">
            <label>Below, enter any information you want to provide about your ideal fake identity:</label>

            <br /><br />

            <div id=age>
                <label>Age: </label>

                <asp:RadioButtonList ID="ageSelector" RepeatDirection="Horizontal" CssClasss="radioButtonList" OnChange="return SHD()" runat="server">
                
                    <asp:ListItem value="0" id="random" selected="True" runat="server">Random Age</asp:ListItem>
                    <asp:ListItem value="1" id="specific" runat="server">Specific Age</asp:ListItem>
                    <asp:ListItem value="2" id="range" runat="server">Age Range</asp:ListItem>
                
                </asp:RadioButtonList>

                <div id="randAge" runat="server">
                    <label>Random age will be generated.</label>
                </div>

                <div id="setAge" runat="server">
                    <asp:TextBox id="oneAge" type="number" value="21" min="9" max="76" runat="server" />
                </div>

                <div id="ageRange" runat="server">
                    <asp:TextBox id="ageMin" type="number" value="18" min="9" max="75" runat="server"></asp:TextBox>
                    <label id="rangeTo">&nbsp;to&nbsp;</label>
                    <asp:TextBox id="ageMax" type="number" value="32" min="10" max="76" runat="server"></asp:TextBox>
                </div>   
            </div>

            <div id="sex">

                <asp:RadioButtonList ID="sexSelector" RepeatDirection="Horizontal" CssClasss="radioButtonList" runat="server">
                
                    <asp:ListItem value="0" id="ListItem1" selected="True" runat="server">Random Sex</asp:ListItem>
                    <asp:ListItem value="1" id="ListItem2" runat="server">Male</asp:ListItem>
                    <asp:ListItem value="2" id="ListItem3" runat="server">Female</asp:ListItem>
                
                </asp:RadioButtonList>

            </div>

            <br />
            <asp:Button ID="submit" OnClick="submit_Click" runat="server" Text="Generate ID!" />

        </div>
        
    </div>

    </form>


</body>
</html>
