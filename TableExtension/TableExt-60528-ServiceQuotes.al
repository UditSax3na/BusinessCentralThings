tableextension 60528 ServiceQuotes extends "Service Mgt. Setup"
{
    fields
    {
        // Add changes to table fields here
        field(7900; "Finished Status"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = false;
        }
        field(7901; "Date of Finished Status"; Date)
        {
            DataClassification = ToBeClassified;
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
}