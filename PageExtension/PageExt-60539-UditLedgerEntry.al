pageextension 60539 MyExtension extends "Item Card"
{
    layout
    {
        addafter(Inventory)
        {
            field(TotalAmountULE; Rec.TotalAmountULE)
            {
                ApplicationArea = all;
            }
        }
    }
}