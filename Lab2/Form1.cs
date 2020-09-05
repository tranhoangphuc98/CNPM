using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Lab2.DAO;
using Lab2.Controller;
using Lab2.Model;

namespace Lab2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            Load();
            clearAll();
            setStt(false);
        }

        private void setStt(bool stt)
        {
            Delete.Enabled = stt;
            add.Enabled = !stt;
            Update.Enabled = stt;
        }
        private void Load()
        {
            DataTable dt = FormController.load();
            dataGridView.DataSource = dt;
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            setStt(true);
            DataGridViewRow row = this.dataGridView.Rows[e.RowIndex];
           
            tbxName.Text = row.Cells[1].Value.ToString();
            dateAndTime.Value = (DateTime)row.Cells[2].Value;
            if ((bool)row.Cells[3].Value)
            {
                rdMale.Checked = true;
            }
            else
            {
                rdFemale.Checked = true;
            }
            tbxEmail.Text = row.Cells[4].Value.ToString();

        }

        private StudentModel mapper()
        {
            StudentModel student = new StudentModel();
           student.setName(tbxName.Text);
            if (rdFemale.Checked)
            {
                student.setGender(0);
            }
            else
            {
                student.setGender(1);
            }
            student.setBirthday(dateAndTime.Value);
            student.setEmail(tbxEmail.Text);
            return student;
        }
        private void add_Click(object sender, EventArgs e)
        {
            if(tbxEmail.Text==null || tbxName==null || rdFemale.Checked == false && rdMale.Checked == false)
            {
                MessageBox.Show("vui lòng nhập đủ thông tin");
            }
            else
            {
                StudentModel student = mapper();
                bool check = FormController.insert(student);
                if (check)
                {
                    MessageBox.Show("Thêm thành công!");
                    Load();
                }
                else
                {
                    MessageBox.Show("Thêm thất bại!");
                }
            }
            
        }

        private void clear_Click(object sender, EventArgs e)
        {
            clearAll();
        }

        private void clearAll()
        {
            setStt(false);
            dataGridView.ClearSelection();
            tbxEmail.Text = "";
            tbxName.Text = "";
            rdFemale.Checked = false;
            rdMale.Checked = false;
            dateAndTime.Value = DateTime.Now;
        }

        private void Delete_Click(object sender, EventArgs e)
        {
            DataGridViewRow row = dataGridView.CurrentRow;
            int id;
            if (row != null)
            {
                id = (int)row.Cells[0].Value;
                bool check = FormController.delete(id);
                if (check)
                {
                    MessageBox.Show("Xóa thành công!");
                    Load();
                    clearAll();
                }
                else
                {
                    MessageBox.Show("Xóa thất bại!");
                }
            }
            
        }

        private void Update_Click(object sender, EventArgs e)
        {
            StudentModel student = mapper();
            DataGridViewRow row = dataGridView.CurrentRow;
            int id;
            if (row != null)
            {
                id = (int)row.Cells[0].Value;
                bool check = FormController.update(student,id);
                if (check)
                {
                    MessageBox.Show("Cập nhập thành công!");
                    Load();
                    clearAll();
                }
                else
                {
                    MessageBox.Show("Cập nhập thất bại!");
                }
            }
        }


    }
}
