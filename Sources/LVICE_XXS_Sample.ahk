#Requires AutoHotKey v2.0
#Include Class_LVICE_XXS.ahk
MainGui := Gui(, "LVICE_XXS Test")
MainGui.MarginX := 20
MainGui.MarginY := 20
Header := ["Column 1", "Column 2", "Column 3", "Column 4", "Column 5", "Column 6"]
MainLV := MainGui.AddListView("w600 r15 cBlue Grid -ReadOnly", Header)
MainLV.SetFont("s16")
Loop 16
   MainLV.Add("", "Value " . A_Index, "Value " . A_Index, "Value " . A_Index, "Value " . A_Index, "Value " . A_Index,
                  "Value " . A_Index)
Loop 16
   MainLV.Add("")
MainLV.ModifyCol()
MainGui.AddButton("xm", "Show changes").OnEvent("Click", ShowChanges)
MainGui.OnEvent("Close", MainGuiClose)
MainGui.Show()
LVICE := LVICE_XXS(MainLV)

MainGuiClose(GuiObj) {
   GuiObj.Destroy()
   ExitApp
}

ShowChanges(*) {
   Local Out := ""
   For X In LVICE.Changes
      Out .= X.Row . " - " . X.Col "`n"
   MsgBox(Out, LVICE.Changes.Length . " changes")
   LVICE.Changes.Length := 0 ; <<<<< if you want to reset the array
}
