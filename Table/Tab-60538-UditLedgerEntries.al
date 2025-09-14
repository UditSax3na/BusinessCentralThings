table 60538 UditLedgerEntriesUS
{
    DataClassification = ToBeClassified;
    Caption = 'Udit Ledger Entries US';

    fields
    {
        field(1; "Uno"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "ItemNo"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Description"; Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Invoiced Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Remaining Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Sales Amount Actual"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(9; "Cost Amount (Actual)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Cost Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; OrderType; Enum OrderTypeExt)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Open; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; Uno)
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