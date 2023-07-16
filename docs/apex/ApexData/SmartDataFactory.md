---
layout: default
---
# SmartDataFactory

`ISTEST`

Flexible data factory for generating data for a given SObject Type


**Group** ApexData


**Author** Tom Wilkins

## Methods
### `public createSObjects(Schema sObjType, Map<Schema.SObjectField,Object> fieldValues, Integer numOfRecords)`

Generates SObjects (not inserted) for the provided sobject inputs

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|Type of SObject to make records for|
|`fieldValues`|Field -> value mapping to set on each record -- this will be consistent accross all records|
|`numOfRecords`|Number of records to generate|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|List of generated SObjects, not inserted|

### `public createSObjects(Schema sObjType, Integer numOfRecords)`

Generates SObjects (not inserted) for the provided sobject inputs

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|Type of SObject to make records for|
|`numOfRecords`|Number of records to generate|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|List of generated SObjects, not inserted|

---
