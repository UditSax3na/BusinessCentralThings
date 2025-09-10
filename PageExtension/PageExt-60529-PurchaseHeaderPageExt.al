pageextension 60529 PurchaseHeaderPageExt extends "Purchase Quotes"
{
    layout
    {
        addafter(Status)
        {
            field("Indent No"; Rec."Indent No")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}

pageextension 60530 PurchaseHeaderPageCardExt extends "Purchase Quote"
{
    layout
    {
        addafter(Status)
        {
            field("Indent No"; Rec."Indent No")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}