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
Phase 1 focuses on SoD conflict/risk analytics. Transaction/action-level analysis is deferred.
