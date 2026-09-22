# SAP GRC SoD Risk Analytics — Synthetic Source Data
 
Synthetic SAP-compatible source data for a Microsoft Fabric Medallion Architecture portfolio project.
  
## Business scenario
One formal SoD risk review per year from 2022 through 2026.
Embedded storyline: higher baseline exposure -> moderate improvement -> some new exposure -> stronger remediation -> lower overall exposure with persistent Critical/High conflicts.

## Source files
- 01_sod_risk_assessment.csv — periodic SoD assessment results
- 02_user_master.csv — users and organization
- 03_risk_master.csv — risk definitions
- 04_role_conflict_assignment.csv — roles contributing to conflicts
- 05_system_master.csv — SAP systems  
- 07_role_master.csv — role reference/master
- 08_risk_review_master.csv — annual review reference
- 06_data_dictionary.csv — source-to-Gold mapping

<img width="720" height="632" alt="image" src="https://github.com/user-attachments/assets/80e209e6-5795-4976-9b4e-4511c93586ac" />

## Target Gold model
Fact_SoDConflict
Dim_User
Dim_Risk
Dim_RiskReview
Dim_System
Bridge_ConflictRole
Dim_Role

## Intentional Silver-layer work
Small numbers of duplicate rows, whitespace issues and blank system IDs are included for data-quality validation and cleansing. They are intentionally limited so they do not dominate the project.

## Scope
Phase 1 focuses on SoD conflict/risk analytics. Transaction/action-level analysis is deferred.<img width="1821" height="805" alt="image" src="https://github.com/user-attachments/assets/b5f0faf8-897c-4fef-8aa2-74fb52d67da0" />


## Report Page 1 : Overview
<img width="1322" height="746" alt="image" src="https://github.com/user-attachments/assets/fbb2dc91-cd13-492a-8310-2149a2fb9326" />

## Report Page 2 : Risk Prioritization
<img width="1325" height="746" alt="image" src="https://github.com/user-attachments/assets/0ecd5840-6396-476f-8c95-2d7630be0231" />

## Report Page 3 : Persistence and Remediation
<img width="1325" height="741" alt="image" src="https://github.com/user-attachments/assets/87ed81de-04b3-487c-9b70-8a7e91b2f083" />

## Report Page 4 : Executive Summary
<img width="1326" height="746" alt="image" src="https://github.com/user-attachments/assets/843651a6-9779-4cc9-bcaa-1d4e1ed61a8d" />


