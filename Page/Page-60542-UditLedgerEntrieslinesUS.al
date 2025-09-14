page 60542 UditLedgerEntriesLines
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = UditLedgerEntriesUS;

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
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field(OrderType; Rec.OrderType)
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
            // action(ActionName)
            // {

            //     trigger OnAction()
            //     begin

            //     end;
            // }
        }
    }
}