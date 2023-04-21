# User Achievements and Profile personalization

# Overview

This document describes the design of the User Achievements and Profile personalization feature.

# User Achievements

## Achievement Types

Achievements are divided into three types:

- **One-time**: Achievements that are awarded once, and never again.
- **Repeatable**: Achievements that are awarded multiple times.
- **Collectable**: Achievements that are awarded based on a count or collection.

## User Profile Levels

The user's profile level is calculated based on the total score of all the user's achievements. The level is calculated based on the following formula:

```csharp
int level = (int)Math.Floor(Math.Log(score, 2));
```

The score is calculated based on the achievement type:

- **One-time**: The score is usually 1, but can be any value.
- **Repeatable**: The score is usually 1, but can be any value.
- **Collectable**: The score is usually the number of items in the collection, but can be any value.

## Achievement Unlockables

Achievements can be unlocked by the user, and can be used to personalize the user's profile. Unlockables are divided into two types:

- **Background Images**: Background images that can be used to personalize the user's profile.
- **Profile Pictures**: Profile pictures that can be used to personalize the user's profile.

## Data Model

The following diagram shows the data model for the User Achievements feature:

```mermaid

classDiagram

    class PortalUser {
        +int Id
        +guid GraphId
        +string? BackgroundImageUrl
        +string? ProfilePictureUrl
        +bool OptOut
    }

    class TelemetryEvent {
        +int Id
        +int UserId
        +string EventName
        +DateTime EventDate
    }

    class Achievement {
        <<seedable>>
        +int Id
        +string Name
        +string Description
        +int Points
        +string ImageUrl
        +AchievementType Type
        +string? UnlockableUrl
        +UnlockableType? Type
    }

    class AchievementRule {
        +int id
        +int AchievementId
        +string Expression
    }

    class UserAchievement {
        +int UserId
        +int AchievementId
        +int Count
        +DateTime UnlockedAt
    }

    class AchievementType {
        <<enumeration>>
        OneTime
        Repeatable
        Countable
    }

    class UnlockableType {
        <<enumeration>>
        BackgroundImage
        ProfilePicture
        Badge
    }

    AchievementRule --> Achievement
    UserAchievement --> Achievement
    UserAchievement --> PortalUser
    TelemetryEvent --> PortalUser
    
```
