// codeunit 60537 Gjthings
// {
//     /*
//         EventSubscriber take 
//         - `ObjectType` => Defines what type of object raises the event.
//         - `Database` => Specifies the ID or name of the object where the event originates.
//         - `EventName` => The name of the event being subscribed to.
//         - `ElementName` => This specifies the element within the object where the event originates.
//         - `SkipOnMissingLicense` => Defines what happens if the license does not include the publisher object.
//         - `SkipOnMissingPermission` => Defines what happens if the user does not have permission to access the publisher object.
//     */
//     [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
//     local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")
//     begin

//     end;
// }