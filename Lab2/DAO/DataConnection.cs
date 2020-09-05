using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;
using Lab2.Model;

namespace Lab2.DAO
{
    class DataConnection
    {
        public static SqlConnection
               GetDBConnection()
        {
            String datasource = "MAY00\\SQLEXPRESS";
            String database = "school";
            String username = "sa";
            String password = "123";
            String connString = @"Data Source=" + datasource + ";Initial Catalog="
                        + database + ";Persist Security Info=True;User ID=" + username + ";Password=" + password;

            SqlConnection conn = new SqlConnection(connString);

            return conn;
        }

        public static DataTable findAll()
        {
            SqlConnection conn = GetDBConnection();
            conn.Open();
            try {
                String sql = "SELECT* FROM student";
                SqlCommand cmd = new SqlCommand(sql, conn);
                DbDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                return dt;
            }
            catch(SqlException e)
            {
                
            }
            finally
            {
                conn.Close();
            }
            return null;
        }

        public static bool insert(StudentModel student)
        {
            SqlConnection conn = GetDBConnection();
            conn.Open();
            try
            {
                String sql = "INSERT INTO student (hoTen,ngaySinh,gioiTinh,email) VALUES(@name,@birthday,@gender,@email)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("name", student.getName());
                cmd.Parameters.AddWithValue("birthday", student.getBirthday().Date);
                cmd.Parameters.AddWithValue("gender", student.getGender());
                cmd.Parameters.AddWithValue("email", student.getEmail());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException e)
            {
               
            }
            finally
            {
                conn.Close();
            }
            return false;
        }

        public static bool delete(int id)
        {
            SqlConnection conn = GetDBConnection();
            conn.Open();
            try
            {
                String sql = "DELETE FROM student where maso = @id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("id", id);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException e)
            {

            }
            finally
            {
                conn.Close();
            }
            return false;
        }

        public static bool update(StudentModel student,int id)
        {
            SqlConnection conn = GetDBConnection();
            conn.Open();
            try
            {
                String sql = "UPDATE student SET hoTen=@name,ngaySinh=@birth,gioiTinh=@gender,email=@email WHERE maso=@id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("id", id);
                cmd.Parameters.AddWithValue("name", student.getName());
                cmd.Parameters.AddWithValue("birth", student.getBirthday().Date);
                cmd.Parameters.AddWithValue("gender", student.getGender());
                cmd.Parameters.AddWithValue("email", student.getEmail());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException e)
            {

            }
            finally
            {
                conn.Close();
            }
            return false;
        }
    }
}
