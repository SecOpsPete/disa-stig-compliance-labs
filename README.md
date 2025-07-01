# 🛡️ DISA STIG Compliance Labs

This repository contains hands-on PowerShell remediation scripts aligned with the [Defense Information Systems Agency (DISA)](https://public.cyber.mil/stigs/) Security Technical Implementation Guides (STIGs) for Windows systems.

Each script is mapped to a specific STIG ID and includes structured documentation, usage instructions, and tested implementation logic. These labs are designed to support compliance initiatives such as:

- ✅ RMF/ATO accreditation packages
- ✅ NIST 800-53 control alignment
- ✅ Federal and DoD audit preparation
- ✅ Secure baseline enforcement

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

