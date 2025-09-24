pageextension 60503 SalesOrderExt extends "Sales Order"
{
    layout
    {
        // addafter(SalesLines)  // This references the Sales Lines part
        // {
        //     part(SalesChart; MyCustomControl)
        //     {
        //         ApplicationArea = All;
        //     }
        // }
    }
    var
        myInt: Integer;
}
