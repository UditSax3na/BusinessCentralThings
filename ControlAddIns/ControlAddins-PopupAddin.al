controladdin LinesTopLabelAddIn
{
    Scripts = 'scripts/js/popup.js';
    // StartupScript
    StyleSheets = 'scripts/css/popup.css';

    RequestedHeight = 16;
    RequestedWidth = 200;
    MinimumHeight = 12;
    MinimumWidth = 100;
    // Define a procedure you can call from AL
    procedure ShowMessage(msg: Text);
}
