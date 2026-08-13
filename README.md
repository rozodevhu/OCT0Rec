# Rec Room Infinite Master Localhost Server (2016 - 2021)

An all-era, version-agnostic preservation emulator for Rec Room PC client builds spanning from the 2016 Alpha era up to late 2021 builds. This server uses endpoint overloading and a global catch-all routing proxy to handle visual asset rendering, unlimited storefront loops, mirror customization caching, and Maker Pen environment states entirely offline on **localhost port 2059**.

---

## 🗺️ System Architecture Workflow

```text
[ Game Client (Mono or IL2CPP) ] 
               │
               ├──► (HTTP/HTTPS REST Traffic) ──► [ Python Master app.py (Port 2059) ] ◄──► [ SQLite database ]
               │
               └──► (3D Positional Physics)   ──► [ Photon Server SDK (Port 5055) ]
```

1. **REST API Emulation (`app.py`):** Intercepts and answers profile setups, storefront transactions, outfit choices, and match initialization.
2. **Persistence Layer (`database_infinite_master.db`):** An automated SQLite script that saves unlocked inventory and custom maps across reboots.
3. **Real-Time Physics Layer (Photon):** Handles continuous 3D hand tracking, head rotation, and object collision sync on port 5055.

---

## 🛠️ Prerequisites & Installation

### 1. Install Server Dependencies
Open your Windows Command Prompt (`cmd`) or terminal and install the underlying web-routing dependencies:
```bash
pip install flask flask-sock
```

### 2. Download Network Frame Tools
* Download the **Photon Server SDK v4** application bundle from the official [Photon Engine SDK Center](https://photonengine.com).
* Download **dnSpy** (for patching older Mono client builds).
* Download **Metadata String Editor** (for patching newer IL2CPP client builds).

---

## 💻 Step-by-Step Client Patching Guides

To make a specific build talk to your local server instead of the dead official endpoints, choose the matching patch method below:

### Method A: For 2016 Alpha to Early 2019 Builds (Mono Engine)
1. Launch **dnSpy**.
2. Drag and drop the game client file `RecRoom_Data\Managed\Assembly-CSharp.dll` directly into dnSpy's left workspace panel.
3. Press `Ctrl + Shift + K` to open the string search interface window.
4. Search for the text keyword string literal: `api.rec.net` (or `ns.rec.net`).
5. Double-click the result class file to open its source code panel.
6. Right-click the hardcoded URL initialization line (e.g., `public string BaseUrl = "https://rec.net";`), select **Edit Method (C#)**, and modify it directly to your local script:
   ```csharp
   public string BaseUrl = "http://localhost:2059";
   ```
7. Click **Compile** in the bottom right corner of the editing screen.
8. Navigate up to the top toolbar panel, select `File` -> `Save Module`, and click **OK**.

### Method B: For Late 2019 to Late 2021 Builds (IL2CPP Engine)
1. Go into your game build directories and navigate to: `RecRoom_Data\il2cpp_data\Metadata\`.
2. Open the **Metadata String Editor** utility tool.
3. Drag and drop the game's `global-metadata.dat` file directly onto the software's UI dashboard layout window.
4. Search for the structural parameter keyword: `ns.rec.net` (or `api.rec.net`).
5. Click **Modify** and overwrite it with your exact localhost listener address:
   ```text
   http://localhost:2059
   ```
6. Click **Keep** and press **Save** to overwrite the original metadata file records safely.

---

## 🕹️ Configuring Multi-Input Shortcut Modes

Because 2018–2021 PC builds contain both Desktop and VR tracking modes inside their base code libraries, you can command your executable how to boot:

1. Right-click your patched game executable (`RecRoom.exe`) and choose **Create Shortcut**.
2. Right-click that new shortcut file layout on your desktop and select **Properties**.
3. Locate the **Target** input block field, scroll to the absolute end of the string line, add a space, and append your mode flags:
   * **To run in Screen Mode (Mouse & Keyboard):** Add `-asdevice 5` (or `-screenmode`).
   * **To run in PCVR Mode (SteamVR / Oculus Link):** Add `-asdevice 1` (or keep blank to default to VR hardware).
4. Click **Apply** and click **OK**.

---

## 🚀 Playback Chronology (Do This Every Time You Play)

Always follow this startup sequence exactly to prevent initialization connection hangs:

1. **Fire up the Physics Sync:** Unzip your Photon SDK download package, execute `PhotonControl.exe` as an Administrator, right-click the white cell icon in your hidden Windows taskbar tray, go to **LoadBalancing**, and select **Start as Application**.
2. **Launch the Master Server:** Run your server folder script from the command prompt window terminal interface:
   ```bash
   python app.py
   ```
3. **Launch the Game Client:** Double-click your custom Screen or VR desktop shortcut file to enter your completely unlocked local preserve.

---

## 🚨 Troubleshooting & Diagnostics

* **EAC Violation Warnings:** This setup requires a **stripped game client build** where the `EasyAntiCheat` folder assets and startup injection checks have been entirely removed or disabled. A clean installation straight from modern Steam files will block local file parsing.
* **Watch Menus/Store Freezing:** Verify that your `app.py` script is running and that your command terminal is actively printing logs (e.g., `[CATCH-CONFIG]`). If it's silent, your client is failing to route requests locally.
* **Hands/Physics Stuck in Ground:** This indicates that your game client is talking to your Python server but cannot see your Photon loop. Double check that `PhotonControl` is active and successfully running on port 5055.
