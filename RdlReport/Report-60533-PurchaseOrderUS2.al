
report 60533 "Purchase Order Report US2"
{
    Caption = 'Purchase Order Report US2';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports/PurchaseHeaderUS2.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.";

            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Buy_from_Address; "Buy-from Address") { }
            column(Buy_from_Address_2; "Buy-from Address 2") { }
            column(Buy_from_City; "Buy-from City") { }
            column(Buy_from_Post_Code; "Buy-from Post Code") { }
            column(VAT_Registration_No_; "VAT Registration No.") { }
            column(Ship_to_City; "Ship-to City") { }
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(CompanyInfo; CompanyInfo.Address + CompanyInfo."Address 2" + CompanyInfo.City) { }
            column(CompanyPicture; CompanyInfo.Picture) { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Line_No_; "Line No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                trigger OnAfterGetRecord()
                begin
                    ItemInfo.Reset();
                    if ItemInfo.Get("Purchase Line"."No.") then;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }


    var
        CompanyInfo: Record "Company Information";
        ItemInfo: Record Item;
}
