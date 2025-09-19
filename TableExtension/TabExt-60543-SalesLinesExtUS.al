tableextension 60543 SalesLinesExtUS extends "Sales Line"
{
    fields
    {
        // modify("No.")
        field(60000; BarCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        modify("Unit Price")
        {
            trigger OnBeforeValidate()
            // for the notification part
            var
                SalesHeader: Record "Sales Invoice Header";
                SalesLines: Record "Sales Invoice Line";
                Notificobj: Notification;
            begin
                SalesHeader.Reset();
                SalesHeader.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                Message('We are here 1, %1', SalesHeader."No.");

                if SalesHeader.FindLast() then begin
                    Message('We are here 2, %1', SalesHeader."No.");
                    SalesLines.Reset();
                    SalesLines.SetRange("Document No.", SalesHeader."No.");
                    if SalesLines.FindLast() and ("No." <> '') then begin
                        Message('We are here 3, %1', SalesHeader."No.");
                        Notificobj.Message := StrSubstNo('Previously Sold Amount %1', SalesLines."Unit Price");
                        Notificobj.Scope := NotificationScope::LocalScope;
                        Notificobj.Send();
                        Message('we are here ! %1', SalesLines."Unit Price");
                    end;
                end;
            end;
        }
    }


    // var
    //     SalesHeader: Record "Sales Header";
    // begin
    //     if SalesHeader.Get("Document Type", "Document No.") then
    //         AddNotification("Document No.", StrSubstNo('Line %1 added for item %2', "Line No.", "No."));
    // end;


    // local procedure AddNotification(DocumentNo: Code[20]; MessageText: Text[250])
    // var
    //     Notif: Record NotificTableUS;
    // begin
    //     Notif.Init();
    //     Notif."Document No." := DocumentNo;
    //     Notif."Message" := MessageText;
    //     Notif.CreatedAtTime := CurrentDateTime;
    //     Notif.Insert();
    // end;
    // trigger OnAfterInsert()
    // var
    //     Notificobj: Notification;
    // begin
    //     if (Rec."No." <> '') and (Rec.Type = Rec.Type::Item) then begin
    //         Notificobj.Message :=
    //           StrSubstNo('You selected Item %1. Last Sold Price: %2',
    //                      Rec."No.", Rec."Unit Price");

    //         Notificobj.Scope := NotificationScope::LocalScope;
    //         Notificobj.Send();
    //     end;


    //     layout
    //     {
    //         area(factboxes)
    //         {
    //             part(MyPopupPart; MyControlAddInUS) {}
    //         }
    //     }

    //     trigger OnOpenPage();
    //     begin
    //         // Show popup as soon as page opens
    //         CurrPage.MyPopupPart.InvokeExtensibilityMethod('showPopup', null);
    //     end;

    //     trigger OnAfterValidateField(FieldID : Integer);
    //     begin
    //         if FieldID = FIELD::"No." then
    //             CurrPage.MyPopupPart.InvokeExtensibilityMethod('showPopup', null);
    //     end;
}

// Old Code