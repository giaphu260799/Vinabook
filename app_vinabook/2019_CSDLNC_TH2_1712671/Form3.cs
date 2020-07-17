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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "EXEC sp_DangKy @ID , @PASS , @Ho_ten , @ngay_sinh , @gioi_tinh , @email";
            DataProvider provider = new DataProvider();
            int data = 0;
            data = provider.ExecuteNonQuery(query, new object[] { username.Text, pass.Text, hoten.Text, ngaysinh.Value, gioitinh.Text, email.Text });
            if (data > 0)
            {
                MessageBox.Show("Đăng ký thành công.");
                this.Hide();
            }
            else
                MessageBox.Show("Đăng ký không thành công.");
        }
    }
}
