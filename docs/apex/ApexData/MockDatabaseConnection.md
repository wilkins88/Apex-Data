---
layout: default
---
# MockDatabaseConnection

`ISTEST`

Mock database implementation for providing basic db functionality without requiring a coupling
to the Salesforce DB (which then imposes that any operation that involves dml must be unit tested)


**Implemented types**

[IDatabaseConnection](./IDatabaseConnection.md)


**Group** ApexData


**Author** Tom Wilkins

## Methods
### `public getRecord(Id recordId)`

Returns a record by record id, null if the id doesn't exists

#### Parameters

|Param|Description|
|---|---|
|`recordId`|Id of the record to retrieve|

#### Returns

|Type|Description|
|---|---|
|SObject|Record if it exists, null otherwise|

### `public getDeletedRecord(Id recordId)`

Returns a deleted record by record id, null if the id doesn't exists

#### Parameters

|Param|Description|
|---|---|
|`recordId`|Id of the record to retrieve|

#### Returns

|Type|Description|
|---|---|
|SObject|Record if it exists, null otherwise|

### `public getAllRecordsForSObject(Schema sObjType)`

Returns all records for a particular SObject

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|The type of sobject to retrieve records for|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|List of all records for the requested SObject type|

### `public setErrorState(String errorMessage, String errorCode, List<String> fields)`

Sets the error state to allow for error testing

#### Parameters

|Param|Description|
|---|---|
|`errorMessage`|Error message to returned in the result|
|`errorCode`|Error code to be retured in the result|
|`fields`|Error fields to be returned in the result|

### `public clearErrorState()`

Clears error state

### `public insertRecords(List<SObject> records, Database options)`

**See** [[IDatabaseConnection](./IDatabaseConnection.md)]([IDatabaseConnection](./IDatabaseConnection.md))

### `public updateRecords(List<SObject> records, Database options)`

**See** [[IDatabaseConnection](./IDatabaseConnection.md)]([IDatabaseConnection](./IDatabaseConnection.md))

### `public upsertRecords(List<SObject> records, Boolean allOrNone)`

**See** [[IDatabaseConnection](./IDatabaseConnection.md)]([IDatabaseConnection](./IDatabaseConnection.md))

### `public upsertRecords(List<SObject> records, Schema externalIdField, Boolean allOrNone)`

**See** [[IDatabaseConnection](./IDatabaseConnection.md)]([IDatabaseConnection](./IDatabaseConnection.md))

### `public deleteRecords(List<Id> recordIds, Boolean allOrNone)`

**See** [[IDatabaseConnection](./IDatabaseConnection.md)]([IDatabaseConnection](./IDatabaseConnection.md))

### `public undeleteRecords(List<Id> recordIds, Boolean allOrNone)`

**See** [[IDatabaseConnection](./IDatabaseConnection.md)]([IDatabaseConnection](./IDatabaseConnection.md))

---
