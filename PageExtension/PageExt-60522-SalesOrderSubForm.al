pageextension 60522 SalesOrderSubForm extends "Sales Order Subform"
{
    layout
    {
        addlast(content)
        {
            usercontrol(Toast; "ToastAddIn")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}