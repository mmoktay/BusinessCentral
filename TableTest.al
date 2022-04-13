table 50100 TestTable
{
    fields
    {
        field(1; EntryNo; Integer) { AutoIncrement = true; Editable = false; }
        field(2; SystemCode; Code[20]) { }
        field(3; SystemType; Option) { OptionMembers = "Default","User Specified"; }
    }

    keys
    {
        key(Key1; EntryNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}