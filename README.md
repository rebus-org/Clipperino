# Clipperino

Makes it easy to e.g. store text in the Windows Clipboard, even when working in a console application.



## How to use it?

Just do this:

    using Clipperino;

at the top, and then

    Clipboard.Save("CLIPBOARD I AM IN YOU!");

when you want to save text to the clipboard.




## How does it work?

It simply uses `System.Windows.Forms.Clipboard` on a separate thread with `ApartmentState.STA`. No magic.