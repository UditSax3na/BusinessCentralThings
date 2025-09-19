pageextension 60502 CustomerExtListUS extends "Customer List"
{
    layout
    {
        modify("Balance (LCY)")
        {
            StyleExpr = StyleExpUnFav;
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    begin
        Clear(StyleExpUnFav);
        // Rec.CalcFields(Balance); 
        // if Rec.Balance < 0 then // Condition to onlyfilter those record which doesn't
        //     StyleExpUnFav := 'Unfavorable'
        // Rec.CalcFields("Set Color Red");
        if Rec."Set Color Red" then
            StyleExpUnFav := 'Unfavorable';


    end;

    var
        StyleExpUnFav: Text;
}