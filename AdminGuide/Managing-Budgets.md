# Budgets

Workspaces have two key budget items:
- Warning and alert budgets
- Azure budget limits

## Warning and alert budgets

Warning and alert budgets are stored in `Projects` table in column `Project_Budget`

### Sample query to update missing budgets

```sql
UPDATE [dbo].[Projects]
SET Project_Budget = 400 where Project_Budget is null
```