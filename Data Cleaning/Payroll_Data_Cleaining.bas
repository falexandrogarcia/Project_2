Attribute VB_Name = "Module1"
Sub KGA_Labor_Formatting()
Attribute KGA_Labor_Formatting.VB_ProcData.VB_Invoke_Func = " \n14"
'
' KGA_Labor_Formatting Macro
'

'
    Columns("A:A").Select
    Selection.Insert Shift:=xlToRight
    Cells.Find(What:="Data up to date", After:=ActiveCell, LookIn:= _
        xlFormulas2, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:= _
        xlNext, MatchCase:=False, SearchFormat:=False).Activate
    Selection.End(xlToLeft).Select
    ActiveCell.FormulaR1C1 = "=RIGHT(RC[1],LEN(RC[1])-FIND("":"",RC[1])-1)"
    ActiveCell.Offset(1, 0).FormulaR1C1 = "=LEFT(R[-1]C,FIND("":"",R[-1]C)-3)"
    Cells.Find(What:="Name", After:=ActiveCell, LookIn:= _
        xlFormulas2, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:= _
        xlNext, MatchCase:=False, SearchFormat:=False).Activate
    Selection.End(xlToLeft).Select
    ActiveCell.FormulaR1C1 = "Date"
    Selection.End(xlUp).Select
    Selection.Copy
    Selection.End(xlDown).Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    ActiveCell.Offset(1, 0).FormulaR1C1 = "=R[-1]C-1"
    Selection.End(xlDown).Select
    Selection.Copy
    Selection.End(xlToRight).Select
    Selection.End(xlDown).Select
    Selection.End(xlToLeft).Select
    Range(Selection, Selection.End(xlUp)).Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Application.CutCopyMode = False
    Selection.NumberFormat = "mm/dd/yyyy"
    Columns("C:C").Select
    Selection.Delete Shift:=xlToLeft
    Columns("E:E").Select
    Selection.Delete Shift:=xlToLeft
    Columns("F:F").Select
    Selection.Delete Shift:=xlToLeft
    Columns("G:G").Select
    Selection.Delete Shift:=xlToLeft
    Columns("H:H").Select
    Selection.Delete Shift:=xlToLeft
    Columns("I:I").Select
    Selection.Delete Shift:=xlToLeft
    Cells.Find(What:="Name", After:=ActiveCell, LookIn:= _
        xlFormulas2, LookAt:=xlPart, SearchOrder:=xlByRows, SearchDirection:= _
        xlNext, MatchCase:=False, SearchFormat:=False).Activate
    Selection.End(xlToLeft).Select
    ActiveCell.FormulaR1C1 = "Date"
    Range(ActiveCell.Offset(-1, 0), "I1").Select
    Selection.Delete Shift:=xlUp
    
    'Convert text to values
    With Range("c2:C1000")
    .NumberFormat = "General"
    .Value = .Value
    End With

    
    
End Sub
