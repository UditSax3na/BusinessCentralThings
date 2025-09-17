tableextension 60543 SalesLinesExtUS extends "Sales Line"
{
    fields
    {
        //     modify("Unit Price")
        //     {
        //         trigger OnBeforeValidate()
        //         var
        //             SalesHeader: Record "Sales Invoice Header";
        //             SalesLines: Record "Sales Invoice Line";
        //             // LastPrice: Decimal;
        //             Notificobj: Notification;
        //         begin
        //             if rec."Unit Price" <> xRec."Unit Price" then begin

        //                 SalesHeader.Reset();
        //                 SalesHeader.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");

        //                 // Items
        //                 if SalesHeader.FindLast() then begin
        //                     SalesLines.Reset();
        //                     SalesLines.SetRange("Document No.", SalesHeader."No."); // i did somethings
        //                     if SalesLines.FindLast() and ("No." <> '') then begin
        //                         NotifShown := True;
        //                         Notificobj.Message := StrSubstNo('Previously Sold Amount %1', SalesLines."Unit Price");
        //                         Notificobj.Scope := NotificationScope::LocalScope;
        //                         Notificobj.Send();
        //                     end;
        //                 end;
        //             end;
        //         end;
        //     }

        modify("No.")
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

                if SalesHeader.FindLast() then begin
                    SalesLines.Reset();
                    SalesLines.SetRange("Document No.", SalesHeader."No."); // i did something
                    if SalesLines.FindLast() and ("No." <> '') then begin
                        Notificobj.Message := StrSubstNo('Previously Sold Amount %1', SalesLines."Unit Price");
                        Notificobj.Scope := NotificationScope::LocalScope;
                        Notificobj.Send();

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