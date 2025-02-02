^n::
{
    if WinActive("ahk_exe joplin.exe")
    {
        Send "^n"
    }
    else
    {
        Run "C:\Users\Chris\AppData\Local\Programs\Joplin\Joplin.exe"

        ; Wait for Joplin to become active, and capture the return value
        if not WinWaitActive("ahk_exe joplin.exe",, 3)  ; Wait for up to 3 seconds, check result directly
        {
            ; WinWaitActive returned 0 (false), meaning it timed out
            MsgBox 48, "Error", "Joplin did not become active within 3 seconds."
            return ; Exit the hotkey
        }

        ; Joplin is active, send Ctrl+N to create a new note.
        Send "^n"

        
    }
}