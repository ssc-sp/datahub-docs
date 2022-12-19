# PowerBI Accessibility Guidelines

## Built in Accessibility Features that Require no Configuration

<...>

## Keyboard Navigation

<...>

## Power BI Service
After opening up a Power BI Report, press question mark (?) to open up keyboard shortcuts

Shortcuts are:

| **On Report** |  |
|--|--|
| **Command** | **Shortcuts** |
| Move between sections of report | Ctrl + F6 |

| **On visual** |  |
|--|--|
| **Command** | **Shortcuts** |
| Move focus to visual menu | Alt + Shift + F10 |
| Show as a table | Alt + Shift + F11 |
| Enter a visual or layer | Enter |
| Exit a layer or visual | Esc |
| Select or unselect data point | Space |
| Multi-select data points | Ctrl + Space |
| Show data point details | Ctrl + H |
| Clear data selection | Ctrl + Shift + C |

| **Slicer accessibility** |  |
|--|--|
| **Command** | **Shortcuts** |
| Slicer control | Enter |

| **Embedded Report** |  |
|--|--|
| **Command** | **Shortcuts** |
| Focus on report | Ctrl + Enter |

## Power BI Desktop
See the following link for more information on navigating Power BI Desktop via keyboard shortcuts:
- [https://docs.microsoft.com/en-us/power-bi/create-reports/desktop-accessibility-keyboard-shortcuts]()

## Screen reader compatibility
In general, every object in Power BI that has keyboard navigation is also compatible for screen readers. When a report consumer navigates to a visual, the screen reader will read out the title, visual type, and any alt text if that has been set.

## High contrast color view
Power BI has high contrast support for reports. If you're using a high contrast mode in Windows, Power BI Desktop automatically detects which high contrast theme is being used in Windows and applies those settings to your reports. Those high contrast colors follow the report when published to the Power BI service or elsewhere.
(talk about how to change the high contrast in Power BI Service)

## Focus mode
If a report consumer is looking at a visual in a dashboard, they can expand the visual to fill up more of their screen by selecting the Focus mode icon in the context menu of the visual.

Report consumers can view options of a visual by selecting a visual then pressing Alt+Shift+F10.

## Show data table
Report consumers can also view the data in a visual in a tabular format by pressing Alt+Shift+F11. This table is similar to pressing Show Data in the visual context menu, but it shows a table that is screen reader friendly.

## Built in Accessibility Features that Require Configuration

## Alt text
- Visual:
  - Static: The number of new cases shows how much the virus is spreading in San Francisco. Press Control and Right Arrow keys to enter the chart. Use Enter to select a data point. Use Escape to exit.
  - Dynamic: The number of new cases shows how much the virus is spreading in San Francisco. Most recent average is [Measure of new cases] new cases. Press Control and Right Arrow keys to enter the chart. Use Enter to select a data point. Use Escape to exit.
- Table:
  - Use Control and Right Arrow keys to enter the table. Use arrow keys to navigate around the table. Press the Enter key to select a cell. Select a column header to sort by that column. Escape key to exit.
- Filter:
  - Slicer filters the dates shown on the line chart and table. The default selection is all dates with data. Use Control + right arrow keys to enter the filter. Use Spacebar or Enter keys to select items. Use Escape to exit. Charts will update.
- Card:
  - Card showing cumulative, or running total, confirmed covid cases. Most recent running total is [Cumulative Cases] cases, as of [max date]. Press Control + Right Arrow to enter the card. Use Escape to exit.
For text boxes, put the text in the alt text box as well.
- Button:
  - Selected radio button entitled “Cumulative totals”. This button is already selected, the dashboard is showing cumulative totals of covid cases and deaths by gender.
  - Unselected radio button entitled “Trends over time”. Press Enter key to select this view and dashboard will update to show trends over time in covid cases by gender.

- Formula:
  - **"Chart type"** + showing + “what’s it showing”. +
  - **Where** “purpose of looking at chart”. +
  - **"Keyboard instructions"**, like “Press control + right arrow to enter the chart. Press enter to read specific data points. Use escape to exit the visual.”

## Tab order
Setting the tab order helps keyboard users navigate your report in an order that matches the way users visually process the report visuals. If you're including decorative shapes and images in your report, you should remove those from the tab order.

## Titles and labels
Visual and report page titles are important accessibility features that orient the report consumer. Avoid using acronyms or jargon in your report titles; if you share the report to a new user or someone who is external to your organization, they may not know what your terms or acronyms mean. The following image shows a visual with an acronym in the title (on the left), and a clearer title for the visual on the right.

## Markers
It's a best practice to avoid using color (including features conditional formatting) as the only way of conveying information. Instead, you can use markers to convey different series.

For Line, Area, and Combo visuals, as well as for Scatter and Bubble visuals, you can turn markers on, and use a different Marker shape for each line.

## Report themes
Certain color combinations are particularly difficult for users with color vision deficiencies to distinguish. These include the following combinations:

- green and red
- green and brown
- blue and purple
- green and blue
- light green and yellow
- blue and grey
- green and grey
- green and black

Avoid using these colors together in a chart, or on the same report page. Power BI has some built-in themes to help make your report more accessible, but it's best practice to check your report with some of the additional tools suggested in this article.

## Tips

## Understand what your audience wants

## Keep your report simple and consistent

## Test for low vision
- turn down the brightness
- change the high-contrast colors

## Report accessibility checklist

## All visuals

## Slicers

## Textbox

## Visual interactions

## Sort order

## Tooltips

## Video

## Audio

## Shapes

## Images

## Power BI visuals

## Across visuals on the page

## Considerations and limitations
There are a few known issues and limitations with the accessibility features. Descriptions of those issues and limitations are in the following list:
- When using screen readers with Power BI Desktop, you'll have the best experience if you open your screen reader before opening any files in Power BI Desktop.

## Reference
- [https://docs.microsoft.com/en-us/power-bi/create-reports/desktop-accessibility-creating-reports]()
- [https://datasf.gitbook.io/public-data-visualization-guide/accessibility/alt-text]()

