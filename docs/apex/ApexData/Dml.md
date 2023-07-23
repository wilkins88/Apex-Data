---
layout: default
---
# Dml

Dml service class for implementing flexible, secure-by-default conn write operations
Should be used in place of standard DML and/or Database operations


**Group** ApexData


**Author** Tom Wilkins

## Constructors
### `public Dml(IDatabaseConnection conn)`
---
## Methods
### `public insertRecord(SObject record)`

Inserts a single record

#### Parameters

|Param|Description|
|---|---|
|`record`|Record to insert|

#### Returns

|Type|Description|
|---|---|
|Database|Database.SaveResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public insertRecord(SObject record, Database options)`

Inserts a single record with DML options

#### Parameters

|Param|Description|
|---|---|
|`record`|Record to insert|
|`options`|[Database.DMLOptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_dmloptions.htm) for the dml operation|

#### Returns

|Type|Description|
|---|---|
|Database|Database.SaveResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public insertRecords(List<SObject> records)`

Inserts a collection of records

#### Parameters

|Param|Description|
|---|---|
|`record`|Records to insert|

#### Returns

|Type|Description|
|---|---|
|List<Database.SaveResult>|List<Database.SaveResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public insertRecords(List<SObject> records, Database options)`

Inserts a collection of records with DML options

#### Parameters

|Param|Description|
|---|---|
|`record`|Records to insert|
|`options`|[Database.DMLOptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_dmloptions.htm) for the dml operation|

#### Returns

|Type|Description|
|---|---|
|List<Database.SaveResult>|List<Database.SaveResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public updateRecord(SObject record)`

Updates a single record

#### Parameters

|Param|Description|
|---|---|
|`record`|Record to update|

#### Returns

|Type|Description|
|---|---|
|Database|Database.SaveResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public updateRecord(SObject record, Database options)`

Updates a single record with DML options

#### Parameters

|Param|Description|
|---|---|
|`record`|Record to update|
|`options`|[Database.DMLOptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_dmloptions.htm) for the dml operation|

#### Returns

|Type|Description|
|---|---|
|Database|Database.SaveResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public updateRecords(List<SObject> records)`

Updates a collection of records

#### Parameters

|Param|Description|
|---|---|
|`record`|Records to update|

#### Returns

|Type|Description|
|---|---|
|List<Database.SaveResult>|List<Database.SaveResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public updateRecords(List<SObject> records, Database options)`

Updates a collection of records with DML options

#### Parameters

|Param|Description|
|---|---|
|`record`|Records to update|
|`options`|[Database.DMLOptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_dmloptions.htm) for the dml operation|

#### Returns

|Type|Description|
|---|---|
|List<Database.SaveResult>|List<Database.SaveResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public upsertRecord(SObject record)`

Upserts a single record

#### Parameters

|Param|Description|
|---|---|
|`record`|Record to upsert|

#### Returns

|Type|Description|
|---|---|
|Database|Database.UpsertResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public upsertRecord(SObject record, Schema externalIdField)`

Upserts a single record on an external Id field

#### Parameters

|Param|Description|
|---|---|
|`record`|Record to upsert|
|`externalIdField`|Field to upsert on|

#### Returns

|Type|Description|
|---|---|
|Database|Database.UpsertResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public upsertRecords(List<SObject> records)`

Upserts a collection of records

#### Parameters

|Param|Description|
|---|---|
|`record`|Records to upsert|

#### Returns

|Type|Description|
|---|---|
|List<Database.UpsertResult>|List<Database.UpsertResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public upsertRecords(List<SObject> records, Schema externalIdField)`

Upserts a collection of records on an exteranal id

#### Parameters

|Param|Description|
|---|---|
|`record`|Records to upsert|
|`externalIdField`|Field to upsert on|

#### Returns

|Type|Description|
|---|---|
|List<Database.UpsertResult>|List<Database.UpsertResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public upsertRecords(List<SObject> records, Boolean allOrNone)`

Upserts a collection of records

#### Parameters

|Param|Description|
|---|---|
|`record`|Records to upsert|
|`allOrNone`|Whether partial conn writes should be allowed|

#### Returns

|Type|Description|
|---|---|
|List<Database.UpsertResult>|List<Database.UpsertResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public upsertRecords(List<SObject> records, Schema externalIdField, Boolean allOrNone)`

Upserts a collection of records on an exteranal id

#### Parameters

|Param|Description|
|---|---|
|`record`|Records to upsert|
|`allOrNone`|Whether partial conn writes should be allowed|

#### Returns

|Type|Description|
|---|---|
|List<Database.UpsertResult>|List<Database.UpsertResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public deleteRecord(SObject record)`

Deletes a single record

#### Parameters

|Param|Description|
|---|---|
|`record`|Record to delete|

#### Returns

|Type|Description|
|---|---|
|Database|Database.DeleteResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public deleteRecord(Id recordId)`

Deletes a single record

#### Parameters

|Param|Description|
|---|---|
|`recordId`|Id of the record to delete|

#### Returns

|Type|Description|
|---|---|
|Database|Database.DeleteResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public deleteRecords(List<SObject> records)`

Deletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to delete|

#### Returns

|Type|Description|
|---|---|
|List<Database.DeleteResult>|List<Database.DeleteResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public deleteRecords(List<SObject> records, Boolean allOrNone)`

Deletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`records`|Records to delete|
|`allOrNone`|Whether partial conn writes should be allowed|

#### Returns

|Type|Description|
|---|---|
|List<Database.DeleteResult>|List<Database.DeleteResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public deleteRecords(List<Id> recordIds)`

Deletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Ids of the records to delete|

#### Returns

|Type|Description|
|---|---|
|List<Database.DeleteResult>|List<Database.DeleteResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public deleteRecords(List<Id> recordIds, Boolean allOrNone)`

Deletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Ids of the records to delete|
|`allOrNone`|Whether partial conn writes should be allowed|

#### Returns

|Type|Description|
|---|---|
|List<Database.DeleteResult>|List<Database.DeleteResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public undeleteRecord(Id recordId)`

Undeletes a single record

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Id of the record to undelete|

#### Returns

|Type|Description|
|---|---|
|Database|Database.UndeleteResult from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public undeleteRecords(List<Id> recordIds)`

Undeletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Ids of the records to undelete|

#### Returns

|Type|Description|
|---|---|
|List<Database.UndeleteResult>|List<Database.UndeleteResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

### `public undeleteRecords(List<Id> recordIds, Boolean allOrNone)`

Undeletes a collection of records

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Ids of the records to undelete|
|`allOrNone`|Whether partial conn writes should be allowed|

#### Returns

|Type|Description|
|---|---|
|List<Database.UndeleteResult>|List<Database.UndeleteResult> from the dml operation|

#### Throws

|Exception|Description|
|---|---|
|`DataExceptions`|.FlsException [DataExceptions.FlsException](DataExceptions.FlsException)|

---
