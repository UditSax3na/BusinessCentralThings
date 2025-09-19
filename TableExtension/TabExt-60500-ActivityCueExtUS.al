tableextension 60520 ActivityCueExtUS extends "Activities Cue"
{
    fields
    {
        field(200; "No. of posted Invoices"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Invoice Header" where("Posting Date" = field("30 Days Filter")));
        }
        field(202; TotalActiveCustomer; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Customer where(Blocked = filter('')));
        }
        field(204; "30 Days Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }
}