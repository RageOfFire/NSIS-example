ShowInstDetails nevershow
ShowUninstDetails nevershow
;--------------------------------
; Includes

  !include "MUI2.nsh"
  !include "logiclib.nsh"
;--------------------------------
; Custom defines
  ; Đổi tên ứng dụng của bạn
  !define NAME "Tên app của bạn"
  ; File .exe trong folder app
  !define APPFILE "File.exe bên trong folder app"
  ; Phiên bản ứng dụng
  !define VERSION "Phiên bản"
  !define SLUG "${NAME} v${VERSION}"
  !define UNINSTALL "Uninstall"
;--------------------------------
; General
  Unicode true
  Name "${NAME}"
  OutFile "${NAME} v${VERSION} Setup.exe"
  InstallDir "$PROGRAMFILES\${NAME}\"
  InstallDirRegKey HKCU "Software\${NAME}" ""
  RequestExecutionLevel admin
;--------------------------------
; UI
  ; Icon ứng dụng
  !define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install-colorful.ico"
  ; Icon gỡ cài đặt ứng dụng
  !define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall-colorful.ico"
  !define MUI_HEADERIMAGE
  ; Ảnh góc bên trái
  !define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\win.bmp"
  ; Ảnh trên đầu
  !define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\win.bmp"
  !define MUI_ABORTWARNING
  !define MUI_WELCOMEPAGE_TITLE "${SLUG} Setup"
;--------------------------------
; Pages
  
  ; Installer pages
  !insertmacro MUI_PAGE_WELCOME
  ; !insertmacro MUI_PAGE_LICENSE "license.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  ; Uninstaller pages
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
  ; Set UI language
  !insertmacro MUI_LANGUAGE "Vietnamese"
;--------------------------------
; Section - Install App

  Section "-hidden app"
  SetDetailsPrint none
    SectionIn RO
    SetOutPath "$INSTDIR"
    File /r "app\*.*" 
    WriteRegStr HKCU "Software\${NAME}" "" $INSTDIR
    WriteUninstaller "$INSTDIR\${UNINSTALL}.exe"
  SectionEnd
;--------------------------------
; Section - Shortcut

  Section "Desktop Shortcut" DeskShort
  SetDetailsPrint none
    CreateShortCut "$DESKTOP\${NAME}.lnk" "$INSTDIR\${APPFILE}"
  SectionEnd
;--------------------------------
; Section - Startmenu
  Section "Startmenu Shortcut" StartShort
  SetDetailsPrint none
    CreateDirectory "$SMPrograms\${NAME}"
    CreateShortcut "$SMPrograms\${NAME}\${NAME}.lnk" "$InstDir\${APPFILE}"
    CreateShortCut "$SMPrograms\${NAME}\${UNINSTALL}.lnk" "$InstDir\${UNINSTALL}.exe"
  SectionEnd
;--------------------------------
; Descriptions

  ;Language strings
  LangString DESC_DeskShort 1066 "Create shortcut in Desktop."
  LangString DESC_StartShort 1066 "Create shortcut in Start menu."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${DeskShort} $(DESC_DeskShort)
    !insertmacro MUI_DESCRIPTION_TEXT ${StartShort} $(DESC_StartShort)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
;--------------------------------
; Remove empty parent directories

  Function un.RMDirUP
    !define RMDirUP '!insertmacro RMDirUPCall'

    !macro RMDirUPCall _PATH
          push '${_PATH}'
          Call un.RMDirUP
    !macroend

    ; $0 - current folder
    ClearErrors

    Exch $0
    ;DetailPrint "ASDF - $0\.."
    RMDir "$0\.."

    IfErrors Skip
    ${RMDirUP} "$0\.."
    Skip:

    Pop $0

  FunctionEnd
;--------------------------------
; Section - Uninstaller

Section "Uninstall"
SetDetailsPrint none

  ;Delete Shortcut
  Delete "$DESKTOP\${NAME}.lnk"
  ;Delete StartMenu
  Delete "$SMPrograms\${NAME}\${Name}.lnk"
  Delete "$SMPrograms\${NAME}\${UNINSTALL}.lnk"
  Delete "$SMPrograms\${NAME}"
  ;Delete Uninstall
  Delete "$INSTDIR\Uninstall.exe"

  ;Delete Folder
  RMDir /r "$INSTDIR"
  ${RMDirUP} "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\${NAME}"

SectionEnd