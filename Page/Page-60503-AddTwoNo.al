page 60503 AddTwoNoUS
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(ADD)
            {
                Image = Add;
                Promoted = true;
                PromotedCategory = New;
                ApplicationArea = all;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    codeUnit.Run();

                end;
            }
        }
    }

    var
        codeUnit: Codeunit AddTwoNoUS;
        myInt: Integer;
}