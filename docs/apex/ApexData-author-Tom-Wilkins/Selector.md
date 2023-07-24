---
layout: default
---
# Selector

Base selector for query classes to implement which effectively combines
two aspects of data frameworks for cohesiveness and simplicity: the selector and the query builder.
Respects security settings established in [DataSettings](../ApexData/DataSettings.md).


**Group** ApexData author Tom Wilkins

## Methods
### `public getSObjectType()`

Should return the type of SObject that the selector is for

#### Returns

|Type|Description|
|---|---|
|Schema|Schema.SObjectTyp such as Account.getSObjectType() or Case.getSObjectType()|

### `public setFields(List<Schema.SObjectField> fields)`

Sets the fields to be queried -- must be set prior to invoking inherited selector methods or invoking the buildQueryString helper.

#### Parameters

|Param|Description|
|---|---|
|`fields`|Fields on the object (provided by getSObjectType override) to query for|

#### Returns

|Type|Description|
|---|---|
|Selector|Reference to the invoking object|

### `public addRelatedListQuery(String relationName, List<Schema.SObjectField> fields)`

Sets a related list to be queried -- must be set prior to invoking inherited selector methods or invoking the buildQueryString helper. Multiple related lists (assuming different relation names) can be set in a single query

#### Parameters

|Param|Description|
|---|---|
|`relationName`|String representation of a relation e.g. MyRelatedObjects__r|
|`fields`|Fields on the related object to query|

#### Returns

|Type|Description|
|---|---|
|Selector|Reference to the invoking object|

### `public addCrossObjectQuery(String relationName, List<Schema.SObjectField> fields)`

Sets a parent object to be queried -- must be set prior to invoking inherited selector methods or invoking the buildQueryString helper. Multiple parent objects (assuming different relation names) can be set in a single query

#### Parameters

|Param|Description|
|---|---|
|`relationName`|String representation of a relation e.g. MyParentObject__r|
|`fields`|Fields on the related object to query|

#### Returns

|Type|Description|
|---|---|
|Selector|Reference to the invoking object|

### `public clearRelatedListQueries()`

Clears the related list queries -- useful if reusing the same selector

#### Returns

|Type|Description|
|---|---|
|Selector|Reference to the invoking object|

### `public clearCrossObjectQueries()`

Clears the cross object queries -- useful if reusing the same selector

#### Returns

|Type|Description|
|---|---|
|Selector|Reference to the invoking object|

### `public getById(Set<Id> recordIds)`

Queries records by Id

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Set of record ids to filter on|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|Records resulting from the query|

### `public getByRecordType(Set<Id> recordTypeIds)`

Queries records by record type id

#### Parameters

|Param|Description|
|---|---|
|`recordTypeIds`|Set of record type ids to filter on|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|Records resulting from the query|

### `public getByRecordType(Set<String> recordTypeDeveloperNames)`

Queries records by record type developer name

#### Parameters

|Param|Description|
|---|---|
|`recordTypeDeveloperNames`|Set of record type developer names to filter on|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|Records resulting from the query|

### `public getByIdAndRecordType(Set<Id> recordIds, Set<Id> recordTypeIds)`

Queries record by record id and record type id

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Set of record ids to filter on|
|`recordTypeIds`|Set of record type ids to filter on|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|Records resulting from the query|

### `public getByIdAndRecordType(Set<Id> recordIds, Set<String> recordTypeDeveloperNames)`

Queries record by record id and record type id

#### Parameters

|Param|Description|
|---|---|
|`recordIds`|Set of record ids to filter on|
|`recordTypeIds`|Set of record type ids to filter on|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|Records resulting from the query|

### `public getByDeveloperName(Set<String> developerNames)`

Queries record by record type developer names

### `public getByName(Set<String> names)`

Queries records by name

#### Parameters

|Param|Description|
|---|---|
|`names`|Set of name values to filter on|

#### Returns

|Type|Description|
|---|---|
|List<SObject>|Records resulting from the query|

### `public getAll()`

WARNING USE WITH CAUTION. SHOULD ONLY BE USED WITH TABLES THAT ARE GUARANTEED TO BE LOW VOLUME. Queries all data for a table. Virtual so that child selectors that are for custom metadata can override with custom metadata specific features, which is hard to do dynamically.

#### Returns

|Type|Description|
|---|---|
|List<SObject>|all records for a table|

---
