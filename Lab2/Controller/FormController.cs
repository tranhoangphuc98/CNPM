using Lab2.DAO;
using Lab2.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab2.Controller
{
    class FormController
    {
        public static DataTable load()
        {
            return DataConnection.findAll();
        }

        public static bool insert(StudentModel student)
        {
            return DataConnection.insert(student);
        }

        public static bool delete(int id)
        {
            return DataConnection.delete(id);
        }

        public static bool update(StudentModel student,int id)
        {
            return DataConnection.update(student,id);
        }
    }
}
