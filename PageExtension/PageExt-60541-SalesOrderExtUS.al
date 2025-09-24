pageextension 60542 SalesOrderExtUS extends "Sales Order"
{
    layout
    {
        addfirst(factboxes)
        {
            part(SalesLineFactbox; SalesLineFactbox)
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No."), "Document Type" = FIELD("Document Type");//, "Line No." = FIELD("Line No.");
            }
        }
        addafter(Status)
        {
            field("Sources of Sales"; Rec."Sources of Sales")
            {
                ApplicationArea = all;
            }
            field("Royality Amount"; Rec."Royality Amount")
            {
                ApplicationArea = all;
            }
            field("Terms and Conditions"; Rec."Terms and Conditions")
            {
                ApplicationArea = all;
            }
            field("Ref No."; Rec."Ref No.")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                NoSeries: Record "No. Series";
            begin
                // Message('Before Action!');
            end;
        }
        // addafter(Post)
        // {

    }
    // }

    var
        SalesLines: Record "Sales Line";
}

// pageextension 50100 SalesOrderExt extends "Sales Order"
// {
//     layout
//     {
//         addlast(Content)
//         {
//             control(ToastControl, "ToastNotificationAddIn")
//             {
//                 ApplicationArea = All;
//             }
//         }
//     }

//     var
//         ToastControl: "ToastNotificationAddIn";

//     trigger OnAfterGetRecord();
//     begin
//         // Example: show toast when a line is selected
//         if "Sales Lines".Rec."No." <> '' then
//             ToastControl.Invoke('ShowToastFromAL', 'Item selected: ' + "Sales Lines".Rec.Description);
//     end;
// }
