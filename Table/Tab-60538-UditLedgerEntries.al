table 60538 UditLedgerEntriesUS
{
    DataClassification = ToBeClassified;
    Caption = 'Udit Ledger Entries US';

    fields
    {
        field(1; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "LineNo"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "ItemNo"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
            trigger OnValidate()
            var
                ItemRec: Record Item;
            begin
                // updating all the fields right after 
                ItemRec.Reset();
                ItemRec.SetRange("No.", Rec.ItemNo);
                if ItemRec.FindFirst() then begin
                    Rec.Description := ItemRec.Description;
                    // Rec.DocumentNo
                end;
            end;
        }
        field(5; "Description"; Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Invoiced Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Remaining Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Sales Amount Actual"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(10; "Cost Amount (Actual)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Cost Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; OrderType; Enum OrderTypeExt)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Open; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; LineNo)
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