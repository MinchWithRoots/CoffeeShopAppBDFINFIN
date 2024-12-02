using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using System.Collections.Generic;

namespace CoffeeShopAppBD
{
    public partial class RegistrationForm : Form
    {
        private Class1 db = new Class1();

        public RegistrationForm()
        {
            InitializeComponent();
        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim(); // Получение телефона из текстового поля
            string password = txtPassword.Text.Trim();

            // Список для хранения ошибок
            List<string> errorMessages = new List<string>();

            // Валидация введенных данных
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(password))
            {
                errorMessages.Add("Все поля обязательны для заполнения.");
            }

            // Валидация email (проверка на наличие '@' и латинские символы)
            if (!IsValidEmail(email))
            {
                errorMessages.Add("Неверный формат email или он содержит нелатинские символы.");
            }

            // Валидация телефона (только цифры и длина 10)
            if (!IsValidPhone(phone))
            {
                errorMessages.Add("Неверный формат телефона. Телефон должен содержать 10 цифр.");
            }

            // Валидация пароля (не менее 8 символов)
            if (password.Length < 8)
            {
                errorMessages.Add("Пароль должен содержать минимум 8 символов.");
            }

            // Если есть ошибки, выводим их и прекращаем выполнение
            if (errorMessages.Count > 0)
            {
                // Показываем все ошибки через MessageBox
                MessageBox.Show(string.Join(Environment.NewLine, errorMessages), "Ошибки", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            try
            {
                db.openConnection();

                // Проверка, используется ли email
                string checkQuery = "SELECT COUNT(*) FROM Customers WHERE email = @Email";
                SqlCommand checkCommand = new SqlCommand(checkQuery, db.GetSqlConnection());
                checkCommand.Parameters.AddWithValue("@Email", email);

                int count = (int)checkCommand.ExecuteScalar();
                if (count > 0)
                {
                    MessageBox.Show("Email уже используется.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Вставка новой записи
                string query = "INSERT INTO Customers (name, email, phone, password, loyalty_points) VALUES (@Name, @Email, @Phone, @Password, 0)";
                SqlCommand command = new SqlCommand(query, db.GetSqlConnection());
                command.Parameters.AddWithValue("@Name", name);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Phone", phone);
                command.Parameters.AddWithValue("@Password", password);

                command.ExecuteNonQuery();

                MessageBox.Show("Регистрация успешна!");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                db.closeConnection();
            }
        }

        // Метод для валидации email (проверка на наличие @ и латинские символы)
        private bool IsValidEmail(string email)
        {
            var emailPattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            return Regex.IsMatch(email, emailPattern);
        }

        // Метод для валидации телефона (только цифры и длина 10)
        private bool IsValidPhone(string phone)
        {
            var phonePattern = @"^\d{10}$";
            return Regex.IsMatch(phone, phonePattern);
        }

        // Метод для валидации пароля (не менее 8 символов)
        private bool IsValidPassword(string password)
        {
            return password.Length >= 8;
        }

        private void RegistrationForm_Load(object sender, EventArgs e)
        {

        }
    }
}
