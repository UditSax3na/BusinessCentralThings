page 60542 UditLedgerEntriesLines
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = UditLedgerEntriesUS;
    Caption = 'Udit Ledger Entries Lines';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
        }
    }
}