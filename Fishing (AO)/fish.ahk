#UseHook True ; make it so that movements don't trigger hotkeys
#Warn All, Off ; remove warnings
#SingleInstance Force ; force replace with new instance
#Requires AutoHotkey v2.0 32-bit ; requires AHK v2.0+, 32-bit for stability

SetWinDelay(0) ; shortest possible delay after windows actions
SetMouseDelay(-1) ; no mouse delay
SetKeyDelay(-1, -1) ; no key delay for when SendInput fails
SetControlDelay(0) ; no control delay
SetDefaultMouseSpeed(0) ; instant movement
SetWorkingDir(A_ScriptDir) ; sets working directory, just in case

ProcessSetPriority("A") ; makes the macro important to the computer
KeyHistory(0) ; no key logging
ListLines(0) ; no line logging


SendMode("Input") ; by default use SendInput
CoordMode("Pixel", "Client") ; by default exclude title bar, etc. from image checks
CoordMode("Mouse", "Client") ; by default exclude title bar, etc. from mouse movements


F1::
{
sum := 0
flag := false
	Loop {
		ImageSearch(&x, &y, 600, 100, 1100, 600, "*75 *Trans0x22B14C Mark.png")
		while (x || y) {
			flag := true	

			ImageSearch(&cy, &cy, 1500, 700, 2000, 1100, "*50 *Trans0xED1C24 Caught.png")
			if (cy || cy)	
				break

			MouseClick(,,,2)

			randomnumber1 := 20 + (-10, 50)
			Sleep(randomnumber1)

			ImageSearch(&cy, &cy, 1500, 700, 2000, 1100, "*50 *Trans0xED1C24 Caught.png")
			if (cy || cy)	
				break

			MouseClick(,,,2)

			randomnumber2 := 20 + (-10, 50)
			Sleep(randomnumber2)

			ImageSearch(&cy, &cy, 1500, 700, 2000, 1100, "*50 *Trans0xED1C24 Caught.png")
			if (cy || cy)	
				break

			ImageSearch(&sy, &sy, 1500, 700, 2000, 1100, "*50 *Trans0xED1C24 Sunken.png")	
			if (sy || sy)	
				break

			sum += randomnumber1 + randomnumber2

			if (sum >= 5000)
				break
		} Else
			Sleep(100)

		if (flag) {
			Send("0")
			Sleep(150)
			Send("0")
			Sleep(500)
			MouseClick(,,,1)
			x := 0
			y := 0
			sum := 0
			flag := false
		}
	}
}
F2::Reload