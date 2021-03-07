using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iDentity
{
    public partial class iDentity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            picture.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string link = "https://fakeface.rest/face/view?";
            picture.Visible = true;

            if (ageSelector.SelectedValue == "0")
            {
                //no value = random
            }
            else if (ageSelector.SelectedValue == "1")
            {
                link = link+ "minimum_age=" + oneAge.Text + "&maximum_age=" + oneAge.Text;
            }
            else if (ageSelector.SelectedValue == "2")
            {
                link = link + "minimum_age=" + ageMin.Text + "&maximum_age=" + ageMax.Text;
            }
            
            if (sexSelector.SelectedValue == "0")
            {
                //no value = random
            }
            else if (sexSelector.SelectedValue == "1")
            {
                link = link + "&gender=male";
            }
            else if (sexSelector.SelectedValue == "2")
            {
                link = link + "&gender=female";
            }

            face.Src = link;
            
        }

    }
}