report 60538 "SalesInvoicesReoprtsUS"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports/SalesInvoicesReportsUS.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            column(CompanyInfoPic; CompanyInfo.Picture) { }
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(Sell_to_Address; "Sell-to Address") { }
            column(Order_Date; "Order Date") { }
            column(Order_No_; "Order No.") { }
            column(Bal__Account_No_; "Bal. Account No.") { }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                column(Quantity; Quantity) { }
                column(IC_Partner_Code; "IC Partner Code") { }
                column(Description; Description) { }

            }
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}