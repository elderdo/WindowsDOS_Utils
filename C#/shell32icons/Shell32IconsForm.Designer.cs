namespace RobvanderWoude
{
	partial class Shell32IconsForm
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose( bool disposing )
		{
			if ( disposing && ( components != null ) )
			{
				components.Dispose( );
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent( )
		{
			this.numericUpDown = new System.Windows.Forms.NumericUpDown();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown)).BeginInit();
			this.SuspendLayout();
			// 
			// numericUpDown
			// 
			this.numericUpDown.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.numericUpDown.Location = new System.Drawing.Point(0, 0);
			this.numericUpDown.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
			this.numericUpDown.Maximum = new decimal(new int[] {
            305,
            0,
            0,
            0});
			this.numericUpDown.Name = "numericUpDown";
			this.numericUpDown.Size = new System.Drawing.Size(146, 44);
			this.numericUpDown.TabIndex = 0;
			this.numericUpDown.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
			this.numericUpDown.ValueChanged += new System.EventHandler(this.numericUpDown_ValueChanged);
			// 
			// Shell32IconsForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(146, 44);
			this.Controls.Add(this.numericUpDown);
			this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "Shell32IconsForm";
			this.Text = "Shell32Icons";
			this.HelpRequested += new System.Windows.Forms.HelpEventHandler(this.Shell32IconsForm_HelpRequested);
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown)).EndInit();
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.NumericUpDown numericUpDown;
	}
}

