report 60532 "Purchase Order Report US"
{
    Caption = 'Purchase Order Report US';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports/PurchaseHeaderUS.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            //  DataItemTableView = where("Document Type" = const(Order));
            RequestFilterFields = "No.";

            column(DocumentNo; "No.") { }
            column(DocumentType; "Document Type") { }
            column(OrderDate; "Order Date") { }
            column(VendorNo; "Buy-from Vendor No.") { }
            column(VendorName; "Buy-from Vendor Name") { }
            column(Status; Status) { }
            column(TotalLineAmount; TotalLineAmount) { }
            column(CompanyName; CompanyName) { }
            column(CompanyAddress; 'Adress') { }
            column(CompanyCity; 'City') { }
            column(CompanyPostCode; '"Post Code"') { }
            column(CompanyPhone; '"Phone No."') { }
            column(CompanyEmail; '"E-Mail")') { }
            column(CompanyLogo; 'Picture') { }
            // Company Information

            // Purchase Line Data
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Purchase Header";
                column(No_; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
            }
            trigger OnAfterGetRecord()
            var
                PurchLine: Record "Purchase Line";
            begin
                Clear(TotalLineAmount);
                PurchLine.Reset();
                PurchLine.SetRange("Document No.", "Purchase Header"."No."); // 
                if PurchLine.FindSet() then begin
                    repeat
                        TotalLineAmount += PurchLine."Line Amount";
                    until PurchLine.Next() = 0;
                end;
            end;
        }
    }

    trigger OnPreReport()
    begin
        compinfo.Get();
        compinfo.CalcFields(Picture);
    end;

    var
        compinfo: Record "Company Information";
        TotalLineAmount: Decimal;
}
