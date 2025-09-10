page 60500 "IndentListUS"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Indent Table";
    CardPageId = 60501;
    Caption = 'Indent List US';

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
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = all;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = all;
                }
                field("Purchase Quote Created"; Rec."Purchase Quote Created")
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