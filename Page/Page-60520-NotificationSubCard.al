page 60520 "Notification FactBox List"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = NotificTableUS;
    Caption = 'Notifications';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CreatedAtTime; Rec.CreatedAtTime) { ApplicationArea = All; }
                field(Message; Rec.Message) { ApplicationArea = All; }
            }
        }
    }
}
