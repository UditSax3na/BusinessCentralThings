tableextension 60542 SalesOrderTablesUS extends "Sales Header"
{
    fields
    {
        field(60001; "Sources of Sales"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(60002; "Royality Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60003; "Terms and Conditions"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(60004; "Ref No."; Code[20])
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