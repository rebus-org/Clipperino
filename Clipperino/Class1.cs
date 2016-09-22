using System;
using System.Runtime.ExceptionServices;
using System.Threading;
using WinFormsClipboard = System.Windows.Forms.Clipboard;

namespace Clipperino
{
    /// <summary>
    /// Provides helpers for working with the Windows Clipboard
    /// </summary>
    public static class Clipboard
    {
        /// <summary>
        /// Saves the given text to the clipboard
        /// </summary>
        public static void Save(string text)
        {
            ExceptionDispatchInfo exceptionDispatchInfo = null;

            var thread = new Thread(() =>
            {
                try
                {
                    WinFormsClipboard.SetText(text);
                }
                catch (Exception exception)
                {
                    exceptionDispatchInfo = ExceptionDispatchInfo.Capture(exception);
                }
            });

            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            thread.Join();

            exceptionDispatchInfo?.Throw();
        }
    }
}
