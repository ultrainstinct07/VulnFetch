# 🛡️ Windows System Info & Vulnerability Checker

This PowerShell script provides detailed system information about a Windows machine and checks for vulnerabilities using the Vulners API. It's a handy tool for IT professionals and security enthusiasts to keep their systems secure and up-to-date. 🚀

---

## ✨ Features
1. 📋 **System Information**: Displays essential details like OS architecture, manufacturer, model, BIOS version, last boot time, processor, and RAM.
2. 🪟 **Windows Version Details**: Outputs the current Windows version, build number, and name.
3. 🔍 **Vulnerability Search**: Fetches Common Vulnerabilities and Exposures (CVEs) related to your Windows version from the Vulners API.
4. 📄 **Clear Output**: Presents the information in a readable format with a short description of each CVE.

---

## 🚀 How to Use

### 1⃣ Prerequisites
- A Windows machine with **PowerShell** installed.
- A valid **Vulners API key**. Sign up at [Vulners API](https://vulners.com) to get one.

---

### 2⃣ Steps to Run the Script
1. **Clone or Download** this repository to your local machine.
2. **Open PowerShell**:
   - Press `Win + R`, type `powershell`, and hit Enter.
3. **Update the Script**:
   - Replace `"YOUR_API-KEY"` in the script with your **Vulners API key**.
4. **Run the Script**:
   - Navigate to the script's directory and execute it:
     ```powershell
     .\CheckSystemInfoAndVulnerabilities.ps1
     ```

---

## 🖥️ Sample Output

### 🔍 System Information
```plaintext
System Information:
OS Architecture: 64-bit
Manufacturer: Dell Inc.
Model: XPS 15 9500
BIOS Version: 1.9.0
Last Boot Time: 2025-01-27T08:15:23Z
Processor: Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz
RAM (GB): 16.00
```

### 🪟 Windows Version Details
```plaintext
Windows Version: Microsoft Windows 11 Pro
Version: 10.0.22621
Build: 22621
```

### 🛡️ Vulnerabilities
```plaintext
Vulnerabilities for Microsoft Windows 11 Pro:
CVE ID: CVE-2023-12345
Description: A privilege escalation vulnerability in the Windows kernel...
Published: 2023-12-15
--------------------------
CVE ID: CVE-2023-67890
Description: A remote code execution vulnerability affecting Windows Defender...
Published: 2023-11-30
--------------------------
```

---

## 🛠️ Script Details

### Step-by-Step Breakdown
1. **Gather System Information**:
   - Collects OS architecture, manufacturer, model, BIOS version, last boot time, processor details, and total RAM.
2. **Fetch Windows Version Details**:
   - Extracts the current Windows version, build number, and name.
3. **Search for Vulnerabilities**:
   - Constructs a query using the current Windows version and fetches related CVEs from the Vulners API.
4. **Display Results**:
   - Outputs each CVE with its ID, a short description, and the publication date.

---

## 🚧 Troubleshooting

- **Invalid API Key**: Ensure you've entered a valid Vulners API key in the script.
- **No Vulnerabilities Found**: Double-check the Windows version detected by the script and verify the query accuracy.
- **PowerShell Errors**: Ensure you run the script with the necessary permissions (e.g., as Administrator).

---

## 🤝 Contributing
Feel free to submit pull requests or suggest improvements! Together, we can make this script even better. 💡

---

## 📜 License
This script is open-source and available under the [MIT License](LICENSE).

---

Happy Securing! 🔐✨

