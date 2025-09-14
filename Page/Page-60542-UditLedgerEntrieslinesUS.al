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
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ApplicationArea = all;
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                    ApplicationArea = all;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Sales Amount Actual"; Rec."Sales Amount Actual")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                    ApplicationArea = all;
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                    ApplicationArea = all;
                }
                field(OrderType; Rec.OrderType)
                {
                    ApplicationArea = all;
                }
                field(Open; Rec.Open)
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