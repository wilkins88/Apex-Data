---
layout: default
---
# IDatabaseConnection

Base interface for datqabase connections. Primarily used to decouple libraries
from standard DML and to support mocking


**Group** ApexData


**Author** Tom Wilkins

## Methods
### `public insertRecords(List<SObject> records, Database options)`

Inserts a collection of records with dml options

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to insert|
|`options`|Dml options to set for dml operation|

#### Returns

|Type|Description|
|---|---|
|List<Database.SaveResult>|Save results from the insert operation|

### `public updateRecords(List<SObject> records, Database options)`

Updates a collection of records with dml options

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to update|
|`options`|Dml options to set for dml operation|

#### Returns

|Type|Description|
|---|---|
|List<Database.SaveResult>|Save results from the update operation|

### `public upsertRecords(List<SObject> records, Boolean allOrNone)`

Upserts a collection of records with an all or none flag

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to update|
|`allOrNone`|Whether or not the upsert operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|List<Database.UpsertResult>|Upsert results from the upsert operation|

### `public upsertRecords(List<SObject> records, Schema externalIdField, Boolean allOrNone)`

Upserts a collection of records with an all or none flag

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to update|
|`externalIdField`|External Id field to upsert on|
|`allOrNone`|Whether or not the upsert operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|List<Database.UpsertResult>|Upsert results from the upsert operation|

### `public deleteRecords(List<Id> recordIds, Boolean allOrNone)`

Deletes a collection of records with an all or none flag

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Ids of records to delete|
|`allOrNone`|Whether or not the delete operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|List<Database.DeleteResult>|Delete results from the delete operation|

### `public undeleteRecords(List<Id> recordIds, Boolean allOrNone)`

Undeletes a collection of records with an all or none flag

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Ids of records to undelete|
|`allOrNone`|Whether or not the undelete operation should be all or none|

#### Returns

|Type|Description|
|---|---|
|List<Database.UndeleteResult>|Undelete results from the undelete operation|

---
