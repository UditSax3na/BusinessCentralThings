pageextension 60537 GeneralJournalExtUS extends "General Journal"
{
    layout
    {
        addafter(Description)
        {
            field("Narration"; Rec.Narration)
            {
                ApplicationArea = all;
            }
        }
    }
}