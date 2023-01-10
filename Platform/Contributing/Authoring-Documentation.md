# Documentation Authoring Overview

## Authoring workflow

1. Resource page is authored in English and added to the datahub-docs repository
1. Resource page is manually added to the sidebar by the author.
1. On commit to the english repository, a github action translates the document and the sidebar with Deepl
1. Translation is pushed to the French repository on the `deepl` branch. A header is added to the document that mentions that the translation has not been validated. 
1. The sidebars are also translated
1. SP members review the translated documentation with the translation service and validate the translation.
1. A pull request is created to push the validated documents to the `main` branch in the `datahub-docs-fr` repository.

## DataHub Embedded Wiki Integration



