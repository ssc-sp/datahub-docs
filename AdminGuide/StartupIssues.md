# Startup Issues Diagnostics

## Changing Log Levels in App Service

To diagnose startup issues in Azure App Service, you need to adjust the logging levels for both the default logger and Microsoft-specific loggers. This will provide detailed diagnostic information about what's happening during application startup.

### Using Application Settings

You can change log levels by updating the application settings in your Azure App Service. There are two key logging configuration settings:

#### 1. Default Log Level

The `Logging__LogLevel__Default` setting controls the base logging level for your application.

#### 2. Microsoft Log Level

The `Logging__LogLevel__Microsoft` setting controls the verbosity of Microsoft framework and library logs (e.g., ASP.NET Core, Entity Framework).

### Configuration via Azure Portal

1. Navigate to your App Service in Azure Portal
2. Go to **Configuration** > **Application settings**
3. Add or modify these application settings:

| Name                           | Value              | Description                                |
| ------------------------------ | ------------------ | ------------------------------------------ |
| `Logging__LogLevel__Default`   | `Debug` or `Trace` | Controls default application logging level |
| `Logging__LogLevel__Microsoft` | `Debug` or `Trace` | Controls Microsoft framework logging level |

### Configuration via JSON

If you're deploying via infrastructure-as-code or manual configuration, use these settings:

```json
{
  "name": "Logging__LogLevel__Microsoft",
  "value": "Debug",
  "slotSetting": false
},
{
  "name": "Logging__LogLevel__Default",
  "value": "Debug",
  "slotSetting": false
}
```

### Log Level Options

| Level         | Description                                                         | Use Case                                |
| ------------- | ------------------------------------------------------------------- | --------------------------------------- |
| `Trace`       | Most detailed; logs everything including internal framework details | Deep debugging of startup issues        |
| `Debug`       | Detailed diagnostic information                                     | General troubleshooting and diagnostics |
| `Information` | General informational messages                                      | Standard production logging             |
| `Warning`     | Warning messages for potential issues                               | Default production level                |
| `Error`       | Error messages only                                                 | Minimal logging                         |
| `Critical`    | Only critical failures                                              | Severely limited logging                |

### How to View the Logs

After updating log levels, you can view the logs in several ways:

1. **Azure Portal - Log Stream**
   
   - Go to your App Service
   - Navigate to **Monitoring** > **Log stream**
   - Watch real-time output

2. **Azure CLI**
3. 
   ```bash
   az webapp log tail --name <app-name> --resource-group <resource-group>
   ```

4. **Application Insights** (if configured)
   - Check the **Logs** section in Application Insights
   - Query for startup-related events

### Recommended Configuration for Diagnostics

For comprehensive startup issue diagnosis, set both values to `Debug`:

- `Logging__LogLevel__Default`: `Debug`
- `Logging__LogLevel__Microsoft`: `Debug`

This provides detailed information about:

- Application initialization steps
- Framework-level operations
- Dependency injection configuration
- Middleware execution
- Configuration loading

### Important Notes

- Changes to application settings typically require an app restart to take effect
- Keep debug/trace logging enabled only during troubleshooting; revert to `Information` or `Warning` for production
- High verbosity logs may impact performance and increase storage costs
- Use Application Insights for long-term diagnostic data retention and advanced querying
  