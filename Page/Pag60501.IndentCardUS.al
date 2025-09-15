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
                    ApplicationArea = all; // helps to make (fields / button) any thing on ui visible
                    Editable = false;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        Vendor: Record Vendor;
                    begin
                        Vendor.Reset();
                        Vendor.SetRange("No.", Rec."Vendor No");
                        if Vendor.FindFirst() then begin
                            Rec."Vendor Name" := Vendor.Name;
                            Rec."Order Date" := Today;
                        end;
                    end;
                }
                field("Vendor Name"; Rec."Vendor Name")
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
                    Editable = false;
                }
                field("Purchase Quote Created"; Rec."Purchase Quote Created")
                {
                    ApplicationArea = all;
                    Editable = false;
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
            action("ReOpen")
            {
                Image = ReOpen;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Enabled = Rec.Status = Rec.Status::Release;
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Release then begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                    end;
                end;
            }
            action("Release")
            {
                Image = ReleaseDoc;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Enabled = Rec.Status = Rec.Status::Open;
                trigger OnAction()
                var
                    Indentline: Record IndentLineUS;
                begin
                    Rec.TestField("Order Date");
                    Rec.TestField("Vendor No");
                    Rec.TestField("Vendor Name");
                    Rec.Status := Rec.Status::Release;
                    Indentline.Init();
                    Indentline.SetRange("Document No", Rec.No);
                    if Indentline.FindSet() then begin
                        repeat
                            Indentline.TestField("Item No");
                            Indentline.TestField("Item Quantity");
                            Indentline.TestField("Item Unit Price");
                            Indentline.TestField("Vendor No 1");
                            Indentline.TestField("Vendor No 2");
                            Indentline.TestField("Vendor No 3");
                        until Indentline.Next() = 0;
                    end;
                    Rec.Modify();
                end;
            }
            action("Create Purchase Quote")
            {
                Image = Create;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Enabled = Rec.Status = Rec.Status::Release;

                trigger OnAction()
                var
                    PurchaseOrder: Record "Purchase Header";
                    PurchaseLines: Record "Purchase Line";
                    IndentLines: Record IndentLineUS;
                    noseries: Codeunit "No. Series";
                    purchpaysetup: Record "Purchases & Payables Setup";
                begin
                    if not Rec."Purchase Quote Created" then begin
                        // for Vendor 1
                        IndentLines.Reset();
                        IndentLines.SetRange("Document No", Rec.No);
                        PurchaseLines.Init();

                        if IndentLines.FindSet() then begin
                            repeat
                                purchpaysetup.Get();
                                PurchaseOrder.Init();
                                PurchaseOrder."Document Type" := PurchaseOrder."Document Type"::Quote;
                                PurchaseOrder."No." := noseries.GetNextNo(purchpaysetup."Quote Nos.");

                                // PurchaseOrder.Validate("No.");
                                PurchaseOrder.Insert();
                                PurchaseOrder."Order Date" := Rec."Order Date";
                                PurchaseLines.Init();

                                PurchaseOrder."Indent No" := Rec.No;
                                PurchaseOrder."Buy-from Vendor No." := IndentLines."Vendor No 1";
                                PurchaseOrder.Validate("Buy-from Vendor No.");
                                // adding purchase lines to the purchase quote
                                PurchaseLines."Document Type" := PurchaseOrder."Document Type";
                                PurchaseLines."Document No." := PurchaseOrder."No.";
                                PurchaseLines."Line No." := GetLastNo(PurchaseOrder);
                                PurchaseLines.Type := PurchaseLines.Type::Item;
                                PurchaseLines.Quantity := IndentLines."Item Quantity";

                                PurchaseLines.Insert();
                                PurchaseLines."Buy-from Vendor No." := IndentLines."Vendor No 1";
                                PurchaseLines."No." := IndentLines."Item No";
                                PurchaseLines.Modify();
                                PurchaseOrder.Modify();
                                Message('Purchase quote created Successfully %1', PurchaseOrder."No.");
                            until IndentLines.Next() = 0;
                        end;

                        // for vendor 2
                        IndentLines.Reset();
                        IndentLines.SetRange("Document No", Rec.No);

                        if IndentLines.FindSet() then begin
                            repeat
                                purchpaysetup.Get();
                                PurchaseOrder.Init();
                                PurchaseOrder."Document Type" := PurchaseOrder."Document Type"::Quote;
                                PurchaseOrder."No." := noseries.GetNextNo(purchpaysetup."Quote Nos.");

                                // PurchaseOrder.Validate("No.");
                                PurchaseOrder.Insert();
                                PurchaseOrder."Order Date" := Rec."Order Date";
                                PurchaseLines.Init();

                                PurchaseOrder."Indent No" := Rec.No;
                                PurchaseOrder."Buy-from Vendor No." := IndentLines."Vendor No 2";
                                PurchaseOrder.Validate("Buy-from Vendor No.");
                                // adding purchase lines to the purchase quote
                                PurchaseLines."Document Type" := PurchaseOrder."Document Type";
                                PurchaseLines."Document No." := PurchaseOrder."No.";
                                PurchaseLines."Line No." := GetLastNo(PurchaseOrder);
                                PurchaseLines.Type := PurchaseLines.Type::Item;
                                PurchaseLines.Quantity := IndentLines."Item Quantity";

                                PurchaseLines.Insert();
                                PurchaseLines."Buy-from Vendor No." := IndentLines."Vendor No 2";
                                PurchaseLines."No." := IndentLines."Item No";
                                PurchaseLines.Modify();
                                PurchaseOrder.Modify();
                                Message('Purchase quote created Successfully %1', PurchaseOrder."No.");
                            until IndentLines.Next() = 0;
                        end;

                        // for Vendor 3
                        IndentLines.Reset();
                        IndentLines.SetRange("Document No", Rec.No);
                        PurchaseLines.Init();

                        if IndentLines.FindSet() then begin
                            repeat
                                purchpaysetup.Get();
                                PurchaseOrder.Init();
                                PurchaseOrder."Document Type" := PurchaseOrder."Document Type"::Quote;
                                PurchaseOrder."No." := noseries.GetNextNo(purchpaysetup."Quote Nos.");

                                // PurchaseOrder.Validate("No.");
                                PurchaseOrder.Insert();
                                PurchaseOrder."Order Date" := Rec."Order Date";
                                PurchaseLines.Init();

                                PurchaseOrder."Indent No" := Rec.No;
                                PurchaseOrder."Buy-from Vendor No." := IndentLines."Vendor No 3";
                                PurchaseOrder.Validate("Buy-from Vendor No.");
                                // adding purchase lines to the purchase quote
                                PurchaseLines."Document Type" := PurchaseOrder."Document Type";
                                PurchaseLines."Document No." := PurchaseOrder."No.";
                                PurchaseLines."Line No." := GetLastNo(PurchaseOrder);
                                PurchaseLines.Type := PurchaseLines.Type::Item;
                                PurchaseLines.Quantity := IndentLines."Item Quantity";

                                PurchaseLines.Insert();
                                PurchaseLines."Buy-from Vendor No." := IndentLines."Vendor No 3";
                                PurchaseLines."No." := IndentLines."Item No";
                                PurchaseLines.Modify();
                                PurchaseOrder.Modify();
                                Message('Purchase quote created Successfully %1', PurchaseOrder."No.");
                            until IndentLines.Next() = 0;
                        end;
                        Rec."Purchase Quote Created" := true;
                    end else begin
                        Error('Purchase Quotes already created!');
                    end;
                end;
            }
            // action("Post")
            // {
            //     Image = Post;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     ApplicationArea = all;

            //     trigger OnAction()
            //     var
            //         PurchaseOrder: Record "Purchase Header";
            //         PurchaseLines: Record "Purchase Line";
            //         IndentLines: Record IndentLineUS;
            //     begin
            //         IndentLines.Reset();
            //         IndentLines.SetRange("Document No", Rec.No);
            //         if IndentLines.FindSet() then begin
            //             PurchaseOrder.Init();
            //             PurchaseLines.Init();

            //         end;

            //     end;
            // }
        }
    }

    procedure GetLastNo(purcHdr: Record "Purchase Header"): Integer
    var
        PurchLine: Record "Purchase Line";
        LineNo: Integer;
    begin
        PurchLine.Reset();
        PurchLine.SetRange("Document Type", purcHdr."Document Type");
        PurchLine.SetRange("Document No.", purcHdr."No.");
        if PurchLine.FindLast() then
            LineNo += PurchLine."Line No." + 10000
        else
            LineNo := 10000;

        exit(LineNo);
    end;

    var
        myInt: Integer;
}