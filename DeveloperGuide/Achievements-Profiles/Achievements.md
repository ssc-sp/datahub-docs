# Achievements

## JSON Model

The following diagram shows an example JSON model for the User Achievements feature:

```json
{
  "Id": "EXP-000",
  "Name": "To Infinity and beyond",
  "Description": "Unlock all the initial release exploration achievements",
  "Points": 1,
  "AchievementType": "Trophy|Achievement",
  "RuleExpressions": [
    "Utils.AchievementPassed(\"EXP-001\", input1)",
    "Utils.AchievementPassed(\"EXP-002\", input1)",
    "...",
    "Utils.AchievementPassed(\"EXP-011\", input1)"
  ]
}
```

## `DHA` Datahub Achievements

| Id        | Name                    | Description                     | Conditions                      | AchievementType |
| --------- | ----------------------- | ------------------------------- | ------------------------------- | --------------- |
| `DHA-001` | Collaboration Commander | Invite a user to your workspace | Invite a User to your workspace | Achievement     |
| `DHA-002` | Workspace Warrior       | Join a workspace                | Join a workspace                | Achievement     |
| `DHA-003` | Workspace Wanderlust    | Leave a workspace               | Leave a workspace               | Achievement     |
| `DHA-004` | Consistent Contributor  | Login on multiple days          | Login on at least two days      | Achievement     |

## `STR` Storage Explorer Achievements

| Id        | Name                 | Description                                                | Conditions      | AchievementType |
| --------- | -------------------- | ---------------------------------------------------------- | --------------- | --------------- |
| `STR-000` | Storage Savant       | Unlock all the 2.0 Storage Explorer achievements           | Unlock All FIL  | Trophy          |
| `STR-001` | Unstoppable Uploader | Upload a file using the workspace Storage Explorer         | Upload a file   | Achievement     |
| `STR-002` | Storage Socialite    | Share a file using the workspace Storage Explorer          | Share a file    | Achievement     |
| `STR-003` | File Fetcher         | Download a file using the workspace Storage Explorer       | Download a file | Achievement     |
| `STR-004` | Daredevil Deleter    | Delete a file from the workspace with the Storage Explorer | Delete a file   | Achievement     |
| `STR-005` | Folder Fashionista   | Create a folder in the workspace's Storage Explorer        | Create a folder | Achievement     |
| `STR-006` | Folder Farewell      | Delete a folder in the workspace's Storage Explorer        | Delete a folder | Achievement     |

## `EXP` Exploration Achievements

| Id        | Name                      | Description                                          | Conditions             | AchievementType |
| --------- | ------------------------- | ---------------------------------------------------- | ---------------------- | --------------- |
| `EXP-000` | Explorer Extraordinaire   | Unlock all the 2.0 Exploration achievements          | Unlock all EXP         | Trophy          |
| `EXP-001` | Collaboration Connoisseur | Logged in to DataHub                                 | Log in at least once   | Achievement     |
| `EXP-002` | Storage Safari            | Navigate to the Storage Explorer page of a workspace | Visit Storage Explorer | Achievement     |
| `EXP-003` | Databricks Discovery      | Navigate to the Databricks page of a workspace       | Visit Databricks       | Achievement     |
| `EXP-004` | Resource Ranger           | View the resources section of DataHub                | Visit Resources        | Achievement     |
| `EXP-005` | Workspace Wanderer        | View a workspace you are not a member of             | Visit Another Project  | Achievement     |
| `EXP-006` | Profile Peruser           | View your own profile page                           | Visit A Profile        | Achievement     |
| `EXP-007` | Link Legend               | Use a recent link to get to the same page again      | Use A Recent Link      | Achievement     |
| `EXP-008` | Prolific Polyglot         | Switch languages in the portal                       | Toggle Culture         | Achievement     |
| `EXP-009` | Workspace Wayfarer        | Visit one of your own workspaces                     | Visit Own Project      | Achievement     |
| `EXP-010` | Profile Prowler           | View another person's profile                        | Visit Another Profile  | Achievement     |

```

```
