pageextension 60500 SalesRecSetupUS extends "Sales & Receivables Setup"
{
    layout
    {
        addbefore("Customer Nos.")
        {
            field(IndentNumberSeriesUS; Rec.IndentNumberSeriesUS)
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