---
layout: default
---
# SObjectInspector



**Descsription** SObject inspector used to inspect, explore, and retrieve farious aspects of SObject records


**Group** ApexData


**Author** Tom Wilkins

## Constructors
### `public SObjectInspector(Schema sObjType)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|Type of SObject to inspect|

### `public SObjectInspector(Id recordId)`

Constructor for parsing sobject information from an Id

#### Parameters

|Param|Description|
|---|---|
|`recordId`|Id of the record to retrieve sObject information about|

---
## Methods
### `public getAllFields()`

Returns all fields for the provided sobject type

#### Returns

|Type|Description|
|---|---|
|List<Schema.SObjectField>|All fields for the SObject type|

### `public getField(String fieldName)`

Returns a single field for the provided sobject type

#### Returns

|Type|Description|
|---|---|
|Schema|The field captured by the fieldname, null if invalid field name for the sobject type|

### `public getPicklistValues(Schema field)`

Returns the picklist values for the provided field

#### Parameters

|Param|Description|
|---|---|
|`field`|Field to retrieve picklist values for|

#### Returns

|Type|Description|
|---|---|
|List<Schema.PicklistEntry>|list of picklist values|

### `public getPicklistValues(String fieldName)`

Returns the picklist values for the provided field name

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|Name of the field to retrieve picklist values for|

#### Returns

|Type|Description|
|---|---|
|List<Schema.PicklistEntry>|list of picklist values|

### `public getRecordTypeId(String recordTypeDevName)`

Returns the record type id for the provided record type developer name

#### Parameters

|Param|Description|
|---|---|
|`recordTypeDevName`|The developer name of the record type to retrieve the id for|

#### Returns

|Type|Description|
|---|---|
|Id|Record Id for the provided dev name, null if invalid record type dev name|

### `public getRecordTypeDeveloperName(Id recordTypeId)`

Returns the record type dev name for the provided record type id

#### Parameters

|Param|Description|
|---|---|
|`recordTypeDevName`|The id of the record type to retrieve the developer name for|

#### Returns

|Type|Description|
|---|---|
|String|Record Id for the provided dev name, null if invalid record type id|

### `public canDelete()`

Returns whether or not the current user can delete the injected sobject type

#### Returns

|Type|Description|
|---|---|
|Boolean|True if can delete, false otherwise|

### `public getSObjectType()`

Returns the type of SObject being inspected

#### Returns

|Type|Description|
|---|---|
|Schema|SObject type being inspected|

---
