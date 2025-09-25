pageextension 60542 SalesOrderExtUS extends "Sales Order"
{
    layout
    {
        addfirst(factboxes)
        {
            part(SalesLineFactbox; SalesLineFactbox)
            {
                ApplicationArea = All;
                Provider = SalesLines; // that will tell the factbox that this will send the data also this line will also enable the Fields which are not present in the sales order
                SubPageLink = "Document No." = FIELD("Document No."), "Document Type" = FIELD("Document Type"), "Line No." = FIELD("Line No.");
            }
        }
        addafter(Status)
        {
            field("Sources of Sales"; Rec."Sources of Sales")
            {
                ApplicationArea = all;
            }
            field("Royality Amount"; Rec."Royality Amount")
            {
                ApplicationArea = all;
            }
            field("Terms and Conditions"; Rec."Terms and Conditions")
            {
                ApplicationArea = all;
            }
            field("Ref No."; Rec."Ref No.")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                NoSeries: Record "No. Series";
            begin
            end;
        }

    }

    var
        SalesLines: Record "Sales Line";
}