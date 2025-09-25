pageextension 60540 SalesOrderSubformLabelAddInExt extends "Sales Order Subform"
{
    layout
    {
        addfirst(content)
        {
            usercontrol(PopupArea; SampleAddin)
            {
                ApplicationArea = All;
                Visible = FlagBoolean;
                trigger popUpClosed()
                begin
                    Message('This is the flag boolean: %1', FlagBoolean);
                    FlagBoolean := FlagBoolean ? false : true;
                    CurrPage.Update(); // i think there is no need be update the record
                    Message('This is the flag boolean: %1', FlagBoolean);
                end;
            }
        }
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
            begin
                FlagBoolean := FlagBoolean ? false : true;
                CurrPage.Update(false);
                PostedSales.Reset();
                PostedSalesLines.Reset();
                PostedSales.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                if PostedSales.FindLast() then begin
                    PostedSalesLines.SetRange("No.", Rec."No.");
                    if PostedSalesLines.FindLast() then begin
                        Rec.PreviousValue := PostedSalesLines."Unit Price";
                        CurrPage.PopupArea.showPopup(StrSubstNo('Previous Amount %1', Rec.PreviousValue));
                    end;
                end;
                Rec.Modify();
                CurrPage.Update(false); // i think there is no need be update the record
            end;
        }
    }
    actions
    {
        addafter("&Line")
        {
            // action(ToggleButton)
            // {
            //     Caption = 'Show/Hide Control Panel';
            //     ApplicationArea = all;
            //     trigger OnAction()
            //     begin
            //         Message('This is the flag boolean: %1', FlagBoolean);
            //         FlagBoolean := FlagBoolean ? false : true;
            //         CurrPage.Update(); // i think there is no need be update the record
            //         Message('This is the flag boolean: %1', FlagBoolean);
            //     end;
            // }
        }
    }
    var
        FlagBoolean: Boolean;
}