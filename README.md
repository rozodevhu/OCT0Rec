╭━━━┳━━━┳━━━━┳━━━┳━━━┳━━━┳━━━╮
┃╭━╮┃╭━╮┃╭╮╭╮┃╭━╮┃╭━╮┃╭━━┫╭━╮┃
┃┃╱┃┃┃╱╰┻╯┃┃╰┫┃╱┃┃╰━╯┃╰━━┫┃╱╰╯
┃┃╱┃┃┃╱╭╮╱┃┃╱┃┃╱┃┃╭╮╭┫╭━━┫┃╱╭╮
┃╰━╯┃╰━╯┃╱┃┃╱┃╰━╯┃┃┃╰┫╰━━┫╰━╯┃
╰━━━┻━━━╯╱╰╯╱╰━━━┻╯╰━┻━━━┻━━━╯

# 🎒 OCT0Rec: Rec Room Infinite Master Localhost Server

An all-era, version-agnostic preservation emulator for Rec Room PC client builds (2016-2021). Handles visual assets, unlimited storefronts, and Maker Pen persistence via **localhost port 2059**.

---

## 🗺️ System Architecture
```text
[ Game Client ] ──► (HTTP/REST) ──► [ Python Server (app.py) ] ◄──► [ SQLite DB ]
              └──► (Physics)   ──► [ Photon Server (Port 5055) ]
```

---

## 🛠️ Installation & Setup
1. **Dependencies:** `pip install flask flask-sock`
2. **Tools Required:** Photon Server SDK v4, Metadata String Editor, dnSpy.

---

## 💻 Client Patching (Changing `ns.rec.net` to `localhost:2059`)
*   **Mono (Early Builds):** Use **dnSpy** on `Assembly-CSharp.dll` to change base URL.
*   **IL2CPP (Later Builds):** Use **Metadata String Editor** to patch `global-metadata.dat`.

---

## 🚀 Usage & Launch
1. **Run Photon:** Start `PhotonControl.exe` (Port 5055).
2. **Run Server:** `python app.py`
3. **Launch Game:** Use `launch_unlocked.bat` to bypass EAC.

*For screen mode, append `-asdevice 5` to the shortcut target.*
