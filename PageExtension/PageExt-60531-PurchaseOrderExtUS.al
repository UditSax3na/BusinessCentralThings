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
            action("Print Purchase Order Report US")
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
                        Report.RunModal(60533, true, false, CurrentRec); // Request Window: True, System Printer: False
                    end;
                end;

            }
        }
        addafter("Print Purchase Order Report US")
        {
            action("PostUS")
            {
                ApplicationArea = all;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                end;
            }
        }
        // modify(Post)
        // {
        // var
        //     ItemLedgEntry: Record ManeLedgerEntries;
        //     ItemLedgEntryPage: Page ManeList;
        // begin
        //     ItemLedgEntry.SetRange("ItemNo.", rec."No.");
        //     Page.Run(Page::ManeList, ItemLedgEntry);
        // end;
        // trigger OnAfterAction()
        // var
        //     PurchaseOrder: Record "Purchase Header";
        //     Noseries: Record "No. Series";
        //     NoseriesPage: Page "No. Series Lines";
        //     SelectedSeries: Code[20];

        // begin
        //     // Selection of the number series
        //     if NoseriesPage.RunModal() = Action::LookupOK then begin
        //         // Noseries.SetFilter(Description, '@*Posted Purchase Invoice*');
        //         NoseriesPage.GetRecord(Noseries);
        //         SelectedSeries := Noseries.Code;

        //         Rec.Validate("Posting No. Series", SelectedSeries);
        //         Rec.Modify();
        //     end;
        // Selection of the record in which the number series should be posted
        // 
        //     end;
        // }
    }

    var
        myInt: Integer;
}