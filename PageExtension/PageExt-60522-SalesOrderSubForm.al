pageextension 60540 SalesOrderSubformLabelAddInExt extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(PreviousValue; Rec.PreviousValue)
            {
                Caption = 'Previous Value';
                ApplicationArea = all;
                Editable = false;
            }
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                PostedSales: Record "Sales Invoice Header";
                PostedSalesLines: Record "Sales Invoice Line";
                Response: Boolean;
            begin
                PostedSales.Reset();
                PostedSalesLines.Reset();
                PostedSales.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                if PostedSales.FindLast() then begin
                    PostedSalesLines.SetRange("No.", Rec."No.");
                    if PostedSalesLines.FindLast() then begin
                        Rec.PreviousValue := PostedSalesLines."Unit Price";
                        Response := Confirm(StrSubstNo('Previous Amount: %1', PostedSalesLines."Unit Price"), false);
                        case Response of
                            true:
                                Rec."Unit Price" := PostedSalesLines."Unit Price"
                        end;
                    end;
                end;
                Rec.Modify();
            end;
        }

    }
    actions
    {

    }
}