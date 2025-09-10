pageextension 60528 ServiceQuotesExtension extends "Service Mgt. Setup"
{
    layout
    {
        addafter("Skip Manual Reservation")
        {
            field("Finished Status"; Rec."Finished Status")
            {
                ApplicationArea = all;
                Editable = Rec."Finished Status" = false;
                trigger OnValidate()
                begin
                    if Rec."Finished Status" = true then begin
                        Rec."Date of Finished Status" := Today;
                    end else begin
                        Rec."Date of Finished Status" := 0D;
                    end;
                    Rec.Modify();
                end;
            }
            field("Date of Finished Status"; Rec."Date of Finished Status")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    var
        FinishedStatus: Boolean;
}