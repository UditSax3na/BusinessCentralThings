page 60502 IndentLineUS
{
    PageType = ListPart;
    UsageCategory = Lists;
    SourceTable = IndentLineUS;

    layout
    {
        area(Content)
        {
            repeater(LinePage)
            {
                field("Item No"; Rec."Item No")
                {
                    Caption = 'No';
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        Item_: Record Item;
                    begin
                        Clear(Rec."Item Description");
                        Item_.Reset();
                        Item_.SetRange("No.", Rec."Item No");
                        if Item_.FindFirst() then begin
                            Rec."Item Description" := Item_.Description;
                            Rec."Item UOM" := Item_."Base Unit of Measure";
                        end;
                    end;

                }
                field("Item Description"; Rec."Item Description")
                {
                    Caption = 'Description';
                    ApplicationArea = all;
                }
                field("Item UOM"; Rec."Item UOM")
                {
                    Caption = 'UOM';
                    ApplicationArea = all;
                }
                field("Item Quantity"; Rec."Item Quantity")
                {
                    Caption = 'Quantity';
                    ApplicationArea = all;
                }
                field("Item Unit Price"; Rec."Item Unit Price")
                {
                    Caption = 'Unit Price';
                    ApplicationArea = all;
                }
                field("Vendor No 1"; Rec."Vendor No 1")
                {
                    Caption = 'Vendor 1';
                    ApplicationArea = all;
                }
                field("Vendor No 2"; Rec."Vendor No 2")
                {
                    Caption = 'Vendor 2';
                    ApplicationArea = all;
                }
                field("Vendor No 3"; Rec."Vendor No 3")
                {
                    Caption = 'Vendor 3';
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()

                begin

                end;
            }
        }
    }
}