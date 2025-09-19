reportextension 60522 StandardLayoutExtUS extends 1305
{
    dataset
    {
        add(Header)
        {
            column(Sources_of_Sales; "Sources of Sales") { }
        }
        add(Line)
        {
            column(BarCode; BarCode) { }
        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'Reports/StandardLayoutConfirmationPage.rdl';
        }
    }
}