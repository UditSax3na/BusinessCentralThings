page 60504 SalesLineFactbox
{
    PageType = ListPart;
    SourceTable = "Sales Line";
    ApplicationArea = All;
    Caption = 'Line Details';
    RefreshOnActivate = true;

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

    trigger OnAfterGetCurrRecord()
    begin
        UpdateFactBox(rec."Line No.");
    end;

    procedure UpdateFactBox(LineNo: Integer): Code[20]
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        if (Rec."No." <> '') and (Rec."Sell-to Customer No." <> '') then begin
            SalesInvLine.Reset();
            SalesInvLine.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
            SalesInvLine.SetRange("Line No.", LineNo);
            if SalesInvLine.FindLast() then begin
                LastPrice := SalesInvLine."Unit Price";
                Rec.Modify();
                CurrPage.Update(false);
                exit(SalesInvLine."No.");
            end;
        end;
        Rec.Modify();
        CurrPage.Update(false);
        exit('');
    end;
}
