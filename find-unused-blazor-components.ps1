$ProjectPath = "C:\Users\yrobert\source\repos\datahub-portal"

# Output the project path
Write-Host $ProjectPath

# Get all the .razor files in the project
$RazorFiles = Get-ChildItem -Path $ProjectPath -Filter *.razor -Recurse

Write-Host "Found $($RazorFiles.Count) .razor files"

# Find and track the unused .razor files that are not found in any other .razor file
$UnusedRazorFiles = @()

# Loop through each .razor file








# Output the unused .razor files
Write-Host "Found $($UnusedRazorFiles.Count) unused .razor files"

# Output the unused .razor files to a file called unused-components.txt
$UnusedRazorFiles | ForEach-Object {
    $RazorFile = $_
    $RazorFile.FullName | Out-File -FilePath "unused-components.txt" -Append
}