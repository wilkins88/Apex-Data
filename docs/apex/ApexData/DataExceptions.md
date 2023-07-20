---
layout: default
---
# DataExceptions

Exception container class for organizing exceptions specific to this data library


**Group** ApexData


**Author** Tom Wilkins

## Classes
### FlsException

**Inheritance**

FlsException

#### Constructors
##### `public FlsException(System access, List&lt;String&gt; violations)`

Constructor

###### Parameters

|Param|Description|
|---|---|
|`access`|[System.AccessType](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_AccessType.htm) that was used to determine FLS violation|
|`violations`|Fields or Objects that failed the FLS check|

##### `public FlsException(DatabaseOperation operation, List&lt;String&gt; violations)`

Constructor

###### Parameters

|Param|Description|
|---|---|
|`operation`|[DatabaseOperation](DatabaseOperation) that was used to determine FLS violation|
|`violations`|Fields of Objects that failed the FLS check|

---
#### Methods
##### `public override getMessage()`

Returns FLS error message based on injected variables

###### Returns

|Type|Description|
|---|---|
|String|Custom error message|

---

### SettingsException

**Inheritance**

SettingsException


---
