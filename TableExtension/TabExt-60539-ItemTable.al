tableextension 60539 ItemTableUS extends Item
{
    fields
    {
        field(60000; TotalAmountULE; Decimal)
        {
            Caption = 'Total Amount of Udit Ledger Entry';
            FieldClass = FlowField;
            CalcFormula = sum(UditLedgerEntriesUS.Quantity where(ItemNo = field("No.")));
            // CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
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