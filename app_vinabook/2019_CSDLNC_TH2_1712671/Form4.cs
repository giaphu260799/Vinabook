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
    public partial class Form4 : Form
    {
        public Form4(string username)        {
            InitializeComponent();
            label1.Text = username;
            string query = "SELECT S.MA_SACH,S.TEN_SACH,S.GIA_TIEN FROM CHI_TIET_DON_HANG C, SACH S WHERE C.MA_SACH = S.MA_SACH GROUP BY S.MA_SACH,S.TEN_SACH,S.GIA_TIEN HAVING COUNT(C.MA_DH) > 6";
            DataProvider provider = new DataProvider();
            dataGridView1.DataSource = provider.ExecuteQuery(query, new object[] { });
            query = "SELECT * FROM SACH WHERE NGAY_PHAT_HANH >= '2019-11-15'";
            provider = new DataProvider();
            dataGridView2.DataSource = provider.ExecuteQuery(query, new object[] { });
        }

        public Form4()
        {
            // TODO: Complete member initialization
        }

        private void dangxuat_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 f = new Form1();
            f.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form5 f = new Form5(textBox1.Text,label1.Text);
            f.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form11 f = new Form11(label1.Text);
            this.Hide();
            f.ShowDialog();
        }
    }
}
