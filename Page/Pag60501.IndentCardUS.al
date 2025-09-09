page 60501 IndentCardUS
{
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "Indent Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = Rec.Status = Rec.Status::Open;
                field(No; Rec.No)
                {
                    ApplicationArea = all; // 
                }
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        Customer: Record Customer;
                    begin
                        Customer.Reset();
                        Customer.SetRange("No.", Rec."Customer No");
                        if Customer.FindFirst() then begin
                            Rec."Customer Name" := Customer.Name;
                        end;
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = all;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = all;
                }
            }
            part(Lines; IndentLineUS)
            {
                Editable = Rec.Status = Rec.Status::Open;
                Caption = 'Items';
                ApplicationArea = all;
                SubPageLink = "Document No" = field(No);
                UpdatePropagation = Both; // 
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Purchase Quote")
            {
                Image = Create;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Enabled = Rec.Status = Rec.Status::Release;

                /*
                trigger OnAction()
                var
                    PurchaseOrder: Record "Purchase Header";
                    IndentLines: Record IndentLineUS;
                begin
                    // Filter Indent Lines for this Indent
                    IndentLines.SetRange("Document No", Rec.No);

                    if not IndentLines.FindFirst() then begin
                        Message('No Indent Lines found for %1', Rec.No);
                        exit;
                    end;

                    // Initialize Purchase Header
                    PurchaseOrder.Reset();
                    PurchaseOrder.Init();
                    if IndentLines.FindFirst() then begin
                        PurchaseOrder."Document Type" := PurchaseOrder."Document Type"::Quote;
                        PurchaseOrder."Order Date" := Rec."Order Date";
                        PurchaseOrder."Buy-from Vendor No." := IndentLines."Vendor No 1";
                        PurchaseOrder.Validate("Buy-from Vendor No.");
                        // Insert only once
                        PurchaseOrder.Insert(true);
                    end;

                    // Now open the Purchase Quote page
                    Commit(); // Make sure it's committed before running the page
                    Page.RunModal(Page::"Purchase Quote", PurchaseOrder);
                end;
                */

                // old code

                trigger OnAction()
                var
                    PurchaseOrder: Record "Purchase Header";
                    IndentLines: Record IndentLineUS;
                begin
                    PurchaseOrder.Reset();
                    PurchaseOrder.Init();
                    PurchaseOrder."Document Type" := PurchaseOrder."Document Type"::Quote;
                    PurchaseOrder."Order Date" := Rec."Order Date";
                    IndentLines.SetRange("Document No", Rec.No);
                    if IndentLines.FindFirst() then begin
                        PurchaseOrder."Buy-from Vendor No." := IndentLines."Vendor No 1";
                        PurchaseOrder.Validate("Buy-from Vendor No.");
                        PurchaseOrder.Modify();
                    end;
                    PurchaseOrder.Insert();
                    // if PurchaseOrder.Insert() then begin
                    //     Commit();
                    //     Page.RunModal(Page::"Purchase Quote", PurchaseOrder);
                    // end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}