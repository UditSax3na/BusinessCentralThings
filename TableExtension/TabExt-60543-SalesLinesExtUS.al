tableextension 60543 SalesLinesExtUS extends "Sales Line"
{
    fields
    {
        field(60000; BarCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(60001; PreviousValue; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}