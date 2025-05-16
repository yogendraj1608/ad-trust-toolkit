🛡️ Active Directory Trust Exploitation Mapper & Toolkit

This toolkit enables security researchers, red teamers, and defenders to map, analyze, and simulate exploitation paths across Active Directory (AD) trust relationships. It includes PowerShell automation for domain enumeration, delegation abuse, and visualization of complex AD attack paths.


📂 Project Structure


ad\_toolkit/
├── delegation.ps1       # Automates RBCD setup between attacker and target
├── new\.ps1              # Creates test computer accounts for simulation
├── setup.ps1            # Enumerates AD trust paths and delegation configs
├── trust.dot            # DOT file for domain trust mapping
├── adtrust.dot          # DOT file for exploit path visualization
├── trustmap.png         # Rendered trust graph (from trust.dot)
├── adtrust.png          # Rendered attack path graph (from adtrust.dot)
└── README.md            # Project documentation





🎯 Features

- 🔍 Enumerate inter-domain trusts (parent-child, external/forest)
- 🧠 Identify unconstrained and resource-based constrained delegation
- 🧪 Simulate Resource-Based Constrained Delegation (RBCD)
- 👥 Detect users with SIDHistory set (impersonation risk)
- 🗺️ Visualize trust relationships and attack chains using Graphviz



🧰 PowerShell Scripts

`setup.ps1`

Enumerates:
- Domain trusts (`Get-ADTrust`, `nltest`)
- Unconstrained delegation computers (`TrustedForDelegation`)
- Users with `SIDHistory`

powershell
.\setup.ps1




`delegation.ps1`

Automates the setup of RBCD between an attacker and a target machine.


.\delegation.ps1


`new.ps1`

Creates machine accounts (`WIN-ATTACKER`, `WIN-TARGET`) for testing and simulating trust abuse paths.

.\new.ps1




🧭 AD Lab Topology

| Component        | Value               |
| ---------------- | ------------------- |
| Parent Domain    | `task1.local`       |
| Child Domain     | `child.task1.local` |
| Trusted Domain   | `task2.local`       |
| Attacker Machine | `WIN-ATTACKER$`     |
| Target Machine   | `WIN-TARGET$`       |



🔐 MITRE ATT\&CK Techniques

| Technique                             | Description                                    | ID        |
| ------------------------------------- | ---------------------------------------------- | --------- |
| T1484.002 – Domain Trust Modification | Exploiting inter-domain trust paths            | T1484.002 |
| T1550.002 – Pass-the-Ticket (RBCD)    | Configuring RBCD via ACL abuse                 | T1550.002 |
| T1134.005 – SIDHistory Abuse          | Privilege escalation via SID spoofing          | T1134.005 |
| T1558.003 – Kerberoasting             | Dumping and cracking service tickets           | T1558.003 |
| T1484.001 – Group Policy Modification | Domain escalation via admin group manipulation | T1484.001 |



📈 Visualizations

🔗 Trust Map (`trustmap.png`)

[Trust Map](trustmap.png)

 Shows parent-child and forest trust links.
 RBCD and SIDHistory abuse paths are highlighted.
 Useful for understanding cross-domain pivoting.



🚩 Exploitable Path Graph (`adtrust.png`)

[Attack Graph](adtrust.png)

 Simulates paths like `User-A → ServiceAccount → RBCD → Domain Admin`.
 Shows misconfigurations like:

   `GenericAll` abuse
   Shadow admin privilege chaining
   SIDHistory impersonation



🛠️ Generate Diagrams

To regenerate Graphviz images:


dot -Tpng trust.dot -o trustmap.png
dot -Tpng adtrust.dot -o adtrust.png


Ensure Graphviz is installed: [https://graphviz.org/download/](https://graphviz.org/download/)



