pageextension 60538 PurchaseInvoiceUS extends "Purchase Invoice"
{
    actions
    {
        addafter(Post)
        {
            action("Print Purchase Invoice (US)")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader.Reset();
                    PurchaseHeader.SetRange("No.", Rec."No.");
                    if PurchaseHeader.FindFirst() then begin
                        Report.RunModal(60532, true, false, PurchaseHeader);
                    end;

                end;
            }
        }
    }
}