pageextension 60535 TextFieldCardUs extends "General Journal Batches"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Text US"; Rec."Narration")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}