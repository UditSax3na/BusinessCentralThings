pageextension 60531 PurchaseOrderExtUS extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Print")
        {
            action("Print Purchase Order Report")
            {
                ApplicationArea = all;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    CurrentRec: Record "Purchase Header";
                begin
                    CurrentRec.Setrange("No.", Rec."No.");
                    if CurrentRec.FindFirst() then begin
                        // Report.RunModal(Report::);
                    end;
                end;

            }
        }
    }

    var
        myInt: Integer;
}