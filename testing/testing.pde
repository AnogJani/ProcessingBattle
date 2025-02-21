import java.awt.*;
import java.awt.datatransfer.*;
String selection = "Copied!";
StringSelection data = new StringSelection(selection);
Clipboard clipboard = 
Toolkit.getDefaultToolkit().getSystemClipboard();
clipboard.setContents(data, data);
