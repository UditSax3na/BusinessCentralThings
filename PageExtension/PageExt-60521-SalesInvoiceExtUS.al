pageextension 60521 SalesInvoiceExtUS extends "Sales Invoice"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(NotificationList; "Notification FactBox List")
            {
                Caption = 'Notifications';
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions { }

    var
        NotifShown: Boolean;
}