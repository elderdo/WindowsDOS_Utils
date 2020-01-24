using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;


namespace RobvanderWoude
{
	public partial class Shell32IconsForm : Form
	{
		public static string progver = "1.00";
		public static int icon = 1;


		public Shell32IconsForm( )
		{
			InitializeComponent( );
			string[] args = Environment.GetCommandLineArgs( );
			if ( args.Length > 1 )
			{
				ShowHelp( );
			}
		}


		// Code to extract icons from Shell32.dll by Thomas Levesque
		// http://stackoverflow.com/questions/6873026
		public class IconExtractor
		{

			public static Icon Extract( string file, int number, bool largeIcon )
			{
				IntPtr large;
				IntPtr small;
				ExtractIconEx( file, number, out large, out small, 1 );
				try
				{
					return Icon.FromHandle( largeIcon ? large : small );
				}
				catch
				{
					return null;
				}

			}

			[DllImport( "Shell32.dll", EntryPoint = "ExtractIconExW", CharSet = CharSet.Unicode, ExactSpelling = true, CallingConvention = CallingConvention.StdCall )]
			private static extern int ExtractIconEx( string sFile, int iIndex, out IntPtr piLargeVersion, out IntPtr piSmallVersion, int amountIcons );
		}


		static void ShowHelp( )
		{
			string title = String.Format( "Shell32Icons {0} \xA9 2016 Rob van der Woude", progver );
			string helptext = String.Format( "Shell32Icons,  Version {0}\nView all icons available in Shell32.dll\n\n", progver );
			helptext += "Code to extract icons from Shell32.dll by Thomas Levesque:\nhttp://stackoverflow.com/questions/6873026\n\n";
			helptext += "Written by Rob van der Woude\nhttp://www.robvanderwoude.com";
			MessageBox.Show( helptext, title, MessageBoxButtons.OK, MessageBoxIcon.None );
		}


		private void numericUpDown_ValueChanged( object sender, EventArgs e )
		{
			icon = Convert.ToInt32( numericUpDown.Value );
			Shell32IconsForm.ActiveForm.Icon = IconExtractor.Extract( "shell32.dll", icon, true );
		}


		private void Shell32IconsForm_HelpRequested( object sender, HelpEventArgs hlpevent )
		{
			ShowHelp( );
		}
	}
}
