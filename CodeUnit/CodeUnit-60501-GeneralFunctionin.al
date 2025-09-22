codeunit 60501 GeneralFunctionInUS
{
    trigger OnRun()
    begin
        GetCustomer();
    end;

    procedure GetCustomer()
    var
        CustomerRec: Record Customer;
    begin
        CustomerRec.Reset();
        CustomerRec.CalcFields("Balance (LCY)");
        CustomerRec.SetFilter("Balance (LCY)", '<%1', 0.0);
        if CustomerRec.FindSet() then begin
            repeat
                CustomerRec."Set Color Red" := true;
                CustomerRec.Modify();
            until CustomerRec.Next() = 0;
        end;
    end;

    var
        myInt: Integer;
}