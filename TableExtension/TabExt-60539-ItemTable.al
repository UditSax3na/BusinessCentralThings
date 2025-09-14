tableextension 60539 ItemTableUS extends Item
{
    fields
    {
        field(60000; TotalAmountULE; Integer)
        {
            Caption = 'Total Amount of Udit Ledger Entry';
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