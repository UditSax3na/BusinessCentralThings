pageextension 60542 SalesOrderExtUS extends "Sales Order"
{
    layout
    {
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
    }

    var
        myInt: Integer;
}