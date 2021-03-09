using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;

namespace iDentity
{
    public partial class iDentity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //If a picture hasn't been loaded, don't show the picture div.
            if (face.Src == "#")
            {
                picture.Visible = false;
            }
            ///////////////////////////////////////////////////////

            //Determines which Age-related div to show on screen.//
            randAge.Style.Add("display","none");
            setAge.Style.Add("display", "none");
            ageRange.Style.Add("display", "none");
            if (ageSelector.SelectedValue == "0")
            {
                randAge.Style.Add("display", "inline-block");
            }
            else if (ageSelector.SelectedValue == "1")
            {
                setAge.Style.Add("display", "inline-block");
            }
            else
            {
                ageRange.Style.Add("display", "inline-block");
            }
            ///////////////////////////////////////////////////////

            //Determines which Name-related div to show on screen//
            randName.Style.Add("display", "none");
            setName.Style.Add("display", "none");
            if (nameSelector.SelectedValue == "0")
            {
                randName.Style.Add("display", "inline-block");
            }
            else
            {
                setName.Style.Add("display", "inline-block");
            }
            ///////////////////////////////////////////////////////

        }

        private static RestClient birthAPI = new RestClient("https://localhost:44325/api/BirthDate");

        //submit_Click is called when the "Generate ID!" button is clicked.
        protected void submit_Click(object sender, EventArgs e)
        {
            string link = "https://fakeface.rest/face/view?"; //initialize face's query
            string birthDate = "?"; //initialize birthdate query
            int age;
            string sex = "";
            Random randNum = new Random();

            ///////Age Selector Query///////
            if (ageSelector.SelectedValue == "0")
            {
                age = randNum.Next(10, 75); //generate a random age 
                link = link +"minimum_age=" + age + "&maximum_age=" + age;
                birthDate = birthDate + "Age=" + age;
            }
            else if (ageSelector.SelectedValue == "1")
            {
                link = link + "minimum_age=" + oneAge.Text + "&maximum_age=" + oneAge.Text;
                birthDate = birthDate + "Age=" + oneAge.Text;
            }
            else if (ageSelector.SelectedValue == "2")
            {
                link = link + "minimum_age=" + ageMin.Text + "&maximum_age=" + ageMax.Text;
                birthDate = birthDate + "minAge=" + ageMin.Text + "&maxAge=" + ageMax.Text; 
            }
            ////////////////////////////////

            ///////Sex Selector Query///////
            if (sexSelector.SelectedValue == "0")
            {
                int randSex = randNum.Next(2);
                if (randSex == 1)
                {
                    sex = "male";
                }
                else sex = "female";
            }
            if (sexSelector.SelectedValue == "1" || sex == "male")
            {
                link = link + "&gender=male";
                sexText.InnerHtml = "Sex : Male";
            }
            else {
                link = link + "&gender=female";
                sexText.InnerHtml = "Sex : Female";
            }
            ////////////////////////////////

            //Address Query/////////////////
            /*
             * Here, we need to generate a legitimate-enough address.  I'm thinking that we can add a Zip-Code selector (text box), 
             * assuming we're generating addresses based off of zip-codes. That way, the consumer has the option
             * to customize the fake identity as much as they want to, but still have the option to keep it
             * completely random.
             * 
             * To-do list:
             * find or create an API that takes a ZIP (or really, anything) and creates a street address
             * implement it -here-
             * 
             * 
             * addressText.InnerHTML = address_query;
             */
            ////////////////////////////////


            face.Src = link; //Call on fakeface.rest API to get face with desired attributes (above)
            picture.Visible = true; //Make picture visible once face is loaded

            ///////BirthDate API Call///////
            RestRequest birthRequest = new RestRequest(birthDate,
             Method.GET);
            IRestResponse<List<string>> birthResponse =
            birthAPI.Execute<List<string>>(birthRequest);
            ////////////////////////////////
            
            
            birthDateText.InnerHtml = "Birthdate: " + birthResponse.Content; //Set Birthdate in HTML

        }

    }
}