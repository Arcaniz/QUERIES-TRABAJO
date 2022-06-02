Sub TEXTO_ENCOL()
'
' TEXTO_ENCOL Macro
'

'
    Columns("A:A").Select
    Selection.TextToColumns Destination:=Range("A1"), DataType:=xlFixedWidth, _
        FieldInfo:=Array(Array(0, 1), Array(14, 1), Array(19, 1), Array(55, 1), Array(71, 1), _
        Array(75, 1), Array(87, 1), Array(100, 1), Array(113, 1)), TrailingMinusNumbers:= _
        True
    Rows("1:9").Select
    Selection.Delete Shift:=xlUp

      Range("A1").Select
    ActiveCell.SpecialCells(xlLastCell).Select
    Range(Selection, Cells(1)).Select
    Selection.AutoFilter
    Columns("A:A").Select
    ActiveSheet.Range("$A$1:$K$1455").AutoFilter Field:=1, Criteria1:=Array("" _
        , "", "--------------", "*", "* PROMOTORA MU", "* Proveedor :", "**************", _
        "CODIGO EAN", "="), Operator:=xlFilterValues
    ActiveSheet.Range("$A$1:$K$1455").AutoFilter Field:=2, Criteria1:=Array( _
        "----", "*****", "10", "DPTO", "SICAL", "="), Operator:=xlFilterValues
    Rows("2:2").Select
    ActiveCell.SpecialCells(xlLastCell).Select
    Rows("1455:1455").Select
    Range("K1455").Activate
    Range(Selection, Cells(1)).Select
    Rows("2:1455").Select
    Range("K1455").Activate
    Selection.Delete Shift:=xlUp
    Range("A1").Select
    ActiveSheet.ShowAllData
    ActiveSheet.Shapes.Range(Array("Rectangle 2")).Select
    Selection.OnAction = "BORRA"
    Range("M14").Select
    ActiveWorkbook.Save
    ActiveSheet.Shapes.Range(Array("Rectangle 2")).Select
    

End Sub


Sub TIENDA()
'
' TIENDA Macro
'

'
    Selection.End(xlUp).Select
    Range("B1").Select
    Selection.End(xlToRight).Select
    Range("J1").Select
    ActiveCell.FormulaR1C1 = "TIENDA"
    Range("J2").Select
    ActiveSheet.Paste
    Range("I2").Select
    ActiveCell.SpecialCells(xlLastCell).Select
    Range(Selection, Cells(1)).Select
    Range("J2:J1081").Select
    Range("J1081").Activate
    Selection.FillDown
    Selection.End(xlUp).Select
    Selection.AutoFilter
    Selection.AutoFilter
    ActiveSheet.Range("$A$1:$J$1081").AutoFilter Field:=10, Criteria1:="0"
    ActiveCell.SpecialCells(xlLastCell).Select
    Rows("1081:1081").Select
    Range("J1081").Activate
    Range(Selection, Cells(1)).Select
    Range("J1082").Select
    Selection.End(xlUp).Select
    Rows("1081:1081").Select
    Range("J1081").Activate
    Range(Selection, Cells(1)).Select
    Rows("590:1081").Select
    Range("J1081").Activate
    Selection.Delete Shift:=xlUp
    ActiveSheet.ShowAllData
End Sub


Sub BORRA()
'
' BORRA Macro
'

'
    ActiveSheet.Range("$A$1:$J$944").AutoFilter Field:=10, Criteria1:="0"
    Range("H602").Select
    ActiveCell.SpecialCells(xlLastCell).Select
    Rows("944:944").Select
    Range("J944").Activate
    Range(Selection, Cells(1)).Select
    Range(Selection, Selection.End(xlDown)).Select
    Rows("944:945").Select
    Range("J944").Activate
    Range(Selection, Cells(1)).Select
    Range(Selection, Cells(1)).Select
    Rows("944:944").Select
    Range("J944").Activate
    Range(Selection, Cells(1)).Select
    Rows("590:944").Select
    Range("J944").Activate
    Selection.Delete Shift:=xlUp
    Range("I601").Select
    ActiveSheet.ShowAllData
    Range("M7").Select
End Sub