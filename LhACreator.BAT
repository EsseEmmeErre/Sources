;$VER: LhA Creator 1.0 (17.1.2019)
;-> LhA Creator by Stefano Maria Regattin
;d> 13 November 2017 LhAExtractor
;m> 14,15,22 November 2017
;m> 17 January 2019
;-------------------
SetEnv Creazione=`RequestChoice TITLE "LhA Creator" BODY "Create a LhA archive?" GADGETS "No|Yes"`
If $Creazione EQ "0"
 SetEnv Archivio=NotSelected
 Wait SEC 1
 SetEnv Archivio=`RequestFile TITLE "Type the LhA archive name..." NOICONS`
 If $Archivio NOT EQ NotSelected 
  Wait SEC 1
  SetEnv Cassetto=`RequestFile TITLE "Select drawer to archive..." DRAWERSONLY NOICONS`
  If Exists $Cassetto
   Wait SEC 1
   SetEnv Icona=`RequestChoice TITLE "LhA Creator" BODY "The drawer has an icon?" GADGETS "No|Yes"`
   If $Icona EQ "0"
    Wait SEC 1
    SetEnv Icona=`RequestFile TITLE "Select drawer's icon..." DRAWER $Cassetto/ PATTERN #?.info`
   EndIf
   Wait SEC 1
   SetEnv Copia=`RequestChoice TITLE "LhA Creator" BODY "Would you I copy the drawer to RAM:?" GADGETS "No|Yes"`
   If $Copia EQ "0"
    Wait SEC 1
    If Exists RAM:Content
     Delete >"CON:0/11/640/53/LhA Creator" RAM:Content RAM:Content.info ALL
    EndIF
    MakeDir RAM:Content
    Copy >"CON:0/11/640/53/LhA Creator" FROM $Cassetto#? TO RAM:Content ALL CLONE
    Wait SEC 1
    Copy >"CON:0/11/640/53/LhA Creator" FROM $Icona TO RAM: CLONE
    Wait SEC 1
    SetEnv Icona=`RequestFile TITLE "Select the icon for rename..."`
    Rename $Icona RAM:Content.info
    SetEnv Cassetto=RAM:Content
   EndIf
  EndIf
  If Exists $Cassetto
;                      ********************************************
   CD SYS:ThirdPartyC ;* change this line to suit it to your needs 
;                      ********************************************
   If Exists $Icona
    Wait SEC 1
    LhA >"CON:0/11/640/53/LhA Creator" a $Archivio $Icona
   EndIf
   Wait SEC 1
   LhA >"CON:0/11/640/53/LhA Creator" a -r $Archivio $Cassetto#?
   Wait SEC 1
   RequestChoice TITLE "Lha Creator" BODY "LhA archive creation completed!" GADGETS "OK"
  EndIf
 EndIf
EndIf
UnSetEnv Copia
UnSetEnv Icona
UnSetEnv Cassetto
UnSetEnv Archivio
UnSetEnv Creazione
