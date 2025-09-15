page 60543 SelectionSeriesPageUS
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = SelectionSeriesTableUS;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No. Series Code"; Rec."No. Series Code")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

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