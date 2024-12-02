using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Windows.Forms;

namespace CoffeeShopAppBD
{
    public partial class AdminForm : Form
    {
        private Class1 db = new Class1();

        public AdminForm()
        {
            InitializeComponent();
            // Подписка на событие выбора элемента в ComboBox
            comboTables.SelectedIndexChanged += ComboTables_SelectedIndexChanged;
        }

        private void AdminForm_Load(object sender, EventArgs e)
        {
            dataGridView.ReadOnly = true;
            dataGridView.AllowUserToAddRows = false;
            dataGridView.AllowUserToDeleteRows = false;
            // Добавление фильтров в ComboBox
            filtration.Items.Add("Все записи");
            filtration.Items.Add("Недавние заказы");
            filtration.Items.Add("Товары в наличии");
            filtration.Items.Add("Сотрудники на должности 'Manager'");
            filtration.Items.Add("Заказы с суммой больше 50");
            filtration.Items.Add("Дорогие товары (цена > 50)");

            // Подписка на изменение фильтров
            filtration.SelectedIndexChanged += filtration_SelectedIndexChanged;

            // Заполнение списка таблиц
            comboTables.Items.Add("Customers");
            comboTables.Items.Add("Employees");
            comboTables.Items.Add("Positions");
            comboTables.Items.Add("Orders");
            comboTables.Items.Add("OrderItems");
            comboTables.Items.Add("Inventory");
            comboTables.Items.Add("Products");
            comboTables.Items.Add("ProductCategories");
            comboTables.Items.Add("Suppliers");
            comboTables.Items.Add("Shipments");
            comboTables.Items.Add("ShipmentItems");

            searchTextBox.TextChanged += SearchTextBox_TextChanged;

            // Адаптивность DataGridView
            dataGridView.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;

            // Адаптивность ComboBox
            comboTables.Anchor = AnchorStyles.Top | AnchorStyles.Left;

            // Адаптивность TextBox
            searchTextBox.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;

        }

        private void ComboTables_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedTable = comboTables.SelectedItem?.ToString();

            // Очистить поле поиска при смене таблицы
            searchTextBox.Text = string.Empty;

            // Установка фильтров на основе выбранной таблицы
            UpdateFiltersForSelectedTable(selectedTable);

            // Загрузка данных для выбранной таблицы
            LoadTableData();

            if (string.IsNullOrEmpty(selectedTable))
            {
                MessageBox.Show("Выберите таблицу.");
                return;
            }

            try
            {
                db.openConnection();
                string query;

                // Проверка, если выбрана таблица Employees
                if (selectedTable == "Employees")
                {
                    // SQL-запрос для отображения всех столбцов, кроме employee_id
                    query = @"
SELECT 
    e.name AS Name, 
    e.salary AS Salary, 
    e.hire_date AS HireDate, 
    e.password AS Password, 
    p.position_name AS Position
FROM Employees e
JOIN Positions p ON e.position_id = p.position_id";
                }
                else
                {
                    // Обычный запрос для других таблиц
                    query = $"SELECT * FROM {selectedTable}";
                }

                SqlDataAdapter adapter = new SqlDataAdapter(query, db.GetSqlConnection());
                DataTable table = new DataTable();
                adapter.Fill(table);

                // Отображение данных в DataGridView
                dataGridView.DataSource = table;

                // Скрытие столбцов с ID и паролями
                foreach (DataGridViewColumn column in dataGridView.Columns)
                {
                    if (column.Name.IndexOf("id", StringComparison.OrdinalIgnoreCase) >= 0 ||
                        column.Name.IndexOf("password", StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        column.Visible = false;
                    }
                }

                AdjustDataGridViewColumns();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}");
            }
            finally
            {
                db.closeConnection();
            }
        }



        private void AddMenu_Click(object sender, EventArgs e)
        {
            try
            {
                // Проверить, выбрана ли таблица "Customers"
                if (comboTables.SelectedItem?.ToString() == "Customers")
                {
                    MessageBox.Show("Добавление записей в таблицу 'Customers' запрещено.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Получить текущую таблицу из DataGridView
                DataTable currentTable = dataGridView.DataSource as DataTable;

                if (currentTable == null)
                {
                    MessageBox.Show("Нет данных для добавления строки. Выберите таблицу.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Создать новую строку
                DataRow newRow = currentTable.NewRow();

                // Добавить строку в DataTable
                currentTable.Rows.Add(newRow);

                // Установить выделение на новую строку для редактирования
                dataGridView.CurrentCell = dataGridView.Rows[dataGridView.Rows.Count - 1].Cells[0];
                dataGridView.BeginEdit(true);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка при добавлении строки: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        private void editMenu_Click_1(object sender, EventArgs e)
        {
            try
            {
                dataGridView.ReadOnly = false;
                dataGridView.AllowUserToAddRows = true;
                dataGridView.AllowUserToDeleteRows = true;

                MessageBox.Show("Включен режим редактирования.", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка при изменении строки: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void deleteMenu_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView.SelectedRows.Count == 0)
                {
                    MessageBox.Show("Пожалуйста, выберите строку для удаления.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                DataGridViewRow selectedRow = dataGridView.SelectedRows[0];
                string selectedTable = comboTables.SelectedItem?.ToString();

                if (string.IsNullOrEmpty(selectedTable))
                {
                    MessageBox.Show("Выберите таблицу.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Получение идентификатора записи для удаления
                string idColumnName = dataGridView.Columns[0].Name;
                string recordId = selectedRow.Cells[idColumnName].Value.ToString();

                var confirmResult = MessageBox.Show($"Вы уверены, что хотите удалить запись с ID {recordId}?\nЭто действие удалит все связанные записи.",
                                                    "Подтверждение удаления",
                                                    MessageBoxButtons.YesNo,
                                                    MessageBoxIcon.Question);

                if (confirmResult != DialogResult.Yes)
                    return;

                db.openConnection();

                // Запрос на проверку зависимостей
                string dependencyCheckQuery = $@"
        SELECT COUNT(*) 
        FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
        JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU ON RC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
        WHERE KCU.TABLE_NAME = @TableName";

                SqlCommand dependencyCommand = new SqlCommand(dependencyCheckQuery, db.GetSqlConnection());
                dependencyCommand.Parameters.AddWithValue("@TableName", selectedTable);
                int dependenciesCount = (int)dependencyCommand.ExecuteScalar();

                if (dependenciesCount > 0)
                {
                    MessageBox.Show("Эта запись имеет связанные зависимости. Каскадное удаление будет применено.", "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                // Выполнение каскадного удаления
                string deleteQuery = $"DELETE FROM {selectedTable} WHERE {idColumnName} = @RecordId";
                SqlCommand deleteCommand = new SqlCommand(deleteQuery, db.GetSqlConnection());
                deleteCommand.Parameters.AddWithValue("@RecordId", recordId);
                deleteCommand.ExecuteNonQuery();

                // Обновление отображения после удаления
                LoadTableData();

                MessageBox.Show("Запись успешно удалена.", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                db.closeConnection();
            }
        }


        private void filtration_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadTableData();
        }

        private void UpdateFiltersForSelectedTable(string selectedTable)
        {
            // Очистить фильтрационный ComboBox
            filtration.Items.Clear();

            // Установить видимость фильтрационного ComboBox
            filtration.Visible = false;

            // Добавление фильтров для каждой таблицы
            if (selectedTable == "Orders")
            {
                filtration.Items.Add("Все записи");
                filtration.Items.Add("Недавние заказы");
                filtration.Items.Add("Заказы с суммой больше 50");
                filtration.SelectedIndex = 0; // Выбрать "Все записи" по умолчанию
                filtration.Visible = true;
            }
            else if (selectedTable == "Products")
            {
                filtration.Items.Add("Все записи");
                filtration.Items.Add("Товары в наличии");
                filtration.Items.Add("Дорогие товары (цена > 50)");
                filtration.SelectedIndex = 0;
                filtration.Visible = true;
            }
            else if (selectedTable == "Employees")
            {
                filtration.Items.Add("Все записи");
                filtration.Items.Add("Сотрудники на должности 'Manager'");
                filtration.Items.Add("Сотрудники с зарплатой > 45000");
                filtration.SelectedIndex = 0;
                filtration.Visible = true;
            }
        }

        private void LoadTableData()
        {
            string selectedTable = comboTables.SelectedItem?.ToString();
            string selectedFilter = filtration.SelectedItem?.ToString();
            string searchQuery = searchTextBox.Text.Trim();

            if (string.IsNullOrEmpty(selectedTable))
            {
                MessageBox.Show("Выберите таблицу.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string filterQuery = "";

            // Построение фильтра для выбранной таблицы
            if (!string.IsNullOrEmpty(selectedFilter) && selectedFilter != "Все записи")
            {
                switch (selectedTable)
                {
                    case "Orders":
                        if (selectedFilter == "Недавние заказы")
                            filterQuery = "WHERE order_date >= DATEADD(DAY, -30, GETDATE())";
                        else if (selectedFilter == "Заказы с суммой больше 50")
                            filterQuery = "WHERE total > 50";
                        break;

                    case "Products":
                        if (selectedFilter == "Товары в наличии")
                            filterQuery = "WHERE stock > 0";
                        else if (selectedFilter == "Дорогие товары (цена > 50)")
                            filterQuery = "WHERE price > 50";
                        break;

                    case "Employees":
                        if (selectedFilter == "Сотрудники на должности 'Manager'")
                            filterQuery = "WHERE p.position_name = 'Manager'";
                        else if (selectedFilter == "Сотрудники с зарплатой > 45000")
                            filterQuery = "WHERE e.salary > 45000";
                        break;
                }
            }

            try
            {
                db.openConnection();

                // Основной запрос с фильтрами
                string query;
                if (selectedTable == "Employees")
                {
                    query = $@"
SELECT 
    e.name AS Name, 
    e.salary AS Salary, 
    e.hire_date AS HireDate, 
    e.password AS Password, 
    p.position_name AS Position
FROM Employees e
JOIN Positions p ON e.position_id = p.position_id
{filterQuery}";
                }
                else
                {
                    query = $"SELECT * FROM {selectedTable} {filterQuery}";
                }

                // Выполнение основного запроса
                SqlDataAdapter adapter = new SqlDataAdapter(query, db.GetSqlConnection());
                DataTable table = new DataTable();
                adapter.Fill(table);

                // Применение поиска к отфильтрованным данным
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    DataTable filteredTable = table.Clone();
                    foreach (DataRow row in table.Rows)
                    {
                        foreach (DataColumn column in table.Columns)
                        {
                            // Преобразуем все данные в текст через Convert.ToString
                            string cellValue = Convert.ToString(row[column]);

                            // Проверяем, содержит ли преобразованное значение текст поиска
                            if (cellValue.IndexOf(searchQuery, StringComparison.OrdinalIgnoreCase) >= 0)
                            {
                                filteredTable.ImportRow(row);
                                break;
                            }
                        }
                    }
                    table = filteredTable;
                }

                // Отображение данных в DataGridView
                dataGridView.DataSource = table;

                // Настройка отображения колонок
                AdjustDataGridViewColumns();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки данных: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                db.closeConnection();
            }
        }


        private void saveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView.DataSource is DataTable currentTable && !string.IsNullOrEmpty(comboTables.SelectedItem?.ToString()))
                {
                    string selectedTable = comboTables.SelectedItem.ToString();

                    // Сохранение изменений в базу данных
                    using (SqlDataAdapter adapter = new SqlDataAdapter($"SELECT * FROM {selectedTable}", db.GetSqlConnection()))
                    {
                        SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                        adapter.Update(currentTable);
                    }

                    // Отключение редактирования после сохранения
                    dataGridView.ReadOnly = true;
                    dataGridView.AllowUserToAddRows = false;
                    dataGridView.AllowUserToDeleteRows = false;

                    MessageBox.Show("Изменения успешно сохранены.", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Нет данных для сохранения. Убедитесь, что выбрана таблица и внесены изменения.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка при сохранении изменений: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void SearchTextBox_TextChanged(object sender, EventArgs e)
        {
            LoadTableData();
        }


        private void AdjustDataGridViewColumns()
        {
            if (dataGridView.Columns.Count > 0)
            {
                foreach (DataGridViewColumn column in dataGridView.Columns)
                {
                    column.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                }
            }
        }

        private void ExitMenu_Click_1(object sender, EventArgs e)
        {
            this.Hide(); // Скрыть текущую форму
            LogInForm logInForm = new LogInForm(); // Создание экземпляра главной формы
            logInForm.Show(); // Показать главную форму
        }
    }
}
