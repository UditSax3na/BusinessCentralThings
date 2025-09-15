pageextension 60539 MyExtension extends "Item Card"
{
    layout
    {
        addafter(Inventory)
        {
            field(TotalAmountULE; Rec.TotalAmountULE)
            {
                ApplicationArea = all;
                Editable = false;
                LookupPageId = UditLedgerEntriesLines;
                // DrillDownPageId = UditLedgerEntriesLines;
            }
        }
    }
    // Code by Udit Saxena
    // trigger OnAfterGetCurrRecord()
    // var
    //     UditEntries: Record UditLedgerEntriesUS;
    //     totalAmount: Integer;
    // begin
    //     // getting all the ledger entries and their quantities which will be add and set to the item card field
    //     UditEntries.Init();
    //     UditEntries.SetRange(ItemNo, Rec."No.");
    //     if UditEntries.FindSet() then begin
    //         repeat
    //             totalAmount += UditEntries.Quantity;
    //         until UditEntries.Next() = 0;
    //     end;
    //     // setting the value to the field on item card
    //     Rec.TotalAmountULE := totalAmount;
    //     Rec.Modify();
    // end;
}