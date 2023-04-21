# Achievements

## JSON Model

The following diagram shows an example JSON model for the User Achievements feature:

```json
{
  "Code": "EXP-000",
  "Name": "To Infinity and beyond",
  "Description": "Unlock all the initial release exploration achievements",
  "Points": 1,
  "UnlockableType": "Trophy|BackgroundImage|ProfilePicture|None",
  "RuleExpressions": [
    "Utils.AchievementPassed(\"EXP-001\", input1)",
    "Utils.AchievementPassed(\"EXP-002\", input1)",
    "...",
    "Utils.AchievementPassed(\"EXP-011\", input1)"
  ]
}
```

## `PRJ` Project Achievements

| Code      | Name        | Conditions                    | Type       |
| --------- | ----------- | ----------------------------- | ---------- |
| `PRJ-001` | One of us!  | Invite a User to your project | Repeatable |
| `PRJ-002` | Can I help? | Join a project                | One Time   |

## `FIL` File Explorer Achievements

| Code      | Name                          | Conditions      | Type       |
| --------- | ----------------------------- | --------------- | ---------- |
| `FIL-000` | File Explorer Badge           | Unlock All FIL  | One Time   |
| `FIL-001` | Beam us up, Scotty            | Upload a file   | Repeatable |
| `FIL-002` | Check this out                | Share a file    | Repeatable |
| `FIL-003` | It wasn't a car               | Download a file | Repeatable |
| `FIL-004` | Another one bytes the dust    | Delete a file   | Repeatable |
| `FIL-005` | It's turtles all the way down | Create a folder | Repeatable |
| `FIL-006` | I'm a leaf on the wind        | Delete a folder | Repeatable |

## `EXP` Exploration Achievements

| Code      | Name                             | Conditions                  | Type       |
| --------- | -------------------------------- | --------------------------- | ---------- |
| `EXP-000` | To infinity and beyond           | Unlock all MVP Explorations | One Time   |
| `EXP-001` | Welcome Aboard!                  | Log In                      | Repeatable |
| `EXP-002` | That's where we store the things | Visit Storage Explorer      | Repeatable |
| `EXP-003` | Lakehouse Getaway                | Visit Databricks            | Repeatable |
| `EXP-004` | How do I turn this thing on      | Visit Resources             | Repeatable |
| `EXP-005` | What are you guys up to?         | Visit Another Project       | Repeatable |
| `EXP-006` | Mirror, mirror on the wall       | Visit A Profile             | Repeatable |
| `EXP-007` | Deja Vu                          | Use A Recent Link           | Repeatable |
| `EXP-008` | C'est mieux comme ca             | Toggle Culture              |
| `EXP-010` | Home, sweet home                 | Visit Own Project           |
| `EXP-011` | Why, hello there!                | Visit Another Profile       |
