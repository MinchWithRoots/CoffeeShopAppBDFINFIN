namespace CoffeeShopAppBD
{
    partial class LogInForm
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LogInForm));
            this.LogInBtn = new MaterialSkin.Controls.MaterialButton();
            this.RegistrationBtn = new MaterialSkin.Controls.MaterialButton();
            this.LoginLbl = new MaterialSkin.Controls.MaterialLabel();
            this.PasswordLbl = new MaterialSkin.Controls.MaterialLabel();
            this.txtPassword = new MaterialSkin.Controls.MaterialTextBox2();
            this.logInTxt = new MaterialSkin.Controls.MaterialTextBox2();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // LogInBtn
            // 
            this.LogInBtn.AutoSize = false;
            this.LogInBtn.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.LogInBtn.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.LogInBtn.Depth = 0;
            this.LogInBtn.Font = new System.Drawing.Font("Bahnschrift SemiCondensed", 20F);
            this.LogInBtn.HighEmphasis = true;
            this.LogInBtn.Icon = null;
            this.LogInBtn.Location = new System.Drawing.Point(352, 455);
            this.LogInBtn.Margin = new System.Windows.Forms.Padding(10);
            this.LogInBtn.MouseState = MaterialSkin.MouseState.HOVER;
            this.LogInBtn.Name = "LogInBtn";
            this.LogInBtn.NoAccentTextColor = System.Drawing.Color.Empty;
            this.LogInBtn.Padding = new System.Windows.Forms.Padding(10);
            this.LogInBtn.Size = new System.Drawing.Size(130, 37);
            this.LogInBtn.TabIndex = 5;
            this.LogInBtn.Text = "Вход";
            this.LogInBtn.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Contained;
            this.LogInBtn.UseAccentColor = false;
            this.LogInBtn.UseVisualStyleBackColor = true;
            this.LogInBtn.Click += new System.EventHandler(this.LogInbtn_Click);
            // 
            // RegistrationBtn
            // 
            this.RegistrationBtn.AutoSize = false;
            this.RegistrationBtn.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.RegistrationBtn.Density = MaterialSkin.Controls.MaterialButton.MaterialButtonDensity.Default;
            this.RegistrationBtn.Depth = 0;
            this.RegistrationBtn.HighEmphasis = true;
            this.RegistrationBtn.Icon = null;
            this.RegistrationBtn.Location = new System.Drawing.Point(58, 455);
            this.RegistrationBtn.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.RegistrationBtn.MouseState = MaterialSkin.MouseState.HOVER;
            this.RegistrationBtn.Name = "RegistrationBtn";
            this.RegistrationBtn.NoAccentTextColor = System.Drawing.Color.Empty;
            this.RegistrationBtn.Size = new System.Drawing.Size(126, 36);
            this.RegistrationBtn.TabIndex = 6;
            this.RegistrationBtn.Text = "регистрация";
            this.RegistrationBtn.Type = MaterialSkin.Controls.MaterialButton.MaterialButtonType.Text;
            this.RegistrationBtn.UseAccentColor = false;
            this.RegistrationBtn.UseVisualStyleBackColor = true;
            this.RegistrationBtn.Click += new System.EventHandler(this.registration_Click);
            // 
            // LoginLbl
            // 
            this.LoginLbl.AutoSize = true;
            this.LoginLbl.Depth = 0;
            this.LoginLbl.Font = new System.Drawing.Font("Roboto", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel);
            this.LoginLbl.FontType = MaterialSkin.MaterialSkinManager.fontType.H5;
            this.LoginLbl.Location = new System.Drawing.Point(179, 127);
            this.LoginLbl.MouseState = MaterialSkin.MouseState.HOVER;
            this.LoginLbl.Name = "LoginLbl";
            this.LoginLbl.Size = new System.Drawing.Size(168, 29);
            this.LoginLbl.TabIndex = 7;
            this.LoginLbl.Text = "Введите логин";
            // 
            // PasswordLbl
            // 
            this.PasswordLbl.AutoSize = true;
            this.PasswordLbl.Depth = 0;
            this.PasswordLbl.Font = new System.Drawing.Font("Roboto", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel);
            this.PasswordLbl.FontType = MaterialSkin.MaterialSkinManager.fontType.H5;
            this.PasswordLbl.Location = new System.Drawing.Point(179, 284);
            this.PasswordLbl.MouseState = MaterialSkin.MouseState.HOVER;
            this.PasswordLbl.Name = "PasswordLbl";
            this.PasswordLbl.Size = new System.Drawing.Size(183, 29);
            this.PasswordLbl.TabIndex = 8;
            this.PasswordLbl.Text = "Введите пароль";
            // 
            // txtPassword
            // 
            this.txtPassword.AnimateReadOnly = false;
            this.txtPassword.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.txtPassword.CharacterCasing = System.Windows.Forms.CharacterCasing.Normal;
            this.txtPassword.Depth = 0;
            this.txtPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.txtPassword.HideSelection = true;
            this.txtPassword.LeadingIcon = null;
            this.txtPassword.Location = new System.Drawing.Point(58, 329);
            this.txtPassword.MaxLength = 32767;
            this.txtPassword.MouseState = MaterialSkin.MouseState.OUT;
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.PrefixSuffixText = null;
            this.txtPassword.ReadOnly = false;
            this.txtPassword.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.txtPassword.SelectedText = "";
            this.txtPassword.SelectionLength = 0;
            this.txtPassword.SelectionStart = 0;
            this.txtPassword.ShortcutsEnabled = true;
            this.txtPassword.Size = new System.Drawing.Size(424, 48);
            this.txtPassword.TabIndex = 9;
            this.txtPassword.TabStop = false;
            this.txtPassword.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.txtPassword.TrailingIcon = null;
            this.txtPassword.UseSystemPasswordChar = false;
            // 
            // logInTxt
            // 
            this.logInTxt.AnimateReadOnly = false;
            this.logInTxt.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.logInTxt.CharacterCasing = System.Windows.Forms.CharacterCasing.Normal;
            this.logInTxt.Depth = 0;
            this.logInTxt.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);
            this.logInTxt.HideSelection = true;
            this.logInTxt.LeadingIcon = null;
            this.logInTxt.Location = new System.Drawing.Point(58, 173);
            this.logInTxt.MaxLength = 32767;
            this.logInTxt.MouseState = MaterialSkin.MouseState.OUT;
            this.logInTxt.Name = "logInTxt";
            this.logInTxt.PasswordChar = '\0';
            this.logInTxt.PrefixSuffixText = null;
            this.logInTxt.ReadOnly = false;
            this.logInTxt.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.logInTxt.SelectedText = "";
            this.logInTxt.SelectionLength = 0;
            this.logInTxt.SelectionStart = 0;
            this.logInTxt.ShortcutsEnabled = true;
            this.logInTxt.Size = new System.Drawing.Size(424, 48);
            this.logInTxt.TabIndex = 10;
            this.logInTxt.TabStop = false;
            this.logInTxt.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.logInTxt.TrailingIcon = null;
            this.logInTxt.UseSystemPasswordChar = false;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = global::CoffeeShopAppBD.Properties.Resources.pngwing_com__2_;
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox1.Location = new System.Drawing.Point(101, 383);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(325, 188);
            this.pictureBox1.TabIndex = 11;
            this.pictureBox1.TabStop = false;
            // 
            // LogInForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.ClientSize = new System.Drawing.Size(539, 615);
            this.Controls.Add(this.logInTxt);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.PasswordLbl);
            this.Controls.Add(this.LoginLbl);
            this.Controls.Add(this.RegistrationBtn);
            this.Controls.Add(this.LogInBtn);
            this.Controls.Add(this.pictureBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.FormStyle = MaterialSkin.Controls.MaterialForm.FormStyles.ActionBar_56;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimizeBox = false;
            this.Name = "LogInForm";
            this.Padding = new System.Windows.Forms.Padding(3, 80, 3, 3);
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Вход";
            this.Load += new System.EventHandler(this.LogInForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private MaterialSkin.Controls.MaterialButton RegistrationBtn;
        private MaterialSkin.Controls.MaterialLabel LoginLbl;
        private MaterialSkin.Controls.MaterialLabel PasswordLbl;
        private MaterialSkin.Controls.MaterialButton LogInBtn;
        private MaterialSkin.Controls.MaterialTextBox2 txtPassword;
        private MaterialSkin.Controls.MaterialTextBox2 logInTxt;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}

