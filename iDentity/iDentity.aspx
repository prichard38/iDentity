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
        // This javascript function allows for real-time switching based off of the radio buttons.
        function SHD() {
            var ageSelectValue = document.getElementById("form1").ageSelector.value;
            var nameSelectValue = document.getElementById("form1").nameSelector.value;
            
            var div1 = document.getElementById("randAge");
            var div2 = document.getElementById("setAge");
            var div3 = document.getElementById("ageRange");
            var div4 = document.getElementById("randName");
            var div5 = document.getElementById("setName");


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

            if (nameSelectValue == 0) {
                div4.style.display = "inline-block";
                div5.style.display = "none";
            }

            if (nameSelectValue == 1) {
                div4.style.display = "none";
                div5.style.display = "inline-block";
            }

        }

    </script>

</head>
<body >
    <form id="form1" runat="server">

    <!-- The header to the page.  Contains program/page title and a subtitle -->
    <div class="intro"">
        <h1>iDENTIFY</h1>
        <p>A CS310 Group's Project to Provide Fake Identities Worldwide!</p>
    </div>

    <!-- Float container allows the various divs to be side-by-side -->
    <div class="float-container">

        <!-- Picture div contains picture and (until moved into its own div, which needs to happen) the generated data
            for the fake identity. -->
        <div id="picture" class="float-child" runat="server">
            <div class="auto-style1">
                <img id="face" src="#" runat="server"/>

                <!-- data that needs to be shown for the consumer, as it is crucial to the fake identity. needs its
                    own div that appears (like picture div) after submission -->
                <label id="sexText" runat="server"></label>
                <br />
                <label id="birthDateText" runat="server"></label>
                <br />
                <label id="addressText" runat="server"></label>

            </div>
        </div>
        <div class="float-child">
            <!-- Prompts the user to enter any information they want their identity to abide by. -->
            <label>Below, enter any information you want to provide about your ideal fake identity:</label>

            <br /><br />

            <!-- contains all information regarding name generation -->
            <div id="name"> 
                <label>Name:</label>

                <!-- allows user to have a name randomly generated for them (BASE IT OFF OF AGE, SEX, ADDRESS) or
                    enter their own custom name for their identity -->
                <asp:RadioButtonList ID="nameSelector" RepeatDirection="Horizontal" CssClasss="radioButtonList" OnChange="return SHD()" runat="server">
                
                    <asp:ListItem value="0" id="randomName" selected="True" runat="server">Random Name</asp:ListItem>
                    <asp:ListItem value="1" id="specificName" runat="server">Specific Name</asp:ListItem>
                
                </asp:RadioButtonList>


                <div id="randName" runat="server" style="display:inline-block">
                    <label>Random name will be generated.</label>
                </div>

                <div  id="setName" runat="server" style="display:inline-block">
                    <asp:TextBox id="oneName" value="John Doe" runat="server" />
                </div>
                <br /><br />
            </div>

            <!-- contains all information regarding age generation -->
            <div id="age">
                <label>Age: </label>

                <!-- Allows user to have an age randomly generated for them, set a specific age, or
                    enter a range of ages for the identity to be based off of. -->
                <asp:RadioButtonList ID="ageSelector" RepeatDirection="Horizontal" CssClasss="radioButtonList" OnChange="return SHD()" runat="server">
                
                    <asp:ListItem value="0" id="random" selected="True" runat="server">Random Age</asp:ListItem>
                    <asp:ListItem value="1" id="specific" runat="server">Specific Age</asp:ListItem>
                    <asp:ListItem value="2" id="range" runat="server">Age Range</asp:ListItem>
                
                </asp:RadioButtonList>

                <div id="randAge" runat="server" style="display:inline-block">
                    <label>Random age will be generated.</label>
                </div>

                <div id="setAge" runat="server" style="display:inline-block">
                    <asp:TextBox id="oneAge" type="number" value="21" min="9" max="76" runat="server" />
                </div>

                <div id="ageRange" runat="server" style="display:inline-block">
                    <asp:TextBox id="ageMin" type="number" value="18" min="9" max="75" runat="server"></asp:TextBox>
                    <label id="rangeTo">&nbsp;to&nbsp;</label>
                    <asp:TextBox id="ageMax" type="number" value="32" min="10" max="76" runat="server"></asp:TextBox>
                </div>   
                <br /><br />
            </div>

            <!-- contains all information regarding sex generation -->
            <div id="sex">
                <label>Sex: </label>

                <!-- allows user to have a sex randomly generated for them or
                    select their own for the identity to be generated based on-->
                <asp:RadioButtonList ID="sexSelector" RepeatDirection="Horizontal" CssClasss="radioButtonList" runat="server">
                
                    <asp:ListItem value="0" id="ListItem1" selected="True" runat="server">Random Sex</asp:ListItem>
                    <asp:ListItem value="1" id="ListItem2" runat="server">Male</asp:ListItem>
                    <asp:ListItem value="2" id="ListItem3" runat="server">Female</asp:ListItem>
                
                </asp:RadioButtonList>
                <br /><br />
            </div>
            
            <!-- Button to submit form1, which contains all of the data to generate the fake identity -->
            <asp:Button ID="submit" OnClick="submit_Click" runat="server" Text="Generate ID!" />

        </div>
        
    </div>

    </form>


</body>
</html>
