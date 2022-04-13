codeunit 50102 ImportExcel
{
    trigger OnRun()
    begin
        PrepareExcel(1);
    end;

    procedure PrepareExcel(selectType: Integer)
    var
        Excelbuffer: Record "Excel Buffer";
        ServerFileName: Text;
        FileManagement: Codeunit "File Management";
        UploadResult: Boolean;
        UploadIntoStream: InStream;
        NVInStream: InStream;
        DialogCaption: Text;
        Name: Text;
        Sheetname: Text;
        Rec_ExcelBuffer: Record "Excel Buffer";
        Rows: Integer;
        Columns: Integer;
        RowNo: Integer;

    begin
        //select and read a file
        UploadResult := UploadIntoStream(DialogCaption, '', '', Name, NVInStream);
        Sheetname := Rec_ExcelBuffer.SelectSheetsNameStream(NVInStream);
        Rec_ExcelBuffer.Reset();
        Rec_ExcelBuffer.OpenBookStream(NVInStream, Sheetname);
        Rec_ExcelBuffer.ReadSheet();
        Commit();

        //count total rows
        Rec_ExcelBuffer.Reset();
        Rec_ExcelBuffer.SetRange("Column No.", 1);
        if Rec_ExcelBuffer.FindFirst() then
            repeat
                Rows := Rows + 1;
            until Rec_ExcelBuffer.Next() = 0;

        //count total columns
        Rec_ExcelBuffer.Reset();
        Rec_ExcelBuffer.SetRange("Row No.", 1);
        if Rec_ExcelBuffer.FindFirst() then
            repeat
                Columns := Columns + 1;
            until Rec_ExcelBuffer.Next() = 0;

        for RowNo := 2 to Rows do begin
            case selectType of
                1:
                    begin
                        TestImportExcel((RowNo));
                    end;
            end;
        end;
    end;

    local procedure GetValueAtIndex(RowNo: Integer; ColNo: Integer): Text
    var
        Rec_ExcelBuffer: Record "Excel Buffer";
    begin
        Rec_ExcelBuffer.Reset();
        If Rec_ExcelBuffer.Get(RowNo, ColNo) then
            exit(Rec_ExcelBuffer."Cell Value as Text");
    end;

    local procedure TestImportExcel(lRowNo: Integer)
    begin
        message(GetValueAtIndex(lRowNo, 1));
    end;
}