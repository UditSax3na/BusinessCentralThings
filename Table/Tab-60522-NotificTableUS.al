table 60522 NotificTableUS
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Message"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; CreatedAtTime; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}