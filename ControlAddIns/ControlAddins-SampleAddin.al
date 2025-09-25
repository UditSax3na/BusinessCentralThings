controladdin SampleAddin
{
    // used jquery as well
    Scripts = 'https://code.jquery.com/jquery-3.7.1.min.js', 'scripts/js/popup.js';
    StartupScript = 'scripts/js/startup.js';
    StyleSheets = 'scripts/css/popup.css';

    HorizontalStretch = true;

    MaximumHeight = 100;
    procedure showPopup(text: Text);
    event popUpClosed();
}