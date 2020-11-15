using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2.Model
{
    class StudentModel
    {
        private  String name;
        private DateTime birthday;
        private int gender;
        private String email;

        public String getName()
        {
            return name;
        }

        public void setName(String name)
        {
            this.name = name;
        }

        public  DateTime getBirthday()
        {
            return birthday;
        }

        public void setBirthday(DateTime birthday)
        {
            this.birthday = birthday;
        }

        public int getGender()
        {
            return gender;
        }

        public void setGender(int gender)
        {
            this.gender = gender;
        }
        public String getEmail()
        {
            return email;
        }

        public void setEmail(String email)
        {
            this.email = email;
        }

    }
}
