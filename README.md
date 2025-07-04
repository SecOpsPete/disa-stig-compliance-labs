# 🛡️ DISA STIG Compliance Labs

This repository contains **hands-on PowerShell scripts** for remediating Windows Security Technical Implementation Guide (STIG) findings published by the [Defense Information Systems Agency (DISA)](https://public.cyber.mil/stigs/).

Each script targets a specific STIG ID and includes structured documentation, usage guidance, and implementation logic tested in standalone environments. While these scripts **automate the underlying remediation actions**, they are intended for **manual execution on individual systems** — making them ideal for:

- ✅ RMF/ATO accreditation preparation (e.g., screenshots, documented actions)
- ✅ NIST 800-53 control alignment in lab or pilot environments
- ✅ Federal and DoD audit readiness demonstrations
- ✅ Secure baseline hardening during initial system setup

---

## 📂 Repository Structure

Each remediation script is named after its corresponding STIG ID. Scripts are written in native PowerShell and include:

- `.SYNOPSIS` and `.USAGE` sections
- Metadata block with author/date/version info
- Inline comments for clarity and auditability

---

## 📜 STIG Remediation Scripts

Each script below corresponds to a specific STIG ID and includes structured documentation, metadata, and tested remediation logic:

- **[`WN10-AU-000500.ps1`](./WN10-AU-000500.ps1)**  
  Ensures the Application event log maximum size is set to at least 32768 KB (32 MB) to preserve audit log data.

- **[`WN10-SO-000255.ps1`](./WN10-SO-000255.ps1)**  
  Renames the built-in Guest account to a non-default name ("NewGuest") to improve system security and comply with STIG requirements.

- **[`WN10-CC-000150.ps1`](./WN10-CC-000150.ps1)**  
  Configures the system to require a password when resuming from sleep (plugged in), improving local session security.

- **[`WN10-SO-000245.ps1`](./WN10-SO-000245.ps1)**  
  Enables Admin Approval Mode for the built-in Administrator account to enforce UAC security requirements.

- **[`WN10-SO-000250.ps1`](./WN10-SO-000250.ps1)**  
  Configures UAC to prompt administrators for consent on the secure desktop in Admin Approval Mode.

- **[`WN10-AC-000005.ps1`](./WN10-AC-000005.ps1)**  
  Sets the account lockout duration to 15 minutes to protect against brute-force attacks.

- **[`WN10-AC-000020.ps1`](./WN10-AC-000020.ps1)**  
  Enforces a password history of 24 remembered passwords to prevent reuse and meet DoD security standards.

- **[`WN10-SO-000100.ps1`](./WN10-SO-000100.ps1)**  
  Ensures the SMB client is configured to always digitally sign SMB communications, helping to prevent man-in-the-middle attacks.

- **[`WN10-SO-000120.ps1`](./WN10-SO-000120.ps1)**  
  Ensures the Windows SMB server is configured to always digitally sign communications to prevent man-in-the-middle attacks.

- **[`WN10-SO-000060.ps1`](./WN10-SO-000060.ps1)**  
  Configures Windows to require a password when waking from sleep (plugged in), enhancing local session security.

*(More scripts coming soon as this lab continues to expand.)*

---

### 🧠 Pro Tip: Applying Manual Group Policy Changes

When testing STIG remediations manually (especially registry- or GPO-based), **you do not need to reboot** the system for changes to take effect. Instead, use:

```powershell
gpupdate /force
```

---

## 📌 Author

**Peter Van Rossum**  
🔗 [LinkedIn](https://www.linkedin.com/in/vanr)  
💻 [GitHub](https://github.com/SecOpsPete)

---

_This repository will continue to grow with additional STIG-based remediations for Windows 10 and Server systems._

