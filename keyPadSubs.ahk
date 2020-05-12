#SingleInstance force
#Persistent
#include Lib\AutoHotInterception.ahk

AHI := new AutoHotInterception()

mainId := AHI.GetDeviceIdFromHandle(0, "HID\VID_045E&PID_0745&REV_0252&MI_00")

keypadId := AHI.GetDeviceIdFromHandle(0, "HID\{00001124-0000-1000-8000-00805f9b34fb}_VID&000204e8_PID&7021&Col01")

AHI.SubscribeKeyboard(keypadId, true, Func("KeyEvent"))

KeyEvent(code, state){
	If (state = 1) {
		If (code = 5) {
			SetWorkingDir, C:\Users\Javi\OneDriveCapside\OneDrive - CAPSIDE SL\projects\obscli\
			RunWait, node.exe index.js -s 1, "C:\Users\Javi\OneDriveCapside\OneDrive - CAPSIDE SL\projects\obscli", "Hide"
			return
		}	
		If (code = 6) {
			SetWorkingDir, C:\Users\Javi\OneDriveCapside\OneDrive - CAPSIDE SL\projects\obscli\
			Run, node.exe index.js -s 2, "C:\Users\Javi\OneDriveCapside\OneDrive - CAPSIDE SL\projects\obscli", "Hide"
			return
		}	
		If (code = 7) {
			SetWorkingDir, C:\Users\Javi\OneDriveCapside\OneDrive - CAPSIDE SL\projects\obscli\
			Run, node.exe index.js -s 3, "C:\Users\Javi\OneDriveCapside\OneDrive - CAPSIDE SL\projects\obscli", "Hide"
			return
		}	
		If (code = 78) {
			SetWorkingDir, C:\Users\Javi\OneDriveCapside\OneDrive - CAPSIDE SL\projects\obscli\
			Run, node.exe index.js -s 4, "C:\Users\Javi\OneDriveCapside\OneDrive - CAPSIDE SL\projects\obscli", "Hide"
			return
		}	
	}
}

^Esc::
	ExitApp