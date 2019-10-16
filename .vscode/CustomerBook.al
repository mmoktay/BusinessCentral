tableextension 50100 CustomerBookExtension extends Customer //MyTargetTableId
{
    fields
    {
        field(50100; "Favorite Book No."; Code[20])
        {
            Caption = 'Favorite Book No.';
            DataClassification = ToBeClassified;
        }
    }
}