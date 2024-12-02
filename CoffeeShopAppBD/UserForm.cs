using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;
using MaterialSkin;
using MaterialSkin.Controls;

namespace CoffeeShopAppBD
{
    public partial class UserForm : MaterialForm
    {
        private Class1 db = new Class1();
        private string customerEmail;

        public UserForm(string email)
        {
            InitializeComponent();
            customerEmail = email;

            var materialSkinManager = MaterialSkinManager.Instance;
            materialSkinManager.AddFormToManage(this);
            materialSkinManager.Theme = MaterialSkinManager.Themes.LIGHT;
            materialSkinManager.ColorScheme = new ColorScheme(Primary.Brown700, Primary.Brown900, Primary.Brown500, Accent.Orange400, TextShade.WHITE);
        }

        private void UserForm_Load(object sender, EventArgs e)
        {
            try
            {
                db.openConnection();

                // Начальный запрос для загрузки всех заказов пользователя
                string query = @"
                SELECT Orders.order_id, Orders.order_date, Orders.total
                FROM Orders
                INNER JOIN Customers ON Orders.customer_id = Customers.customer_id
                WHERE Customers.email = @Email";

                SqlCommand command = new SqlCommand(query, db.GetSqlConnection());
                command.Parameters.AddWithValue("@Email", customerEmail);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                dataGridView.DataSource = table;

                // Подписка на изменение текста в поле поиска
                searchTextBox.TextChanged += searchTextBox_TextChanged;

                // Инициализация ComboBox для фильтрации
                filterComboBox.Items.AddRange(new object[]
                {
                    "Все заказы",
                    "Заказы за последние 30 дней",
                    "Заказы на сумму больше 50"
                });
                filterComboBox.SelectedIndex = 0; // По умолчанию "Все заказы"
                filterComboBox.SelectedIndexChanged += filterComboBox_SelectedIndexChanged;
                this.Controls.Add(filterComboBox);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
            finally
            {
                db.closeConnection();
            }
        }

        // Метод для обработки изменений текста в поисковом поле
        private void searchTextBox_TextChanged(object sender, EventArgs e)
        {
            ApplyFilter();  // Применение фильтра и поиска при изменении текста
        }

        // Метод для применения фильтра и поиска
        private void ApplyFilter()
        {
            string searchQuery = searchTextBox.Text.Trim(); // Получение текста поиска
            string filterCondition = GetFilterCondition(); // Условие фильтра

            try
            {
                db.openConnection();

                // Базовый SQL-запрос
                string baseQuery = @"
            SELECT Orders.order_id, Orders.order_date, Orders.total
            FROM Orders
            INNER JOIN Customers ON Orders.customer_id = Customers.customer_id
            WHERE Customers.email = @Email";

                // Объединение условий фильтрации и поиска
                if (!string.IsNullOrEmpty(filterCondition))
                {
                    baseQuery += filterCondition;
                }
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    baseQuery += @" AND (CAST(Orders.order_id AS NVARCHAR) LIKE @Search OR 
                                  CAST(Orders.total AS NVARCHAR) LIKE @Search)";
                }

                // Создаем команду и добавляем параметры
                SqlCommand command = new SqlCommand(baseQuery, db.GetSqlConnection());
                command.Parameters.AddWithValue("@Email", customerEmail);
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    command.Parameters.AddWithValue("@Search", "%" + searchQuery + "%");
                }

                // Наполняем таблицу данными
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                // Отображаем данные в DataGridView
                dataGridView.DataSource = table;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка фильтрации: {ex.Message}");
            }
            finally
            {
                db.closeConnection();
            }
        }


        private string GetFilterCondition()
        {
            switch (filterComboBox.SelectedItem.ToString())
            {
                case "Заказы за последние 30 дней":
                    return " AND Orders.order_date >= DATEADD(DAY, -30, GETDATE())";
                case "Заказы на сумму больше 50":
                    return " AND Orders.total > 50";
                default:
                    return ""; // Для "Все заказы" или отсутствия фильтра
            }
        }

        // Метод для обработки изменения выбранного фильтра
        private void filterComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Сброс текста в поле поиска при изменении фильтра
            searchTextBox.Clear();
            ApplyFilter();  // Применяем фильтр без учета текста поиска
        }

        // Метод для выхода из формы (по нажатию на кнопку выхода)
        private void ExitButton_Click(object sender, EventArgs e)
        {
            this.Hide(); // Скрыть текущую форму
            LogInForm logInForm = new LogInForm(); // Создание экземпляра формы логина
            logInForm.Show(); // Показать форму логина
        }
    }
}
