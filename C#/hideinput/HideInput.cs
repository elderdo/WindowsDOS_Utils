using System;
using System.Collections.Generic;


namespace RobvanderWoude
{
	class HideInput
	{
		static string progver = "1.01";


		static int Main( string[] args )
		{
			try
			{
				bool clearscreen = false;

				if ( args.Length > 1 )
				{
					return ShowHelp( "Too many command line arguments" );
				}
				if ( args.Length == 1 )
				{
					switch ( args[0].ToUpper( ) )
					{
						case "/C":
							clearscreen = true;
							break;
						case "/?":
							return ShowHelp( );
						default:
							return ShowHelp( "Invalid command line argument \"{0}\"", args[0] );
					}
				}

				// Set console foreground color to background color to hide what's being typed
				ConsoleColor color = Console.ForegroundColor;
				Console.ForegroundColor = Console.BackgroundColor;

				// Read 1 line of input from the console
				string input = Console.ReadLine( );

				// Restore the original console foreground color
				Console.ForegroundColor = color;

				if ( clearscreen )
				{
					// Clear the screen
					Console.Clear( );
				}

				// Display the input - which should be redirected for this program to be of any use
				Console.WriteLine( input );

				// Returncode 0 for success, or 2 if the input was empty or whitespace only
				if ( string.IsNullOrWhiteSpace( input ) )
				{
					return 2;
				}
				else
				{
					return 0;
				}
			}
			catch ( Exception e )
			{
				return ShowHelp( e.Message );
			}
		}

		public static int ShowHelp( params string[] errmsg )
		{
			#region Help Text

			/*
			HideInput,  Version 1.01
			Batch utility to read 1 line of input while hiding what's being typed, by
			temporarily setting the console foreground color equal to its background color

			Usage:  FOR /F "tokens=*" %%A IN ('HIDEINPUT') DO SET password=%%A
			   or:  FOR /F "tokens=*" %%A IN ('HIDEINPUT /C') DO SET password=%%A

			Where:  /C  Clears the screen to remove what's typed from the screen buffer
			
			Notes:  Even though invisible while typing, typed input will be "visible" in
			        the screen buffer. The "invisible" text can be made visible with
			        Windows' own COLOR command, or by any program that can access the
			        screen buffer. To prevent this, use the program's /C switch or
			        Windows' own CLS command to clear the screen and screen buffer.
			        Return code ("errorlevel") is 0 if valid input is received, 1 in case
			        of (command line) errors, 2 if input is empty or whitespace only.

			Written by Rob van der Woude
			http://www.robvanderwoude.com
			*/

			#endregion Help Text


			#region Error Message

			if ( errmsg.Length > 0 )
			{
				List<string> errargs = new List<string>( errmsg );
				errargs.RemoveAt( 0 );
				Console.Error.WriteLine( );
				Console.ForegroundColor = ConsoleColor.Red;
				Console.Error.Write( "ERROR:\t" );
				Console.ForegroundColor = ConsoleColor.White;
				Console.Error.WriteLine( errmsg[0], errargs.ToArray( ) );
				Console.ResetColor( );
			}

			#endregion Error Message


			#region Display Help Text

			Console.Error.WriteLine( );

			Console.Error.WriteLine( "HideInput,  Version {0}", progver );

			Console.Error.WriteLine( "Batch utility to read 1 line of input while hiding what's being typed, by" );

			Console.Error.WriteLine( "temporarily setting the console foreground color equal to its background color" );

			Console.Error.WriteLine( );

			Console.Error.Write( "Usage:  FOR /F \"tokens=*\" %%A IN ('" );
			Console.ForegroundColor = ConsoleColor.White;
			Console.Error.Write( "HIDEINPUT" );
			Console.ResetColor( );
			Console.Error.WriteLine( "') DO SET password=%%A" );

			Console.Error.Write( "   or:  FOR /F \"tokens=*\" %%A IN ('" );
			Console.ForegroundColor = ConsoleColor.White;
			Console.Error.Write( "HIDEINPUT /C" );
			Console.ResetColor( );
			Console.Error.WriteLine( "') DO SET password=%%A" );

			Console.Error.WriteLine( );

			Console.Error.Write( "Where:  " );
			Console.ForegroundColor = ConsoleColor.White;
			Console.Error.Write( "/C  C" );
			Console.ResetColor( );
			Console.Error.WriteLine( "lears the screen to remove what's typed from the screen buffer" );

			Console.Error.WriteLine( );

			Console.Error.WriteLine( "Notes:  Even though invisible while typing, typed input will be \"visible\" in" );
			
			Console.Error.WriteLine( "        the screen buffer. The \"invisible\" text can be made visible with" );

			Console.Error.Write( "        Windows' own " );
			Console.ForegroundColor = ConsoleColor.White;
			Console.Error.Write( "COLOR" );
			Console.ResetColor( );
			Console.Error.WriteLine( " command, or by any program that can access the" );

			Console.Error.Write( "        screen buffer. To prevent this, use the program's " );
			Console.ForegroundColor = ConsoleColor.White;
			Console.Error.Write( "/C" );
			Console.ResetColor( );
			Console.Error.WriteLine( " switch or" );

			Console.Error.Write( "        Windows' own " );
			Console.ForegroundColor = ConsoleColor.White;
			Console.Error.Write( "CLS" );
			Console.ResetColor( );
			Console.Error.WriteLine( " command to clear the screen and screen buffer." );

			Console.Error.WriteLine( "        Return code (\"errorlevel\") is 0 if valid input is received, 1 in case" );

			Console.Error.WriteLine( "        of (command line) errors, 2 if input is empty or whitespace only." );

			Console.Error.WriteLine( );

			Console.Error.WriteLine( "Written by Rob van der Woude" );

			Console.Error.WriteLine( "http://www.robvanderwoude.com" );

			#endregion Display Help Text


			return 1;
		}

	}
}
