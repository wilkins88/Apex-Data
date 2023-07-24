---
layout: default
---
# Classes
## ApexData

### [Data](./ApexData/Data.md)

Static accessor class for providing a static facade over stateless instance classes (to support mocking/testing)



### [DataExceptions](./ApexData/DataExceptions.md)

Exception container class for organizing exceptions specific to this data library



### [DataSettings](./ApexData/DataSettings.md)

Data Settings singleton for managing security and other data interaction settings
through the application



### [DataStringAdapter](./ApexData/DataStringAdapter.md)

Adapter for processing various strings/enums to provide consistency throughout the app



### [DatabaseConnection](./ApexData/DatabaseConnection.md)

Standard database connection that wraps the system Database API for various dml operations.



### [DatabaseOperation](./ApexData/DatabaseOperation.md)

Enum for capturing database operations



### [Dml](./ApexData/Dml.md)

Dml service class for implementing flexible, secure-by-default conn write operations
Should be used in place of standard DML and/or Database operations



### [IDatabaseConnection](./ApexData/IDatabaseConnection.md)

Base interface for datqabase connections. Primarily used to decouple libraries
from standard DML and to support mocking



### [MockDatabaseConnection](./ApexData/MockDatabaseConnection.md)

Mock database implementation for providing basic db functionality without requiring a coupling
to the Salesforce DB (which then imposes that any operation that involves dml must be unit tested)



### [SObjectInspector](./ApexData/SObjectInspector.md)




### [SObjectMocker](./ApexData/SObjectMocker.md)

Class used for mocking sObjects to generate fake ids, data, etc.



### [SelectorFactory](./ApexData/SelectorFactory.md)

Factory class for producing selectors to allow decoupling of construction
and utilization



### [SmartDataFactory](./ApexData/SmartDataFactory.md)

Flexible data factory for generating data for a given SObject Type


## ApexData author Tom Wilkins

### [Selector](./ApexData-author-Tom-Wilkins/Selector.md)

Base selector for query classes to implement which effectively combines
two aspects of data frameworks for cohesiveness and simplicity: the selector and the query builder.
Respects security settings established in [DataSettings](./ApexData/DataSettings.md).


