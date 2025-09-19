pageextension 60522 SalesLinesExtUS extends "Sales Order Subform"
{
    layout
    {
        addafter("Shipment Date")
        {
            field(BarCode; Rec.BarCode)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
    }

    var
        myInt: Integer;
}