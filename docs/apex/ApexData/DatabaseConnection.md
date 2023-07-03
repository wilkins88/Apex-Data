---
layout: default
---
# DatabaseConnection

Standard database connection that wraps the system Database API for various dml operations.


**Implemented types**

[IDatabaseConnection](./IDatabaseConnection.md)


**Group** ApexData


**Author** Tom Wilkins

## Methods
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
