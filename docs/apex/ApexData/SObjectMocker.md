---
layout: default
---
# SObjectMocker

`ISTEST`

Class used for mocking sObjects to generate fake ids, data, etc.


**Group** ApexData


**Auther** Tom Wilkins

## Constructors
### `public SObjectMocker(Schema sObjType)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|The type of sobject that should be mocked by this instance|

### `public SObjectMocker(Schema sObjType, System sObjClassType)`

Constructor - Both schema and system types

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|The type of sobject that should be mocked by this instance|
|`sObjClasstype`|The class type of object -- should match the sobject type injected|

---
## Methods
### `public generateMockId()`

Generates a mock id for the injected sobject type

#### Returns

|Type|Description|
|---|---|
|Id|Mock Id for the injected sobject type|

### `public shouldGenerateIds(Boolean generateIds)`

Sets whether or not the mocker should generate ids for records

#### Parameters

|Param|Description|
|---|---|
|`generateIds`|Whether or not the mocker should generated ids|

#### Returns

|Type|Description|
|---|---|
|SObjectMocker|Reference to the invoking object|

### `public setRelatedList(String relatedListName, List<SObject> relatedListRecords)`

Sets a related list that will be created with each generated SObject

#### Parameters

|Param|Description|
|---|---|
|`relatedListName`|API name for the related list|
|`relatedListRecords`|Records to be captured as a part of the related list|

#### Returns

|Type|Description|
|---|---|
|SObjectMocker|Reference to the invoking object|

---
