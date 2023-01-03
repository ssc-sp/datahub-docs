namespace SyncDocs;

internal class ReplicationService
{
	private readonly ConfigParams _config;
	private readonly string _sourcePath;
	private readonly TranslationService _translationService;

    public ReplicationService(ConfigParams config, string sourcePath, TranslationService translationService)
	{
		_config = config;
        _sourcePath = sourcePath;
        _translationService = translationService;
    }

	public void AddFolder(string path) 
	{
        var outputFolder = GetTargetPath(path);
        if (!Directory.Exists(outputFolder))
		{
            Directory.CreateDirectory(outputFolder);
        }
    }

    public async Task AddFile(string path)
    {
        var sourceFileName = Path.GetFileName(path);

        // remap the path
        var sourcePath = path.Substring(0, path.Length - sourceFileName.Length);
		var outputPath = GetTargetPath(sourcePath);
        
        // handle file name translation
        var translatedName = sourceFileName; 
        if (!sourceFileName.StartsWith('_'))
            translatedName = await _translationService.TranslateFileName(sourceFileName);

        // build output path
        var outputFilePath = Path.Combine(outputPath, translatedName);
		if (!File.Exists(outputFilePath))
		{
            Console.WriteLine($"+ {outputFilePath}");
            await _translationService.TranslateMarkupFile(path, outputFilePath, "_sidebar.md".Equals(translatedName));
        }        
    }

	private string GetTargetPath(string path)
	{
		var relativePath = path.Substring(_sourcePath.Length);
		return Path.Combine(_sourcePath, _config.Target, relativePath);
    }
}
