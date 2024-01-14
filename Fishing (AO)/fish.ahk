#UseHook True ; make it so that movements don't trigger hotkeys
#Warn All, Off ; remove warnings
#SingleInstance Force ; force replace with new instance
#Include %A_ScriptDir% ; sets current #Include to the working directory
#Requires AutoHotkey v2.0 32-bit ; requires AHK v2.0+, 32-bit for stability
Critical("Off") ; makes threads interruptible by default

SetWinDelay(0) ; shortest possible delay after windows actions
SetMouseDelay(-1) ; no mouse delay
SetKeyDelay(-1, -1) ; no key delay for when SendInput fails
SetControlDelay(0) ; no control delay
SetDefaultMouseSpeed(0) ; instant movement
SetWorkingDir(A_ScriptDir) ; sets working directory, just in case

ProcessSetPriority("A") ; makes the macro important to the computer
DetectHiddenText(0) ; does not check for hidden text
DetectHiddenWindows(0) ; does not check for hidden windows
Thread("Priority", 0) ; sets default thread priority
Thread("NoTimers", True) ; makes it so that timers don't interrupt threads
KeyHistory(0) ; no key logging
ListLines(0) ; no line logging


SendMode("Input") ; by default use SendInput
CoordMode("Pixel", "Client") ; by default exclude title bar, etc. from image checks
CoordMode("Mouse", "Client") ; by default exclude title bar, etc. from mouse movements


F1::
{
	Loop {
		flag := false
		x := 0
		y := 0
		xx := 0
		yy := 0
		sum := 0
		ImageSearch(&x, &y, 600, 100, 1100, 600, "*75 *w0 *h0 fishredbig.png")
		ImageSearch(&xx, &yy, 600, 100, 1100, 600, "*75 *w0 *h0 fishredbigdark.png")
		while (x || y || xx || yy) {
			flag := true	
			ImageSearch(&xy, &yy, 1500, 700, 2000, 1100, "*100 awd.png")
			if (xy || yy)	
				break
			MouseClick(,,,2)
			randomnumber1 := 20 + (-10, 50)
			Sleep(randomnumber1)
			ImageSearch(&xy, &yy, 1500, 700, 2000, 1100, "*100 awd.png")
			if (xy || yy)	
				break
			MouseClick(,,,2)
			randomnumber2 := 20 + (-10, 50)
			Sleep(randomnumber2)
			ImageSearch(&xy, &yy, 1500, 700, 2000, 1100, "*100 awd.png")
			if (xy || yy)	
				break
			sum += randomnumber1 + randomnumber2
			if (sum >= 5000)
				break
		} Else
			Sleep(100)
		if (flag) {
			Send "0"
			Sleep(150)
			Send "0"
			Sleep(500)
			MouseClick(,,,1)
		}
	}
}
F2::Reload