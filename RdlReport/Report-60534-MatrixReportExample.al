report 60534 MatrixReportExampleUS
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Matrix Report Example US';
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports/MatrixReportExampleUS.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Document No.";
            column(Item_No_; "Item No.") { }
            column(Description; Description) { }
            column(Quantity; Quantity) { }
            column(Location_Code; "Location Code") { }
        }
    }

    var
        Iteminfo: Record Item;
}