;$VER: AMOSProCompiler.BAT 1.0 (30/04/2018)
;-> AMOSPro Compiler by Stefano Maria Regattin
;i> 20 novembre 2017
;m> 22 novembre 2017
;m> 14 marzo 2018
;m> 30 aprile 2018
;------------------
SetEnv Compilation=`RequestChoice TITLE "AMOSPro Compiler" BODY "Compile AMOS or text source?" GADGETS "No|Yes"`
IF $Compilation EQ "0"
 SetEnv Source=`RequestFile TITLE "Select AMOS or text..." PATTERN (#?.AMOS|#?.Asc)`
 If Exists $Source
  SetEnv Destination="NotTyped"
  SetEnv Destination=`RequestFile TITLE "Type the path for executable..."`
  If $Destination NOT EQ "NotTyped"
   SetEnv Type=`RequestChoice TITLE "AMOSPro Compiler" BODY "Choose executable type..." GADGETS "CLI|FREE|AMOS|WB"`
   SetEnv Long=`RequestChoice TITLE "AMOSPro Compiler" BODY "Choose internal jumps mode..." GADGETS "LONG|NOLONG"`
   If Long EQ "1"
    SetEnv Long="LONG"
   Else
    SetEnv Long="NOLONG"
   EndIf
   SetEnv DefScreen=`RequestChoice TITLE "AMOSPro Compiler" BODY "Keep the def screen?" GADGETS "DEFAULT|NODEFAULT"`
   If DefScreen EQ "1"
    SetEnv DefScreen="DEFAULT"
   Else
    SetEnv DefScreen="NODEFAULT"
   EndIf
   SetEnv ManageErrors=`RequestChoice TITLE "AMOSPro Compiler" BODY"Keep the error messages?" GADGETS "ERRORS|NOERRORS"`
   If ManageErrs EQ "1"
    SetEnv ManageErrs="ERRORS"
   Else
    SetEnv ManageErrs="NOERRORS"
   EndIf
   SetEnv AMOSLib=`RequestChoice TITLE "AMOSPro Compiler" BODY "Include amos.library?" GADGETS "INCLIB|NOLIB"`
   If IncludeLib EQ "1"
    SetEnv AMOSLib="INCLIB"
   Else
    SetEnv AMOSLib="NOLIB"
   EndIf
   Linguaggi:AMOS_Pro/APSystem/APCmp FROM $Source TO $Destination TYPE=$Type $Long $DefScreen $ManageErrs $AMOSLib
  EndIf
 EndIf 
EndIf
UnSetEnv Compress
UnSetEnv AMOSLib
UnSetEnv ManageErrs
UnSetEnv DefScreen
UnSetEnv Long
UnSetEnv Type
UnSetEnv Destination
UnSetEnv Source
UnSetEnv Creation
