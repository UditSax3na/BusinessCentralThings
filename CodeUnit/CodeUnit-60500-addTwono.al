codeunit 60500 AddTwoNoUS
{
    trigger OnRun()
    var
        result: Integer;
    begin
        A := 12;
        B := 12;
        // str:= StrSubstNo()
        result := MyProcedure(A, B);
        Message('the addition of %1 and %2 : %3', A, B, result);
    end;

    procedure MyProcedure(A: Integer; B: Integer): Integer
    var
        result: Integer;
    begin
        result := A + B;
        exit(result);
    end;

    var
        A: Integer;
        B: Integer;
}