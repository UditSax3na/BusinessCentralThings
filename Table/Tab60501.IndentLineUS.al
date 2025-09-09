table 60501 IndentLineUS
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; "Item No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(4; "Item Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Item UOM"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Item Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Item Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Vendor No 1"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(9; "Vendor No 2"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(10; "Vendor No 3"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(PK; "Document No", "Line No")
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