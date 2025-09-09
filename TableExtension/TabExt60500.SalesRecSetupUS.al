tableextension 60500 SalesRecSetupUS extends "Sales & Receivables Setup"
{
    fields
    {
        field(60500; IndentNumberSeriesUS; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}