tableextension 60529 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(60000; "Indent No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}