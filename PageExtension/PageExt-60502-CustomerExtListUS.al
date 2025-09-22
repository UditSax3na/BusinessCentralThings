pageextension 60502 CustomerExtListUS extends "Customer List"
{
    layout
    {
        modify("Balance (LCY)")
        {
            StyleExpr = StyleExpUnFav;
        }
        addlast(Content)
        {
            usercontrol(Toast; "ToastAddIn")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(ShowToastMsg)
            {
                ApplicationArea = All;
                Caption = 'Show Toast';
                trigger OnAction()
                begin
                    // Params: Title, Message, Type, Position ("left"/"right")
                    CurrPage.Toast.ShowToast('Success!', 'Customer created successfully.', 'success', 'right');
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Clear(StyleExpUnFav);
        Rec.CalcFields("Balance (LCY)");

        // Code by kushi sir
        if Rec.Balance < 0 then // Condition to onlyfilter those record which doesn't
            StyleExpUnFav := 'Unfavorable';
        // Rec.CalcFields("Set Color Red");

        // if Rec."Set Color Red" then begin
        //     StyleExpUnFav := 'Unfavorable';
        //     Rec.Modify();
        // end;
    end;

    var
        StyleExpUnFav: Text;
}