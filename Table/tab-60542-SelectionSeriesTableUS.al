table 60542 SelectionSeriesTableUS
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. Series Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(2; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No. Series Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}