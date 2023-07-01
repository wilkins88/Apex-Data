---
layout: default
---
# DataSettings

Data Settings singleton for managing security and other data interaction settings
through the application


**Author** Tom Wilkins

## Methods
### `public static getInstance()`

Singleton accessor for the data settings class

#### Returns

|Type|Description|
|---|---|
|DataSettings|Reference to the DataSettings singleton|

### `public isFlsEnforced()`

Returns whether or not FLS is currently enforced for data transactions Note that this will always return false for any users with the Bypass FLS custom permission

#### Returns

|Type|Description|
|---|---|
|Boolean|True if fls should be enforced, false otherwise|

### `public enableFls()`

Enables FLS for subsequent data actions

### `public disableFls()`

Disables FLS for subsequent data actions

### `public enableMockDatabase()`

Enables the mock database for tests

### `public disableMockDatabase()`

Disables the mock database for tests

---
