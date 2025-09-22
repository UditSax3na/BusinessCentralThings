controladdin "ToastAddIn"
{
    Scripts = 'scripts/js/toast.js'; // custom js file
    StartupScript = 'scripts/js/startup.js';
    RequestedHeight = 50;
    RequestedWidth = 300;

    // Methods callable from AL
    procedure ShowToast(title: Text; message: Text; type: Text; position: Text);
}