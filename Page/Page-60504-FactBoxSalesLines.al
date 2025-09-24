page 60504 SalesLineFactbox
{
    PageType = CardPart;
    SourceTable = "Sales Line";
    ApplicationArea = All;
    Caption = 'Line Details';

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Item No.';
            }

            field(LastPrice; LastPrice)
            {
                ApplicationArea = All;
                Caption = 'Previous Value';
                Style = Strong;
            }
        }
    }
    var
        LastPrice: Decimal;
    // variable: ;

    trigger OnAfterGetCurrRecord()
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        Clear(LastPrice);

        if (Rec."No." <> '') and (Rec."Sell-to Customer No." <> '') then begin
            SalesInvLine.Reset();
            SalesInvLine.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
            SalesInvLine.SetRange("No.", Rec."No.");
            if SalesInvLine.FindLast() then
                LastPrice := SalesInvLine."Unit Price";
        end;
        Message('Record Updated!');
        CurrPage.Update(false);
    end;
}
