; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppCopyright=� Akos Gyimesi, 2009
AppName=StupidGit
AppVerName=0.1
PrivilegesRequired=none
DefaultDirName={pf}\StupidGit
DefaultGroupName=StupidGit

[Files]
Source: dist\bz2.pyd; DestDir: {app}
Source: dist\library.zip; DestDir: {app}
Source: dist\python25.dll; DestDir: {app}
Source: dist\select.pyd; DestDir: {app}
Source: dist\stupidgit.exe; DestDir: {app}
Source: dist\unicodedata.pyd; DestDir: {app}
Source: dist\w9xpopen.exe; DestDir: {app}
Source: dist\wx._controls_.pyd; DestDir: {app}
Source: dist\wx._core_.pyd; DestDir: {app}
Source: dist\wx._gdi_.pyd; DestDir: {app}
Source: dist\wx._html.pyd; DestDir: {app}
Source: dist\wx._misc_.pyd; DestDir: {app}
Source: dist\wx._stc.pyd; DestDir: {app}
Source: dist\wx._windows_.pyd; DestDir: {app}
Source: dist\wxbase28uh_net_vc.dll; DestDir: {app}
Source: dist\wxbase28uh_vc.dll; DestDir: {app}
Source: dist\wxmsw28uh_adv_vc.dll; DestDir: {app}
Source: dist\wxmsw28uh_core_vc.dll; DestDir: {app}
Source: dist\wxmsw28uh_html_vc.dll; DestDir: {app}
Source: dist\wxmsw28uh_stc_vc.dll; DestDir: {app}
Source: dist\MSVCP71.dll; DestDir: {app}
Source: dist\MSVCR71.dll; DestDir: {app}

[Icons]
Name: {group}\StupidGit; Filename: {app}\stupidgit.exe; WorkingDir: {app}; IconIndex: 0
Name: {group}\{cm:UninstallProgram,StupidGit}; Filename: {uninstallexe}
Name: {userdesktop}\StupidGit; Filename: {app}\stupidgit.exe; Tasks: desktopicon; WorkingDir: {app}; IconIndex: 0
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\StupidGit; Filename: {app}\stupidgit.exe; Tasks: quicklaunchicon; WorkingDir: {app}; IconIndex: 0

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: contextmenu; Description: Add StupidGit to context menu; GroupDescription: Windows Explorer integration:

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
    if (CurStep = ssPostInstall) and IsTaskSelected('contextmenu') then
    begin
      RegWriteStringValue(HKCR, 'Directory\shell\StupidGit\command', '', '"' + ExpandConstant('{app}') + '\stupidgit.exe" "%1"');
    end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
    if CurUninstallStep = usUninstall then
    begin
        if RegKeyExists(HKCR, 'Directory\shell\StupidGit') then
        begin
          RegDeleteKeyIncludingSubkeys(HKCR, 'Directory\shell\StupidGit');
        end;
    end;
end;
