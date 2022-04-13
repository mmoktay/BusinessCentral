codeunit 50101 Events
{
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Table, Database::"TestTable", 'OnAfterInsertEvent', '', true, true)]
    local procedure TestTable_OnAfterInsert(var Rec: Record TestTable; RunTrigger: Boolean)
    begin
        Message('event test succesfull');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterReleaseSalesDoc', '', true, true)]
    local procedure OnAfterRelease_SalesHeader(var SalesHeader: Record "Sales Header")
    begin

    end;
}
