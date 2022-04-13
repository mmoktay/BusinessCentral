codeunit 50100 GlobalFunctions
{
    trigger OnRun()
    begin

    end;

    var

    procedure ReturnUserName(UserGuid: Guid): Text //UserGuid is the parameter, Text is the return format
    var
        User: Record User;
    begin
        User.Get(UserGuid);
        exit(User."User Name");
    end;

}