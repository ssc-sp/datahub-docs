# Metadata

The **metadata** is used to describe Datahub related objects. And this documents explains the model used to represent the metadata definitions and the values associated to an object in the system. The metadata can describe any object that is identified by an unique identifier. It is recommended to use GUIDs as the identifiers for objects to avoid conflicts.

## Data Model Entities

![](https://github.com/NRCan/datahub-portal/blob/develop/Datahub.Metadata/Metadata_definition.png)

### MetadataVersions

A metadata version describes a version and schema name for a specific set of field definitions. The table should be renamed to schema in the future. The field _Source_TXT_ represents the name of the schema (or source) of a set of definitions.

### FieldDefinitions

The Field Definitions table stores the definition of all the fields for a set of fields (schema/source). All the fields have localized name and descriptions.

### FieldChoices

Some field definitions may have a pre determined list of choices. The FieldChoice stores the name and localization for every choice of a field definition.

### ObjectMetadata

Master record for an object metadata, it represents and external object in the Datahub metadata storage.

### ObjectFieldValues

Stores all the field values describing the metadata of an object.

## How to introduce a set of Metadata?

* Create a new record in the **MetadataVersions** table.
* Create the set of **FieldDefinitions** and corresponding **FieldChoices**.
