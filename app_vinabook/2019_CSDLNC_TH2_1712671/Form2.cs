using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using _2019_CSDLNC_TH2_1712671.DAO;

namespace _2019_CSDLNC_TH2_1712671
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form3 dk = new Form3();
            dk.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string user = textBox1.Text;
            string pass = textBox2.Text;
            if (textBox1.Text.CompareTo("admin") == 0 && textBox2.Text.CompareTo("1")==0)
            {
                Form7 f = new Form7();
                this.Hide();
                f.ShowDialog();
            }
            else if(Login(user,pass))
            {
                Form4 f = new Form4(user);
                this.Hide();
                f.ShowDialog();
            }
            else
            {
                MessageBox.Show("Sai tên đăng nhập hoặc mật khẩu");
            }
        }
        bool Login(string user, string pass)
        {
            return AccountDAO.Instance.login(user, pass);
        }
    }
} 
