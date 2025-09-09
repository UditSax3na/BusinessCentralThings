page 60500 "IndentListUS"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Indent Table";
    CardPageId = 60501;

    layout
    {
        area(Content)
        {
            repeater("Indent Lines")
            {
                field(No; Rec.No)
                {
                    ApplicationArea = all;
                }
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = all;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Order Date"; Rec."Order Date")
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
            action(CheckDocsNo)
            {

                trigger OnAction()
                var
                    IndentLines: Record IndentLineUS;
                begin
                    Message('Document No: &1', IndentLines."Document No");
                end;
            }
        }
    }
}