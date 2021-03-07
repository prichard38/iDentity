using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace iDentity.Controllers
{
    public class BirthDateController : ApiController
    {
        private Random gen = new Random();

        //NO PARAMS -- Will generate a random Age, and then randomly generate a possible birthdate
        [HttpGet]
        public String GetBirthDateDetails()
        {
            int Age = gen.Next(80);
            DateTime MaxBirthDate = DateTime.Now.AddYears(-Age);
            MaxBirthDate.AddDays(-1);
            DateTime MinBirthDate = DateTime.Now.AddYears(-Age - 1);
            MinBirthDate.AddDays(1);
            int range = MaxBirthDate.Subtract(MinBirthDate).Days;
            
            int randNum = gen.Next(range);
            DateTime BirthDate = MinBirthDate.AddDays(randNum);
            String BirthDateString = BirthDate.ToString("MMMM dd, yyyy");

            return BirthDateString;

            /* What the returned value means
            return "If you're " + Age + ", you could have been born on " + BirthDateString + ".";
            */
        }


        //SINGLE PARAM -- Takes age as a variable and generates a possible birthdate based off of it.
        [HttpGet]
        public String GetBirthDateDetails(int Age)
        {
            DateTime MaxBirthDate = DateTime.Now.AddYears(-Age);
            MaxBirthDate.AddDays(-1);
            DateTime MinBirthDate = DateTime.Now.AddYears(-Age - 1);
            MinBirthDate.AddDays(1);
            int range = MaxBirthDate.Subtract(MinBirthDate).Days;

            int randNum = gen.Next(range);
            DateTime BirthDate = MinBirthDate.AddDays(randNum);
            String BirthDateString = BirthDate.ToString("MMMM dd, yyyy");

            return BirthDateString;

            /* What the returned value means
            return "If you're " + Age + ", you could have been born on " + BirthDateString + ".";
            */
        }


        //DOUBLE PARAMS -- Takes a minimum and maximum age for the birthdate to be generated between, and returns a possible birthdate.
        [HttpGet]
        public String GetBirthDateDetails(int MinAge, int MaxAge)
        {
            DateTime MaxBirthDate = DateTime.Now.AddYears(-MinAge);
            MaxBirthDate.AddDays(-1);
            DateTime MinBirthDate = DateTime.Now.AddYears(-MaxAge - 1);
            MinBirthDate.AddDays(1);
            int range = MaxBirthDate.Subtract(MinBirthDate).Days;

            int randNum = gen.Next(range);
            DateTime BirthDate = MinBirthDate.AddDays(randNum);
            String BirthDateString = BirthDate.ToString("MMMM dd, yyyy");

            return BirthDateString;

            /* What the returned value means
            return "If you're between " + MinAge + " and " + MaxAge + ", you could have been born on " + BirthDateString + ".";
            */
        }

    }
}
