pageextension 60520 ActivityCuePageExtUS extends "O365 Activities"
{
    layout
    {
        addafter("Sales This Month")
        {
            field("No. of posted Invoices"; Rec."No. of posted Invoices")
            {
                ApplicationArea = all;
            }
            field("Total Active Customer"; Rec.TotalActiveCustomer)
            {
                Caption = 'Total Active Customer';
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        Rec."30 Days Filter" := CalcDate('-30D', DT2Date(CurrentDateTime));
        Rec.SetFilter(Rec."30 Days Filter", '%1..%2', Rec."30 Days Filter", DT2Date(CurrentDateTime));
    end;
}