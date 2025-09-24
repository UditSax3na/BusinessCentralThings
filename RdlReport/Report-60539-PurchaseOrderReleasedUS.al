report 60539 PurchaseOrderReleasedUS
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports/PurchaseOrderReleasedUS.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(CompanyInfoAddress; CompanyInfo.Address) { }
            column(CompanyInfoPC; CompanyInfo."Post Code") { }
            column(CompanyInfoEmail; CompanyInfo."E-Mail") { }
            column(CompanyInfoPAN; CompanyInfo."P.A.N. No.") { }
            column(CompanyInfo; CompanyInfo."GST Registration No.") { }
            column(CompanyInfoPic; CompanyInfo.Picture) { }

            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Pay_to_Address; "Pay-to Address") { }
            column(Pay_to_Address_2; "Pay-to Address 2") { }

            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }

            // Totals for RDLC
            column(TotalCgstAmt; TotalCgstAmt) { }
            column(TotalSgstAmt; TotalSgstAmt) { }
            column(TotalIgstAmt; TotalIgstAmt) { }
            column(GrandTotalAmt; GrandTotalAmt) { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ItemNo_; "No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Quantity; Quantity) { }
                column(Line_Amount; "Line Amount") { }

                column(LineCGSTAmt; CGSTAmt) { }
                column(LineSGSTAmt; SGSTAmt) { }
                column(LineIGSTAmt; IGSTAmt) { }
                column(LineTotalAmt; LineTotalAmt) { }

            }
            trigger OnAfterGetRecord()
            var
                purchLine: Record "Purchase Line";
            begin
                // Reset per line
                // Clear(CGSTAmt);
                // Clear(SGSTAmt);
                // Clear(IGSTAmt);
                // Clear(LineTotalAmt);
                // if purchLined
                // purchLine.SetRange();

                TaxTransactionValue.Reset();
                TaxTransactionValue.SetRange("Tax Record ID", "Purchase Line".RecordId);
                TaxTransactionValue.SetRange("Tax Type", 'GST');
                TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                TaxTransactionValue.SetFilter(Percent, '<>%1', 0);

                if TaxTransactionValue.FindSet() then begin
                    Message('CGST: %1, SGST: %2, IGST: %3, LineTotalAmt: %4, GrandTotalAmt: %5', CGSTAmt, SGSTAmt, IGSTAmt, LineTotalAmt, GrandTotalAmt);
                    repeat
                        case TaxTransactionValue."Value ID" of
                            2:
                                begin
                                    CGSTAmt := Round(TaxTransactionValue.Amount, 0.01);
                                    TotalCgstAmt += CGSTAmt;
                                end;
                            3:
                                begin
                                    IGSTAmt := Round(TaxTransactionValue.Amount, 0.01);
                                    TotalIgstAmt += IGSTAmt;
                                end;

                            6:
                                begin
                                    SGSTAmt := Round(TaxTransactionValue.Amount, 0.01);
                                    TotalSgstAmt += SGSTAmt;
                                end;
                        end;
                        LineTotalAmt += CGSTAmt + SGSTAmt + IGSTAmt + "Purchase Line"."Line Amount";
                    until TaxTransactionValue.Next() = 0;
                    GrandTotalAmt += LineTotalAmt; // + "Purchase Line"."Line Amount"
                end;
                Message('CGST: %1, SGST: %2, IGST: %3, LineTotalAmt: %4, GrandTotalAmt: %5', CGSTAmt, SGSTAmt, IGSTAmt, LineTotalAmt, GrandTotalAmt);
            end;

            trigger OnPreDataItem()
            begin
                // Reset totals per document
                TotalCgstAmt := 0;
                TotalSgstAmt := 0;
                TotalIgstAmt := 0;
                GrandTotalAmt := 0;

                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }

    var
        CompanyInfo: Record "Company Information";
        TaxTransactionValue: Record "Tax Transaction Value";


        // line vars
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        LineTotalAmt: Decimal;

        // totals
        TotalCgstAmt: Decimal;
        TotalSgstAmt: Decimal;
        TotalIgstAmt: Decimal;
        GrandTotalAmt: Decimal;
}
