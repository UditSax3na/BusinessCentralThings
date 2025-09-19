pageextension 60529 PurchaseHeaderPageExtUS extends "Purchase Quotes"
{
    layout
    {
        addafter(Status)
        {
            field("Indent No"; Rec."Indent No")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}

pageextension 60530 PurchaseHeaderPageCardExt extends "Purchase Quote"
{
    layout
    {
        addafter(Status)
        {
            field("Indent No"; Rec."Indent No")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        addafter(Print)
        {
            action("Direct Print Purchase Order Report US")
            {
                Caption = 'Direct Download Report US';
                ApplicationArea = all;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    ReportPurchaseOrder: Report "Purchase Order Report US";
                    filename: Text;
                    Outstrm: OutStream; // created this variable to write data
                    Instrm: InStream; // Created this variable to read data
                    RecRef: RecordRef;
                    FormateChoice: Integer; // defined for options
                    ReportFormatChoosen: ReportFormat; // define the format of the report
                begin
                    Rec.Reset();
                    Rec.SetRange("No.", Rec."No.");
                    if Rec.FindFirst() then begin
                        RecRef.GetTable(Rec);
                        FormateChoice := Dialog.StrMenu('PDF,Excel,Word', 1, 'Choose Format Of Report'); // menu window that shows options.
                        // options given here that a user will chose while printing.
                        case FormateChoice of
                            1:
                                ReportFormatChoosen := ReportFormat::Pdf;
                            2:
                                ReportFormatChoosen := ReportFormat::Excel;
                            3:
                                ReportFormatChoosen := ReportFormat::Word;
                            else
                                exit; // user cancels.
                        end;
                        TempBlob.CreateOutStream(Outstrm);
                        // Report.SaveAs(60100, '', ReportFormat::Pdf, Outstrm, RecRef);
                        Report.SaveAs(60100, '', ReportFormatChoosen, Outstrm, RecRef);
                        TempBlob.CreateInStream(Instrm);
                        case FormateChoice of
                            1:
                                filename := 'PurchaseOrder_' + Rec."No." + '.pdf';
                            2:
                                filename := 'PurchaseOrder_' + Rec."No." + '.xlsx';
                            3:
                                filename := 'PurchaseOrder_' + Rec."No." + '.docx';
                        end;
                        // filename := 'PurchaseOrder_'+Rec."No."+'.pdf';
                        DownloadFromStream(Instrm, '', '', '', filename);
                    end;
                end;
            }
        }
    }
}