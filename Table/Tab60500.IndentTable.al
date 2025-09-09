// clone of vendor card
table 60500 "Indent Table"
{
    Caption = 'Indent Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                IndentTtable: Record "Indent Table";
            begin
                if "No" < xRec."No" then
                    if not IndentTtable.Get(Rec."No") then begin
                        SalesSetup.Get();
                        NoSeries.TestManual(SalesSetup.IndentNumberSeriesUS);
                        "Number Series" := '';
                    end;
            end;
        }
        field(2; "Customer No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(3; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Number Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6; "Status"; Enum IndentStatus)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        myInt: Integer;
    begin

        if "No" = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(IndentNumberSeriesUS);
            "Number Series" := SalesSetup.IndentNumberSeriesUS;
            if NoSeries.AreRelated(SalesSetup.IndentNumberSeriesUS, xRec."Number Series") then
                "Number Series" := xRec."Number Series";
            "No" := NoSeries.GetNextNo("Number Series");

        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
}
