page 50100 ListPageTest
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TestTable;


    layout
    {

        area(Content)
        {
            repeater(GroupName)
            {
                field(Name; Rec.SystemCode) { ApplicationArea = All; }
                field(value; Rec.SystemType) { ApplicationArea = All; }
                field(cdate; Rec.SystemCreatedAt) { ApplicationArea = All; }
                field(username; GlobalFunctions.ReturnUserName(Rec.SystemCreatedBy)) { ApplicationArea = All; } //variable, triggers a function in a codeunit and sending a parameter
                field(cuser; Rec.SystemCreatedBy) { ApplicationArea = All; }

            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Import Excel")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    excelImport.Run();
                end;
            }
        }
    }

    var
        GlobalFunctions: Codeunit GlobalFunctions;
        excelImport: Codeunit ImportExcel;

    trigger OnOpenPage();
    var
    begin
        //excelImport.Run();
    end;

}
