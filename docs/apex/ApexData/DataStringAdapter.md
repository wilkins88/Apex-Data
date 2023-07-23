---
layout: default
---
# DataStringAdapter

Adapter for processing various strings/enums to provide consistency throughout the app


**Group** ApexData


**Author** Tom Wilkins

## Methods
### `public fromAccessType(System access)`

Returns the string mapping for the provided STD Lib access type enum

#### Parameters

|Param|Description|
|---|---|
|`access`|(System.AccessType)[https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_AccessType.htm] Enum to generate string for|

#### Returns

|Type|Description|
|---|---|
|String|Standardized string for the provided access type|

### `public fromDatabaseOperation(DatabaseOperation operation)`

Returns the string mapping for the provided custom Database operation unem

#### Parameters

|Param|Description|
|---|---|
|`operation`|[DatabaseOperation](./DatabaseOperation.md) Enum to generate string for|

#### Returns

|Type|Description|
|---|---|
|String|Standardized string for the provided database operation|

---
