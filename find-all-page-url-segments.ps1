$ProjectPath = "C:\Users\yrobert\source\repos\datahub-portal"

# Output the project path
Write-Host $ProjectPath

# Get all the .razor files in the project
$RazorFiles = Get-ChildItem -Path $ProjectPath -Filter *.razor -Recurse

Write-Host "Found $($RazorFiles.Count) .razor files"

$UniqueSegments = @()

# loop through each .razor file
# if it has a @page directive, save the url into an array
# then split the array by "/"
# skip any empty strings
# skip any strings that contain a "{" or "}"
# and save each item into a map of unique segments
$RazorFiles | ForEach-Object {
    $RazorFile = $_
    $RazorFileContent = Get-Content -Path $RazorFile.FullName
    $PageDirective = $RazorFileContent | Where-Object { $_ -like "@page*" }
    if ($PageDirective) {
        $PageDirectiveUrl = $PageDirective -replace "@page ", ""
        $PageDirectiveUrlSegments = $PageDirectiveUrl -split "/"
        $PageDirectiveUrlSegments | ForEach-Object {
            $Segment = $_
            # replace all the double quotes with nothing
            $Segment = $Segment -replace '"', ""
            # skip if it has a "{" or "<" or '"' or is empty
            if ($Segment -notmatch "{" -and $Segment -notmatch "<" -and $Segment) {
                if ($UniqueSegments -notcontains $Segment) {
                    $UniqueSegments += $Segment
                }
            }
        }
    }
}



# if unique-page-segments.txt exists, delete it
if (Test-Path -Path "unique-page-segments.txt") {
    Remove-Item -Path "unique-page-segments.txt"
}

# then output the map to a file called unique-page-segments.txt
$UniqueSegments | ForEach-Object {
    $Segment = $_
    $Segment | Out-File -FilePath "unique-page-segments.txt" -Append
}