// pageextension 60538 PurchaseInvoiceUS extends "Purchase Invoice"
// {
//     layout
//     {
//         // Add changes to page layout here
//     }

//     actions
//     {
//         // Add changes to page actions here
//         addafter(Post)
//         {
//             action("Print Purchase Invoices")
//             {
//                 ApplicationArea = all;
//                 Promoted = true;
//                 PromotedCategory = Report;
//                 trigger OnAction()
//                 var
//                     // CurrentRec: Record "Sales Invoice Header";
//                     CurrentRec: Record "Purchase Header";
//                     Tempblob: Codeunit "Temp Blob";
//                     PurchaseOrderReport: Report "Purchase Order Report US";
//                     filename: text;
//                     OutStrm: OutStream;
//                     InStrm: InStream;
//                     RecRef: RecordRef;
//                 begin
//                     if CurrentRec.Get() then begin
//                         CurrentRec.SetRange("No.", Rec."No.");
//                         if CurrentRec.FindFirst() then begin
//                             RecRef.GetTable(CurrentRec);
//                             // RecRef.SetTable(CurrentRec);
//                             Tempblob.CreateOutStream(OutStrm);
//                             Report.SaveAs(60532, '', ReportFormat::Excel, OutStrm, RecRef);
//                             Tempblob.CreateInStream(InStrm);
//                             filename := 'purchase-Invoice_' + Rec."No." + '.xlsx';
//                             DownloadFromStream(InStrm, '', '', '', filename);
//                         end;
//                     end else
//                         Message('Some Error occured');

//                 end;
//             }
//         }
//     }

//     var
//         myInt: Integer;
// }

// ------------ New Code ----------------

// pageextension 60538 PurchaseInvoiceUS extends "Purchase Invoice"
// {
//     actions
//     {
//         addafter(Post)
//         {
//             action("Print Purchase Invoices")
//             {
//                 ApplicationArea = All;
//                 Promoted = true;
//                 PromotedCategory = Report;

//                 trigger OnAction()
//                 var
//                     CurrentRec: Record "Purchase Header";
//                     TempBlob: Codeunit "Temp Blob";
//                     filename: Text;
//                     OutStrm: OutStream;
//                     InStrm: InStream;
//                     RecRef: RecordRef;
//                 begin
//                     // Use Get instead of SetRange + FindFirst for efficiency
//                     if CurrentRec.Get(Rec."Document Type", Rec."No.") then begin
//                         RecRef.GetTable(CurrentRec);

//                         TempBlob.CreateOutStream(OutStrm);
//                         Report.SaveAs(Report::"Purchase Order Report US", '', ReportFormat::Excel, OutStrm, RecRef);

//                         TempBlob.CreateInStream(InStrm);
//                         filename := 'purchase-invoice_' + Rec."No." + '.xlsx';
//                         DownloadFromStream(InStrm, '', '', '', filename);
//                     end else
//                         Message('Purchase Header not found for this invoice.');
//                 end;
//             }
//         }
//     }
// }


// ---------------- New Code -------------------
pageextension 60538 PurchaseInvoiceUS extends "Purchase Invoice"
{
    actions
    {
        addafter(Post)
        {
            action("Print Purchase Invoice (US)")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader.Reset();
                    if PurchaseHeader.Get('Invoice', Rec."No.") then begin
                        Report.RunModal(60532, true, false, PurchaseHeader);
                    end else
                        Message('Purchase Header not found for this invoice.');
                end;
            }
        }
    }
}
