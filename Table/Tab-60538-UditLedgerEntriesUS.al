table 60538 UditLedgerEntriesUS
{
    DataClassification = ToBeClassified;
    Caption = 'Udit Ledger Entries US';
    // LookupPageId = UditLedgerEntriesLines;
    LookupPageId = 60542;

    fields
    {
        field(1; "LineNo"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "ItemNo"; Code[20])
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
        field(3; "Description"; Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Quantity; Decimal)
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