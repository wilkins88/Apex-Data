---
layout: default
---
# Classes
## ApexData

### [DataExceptions](./ApexData/DataExceptions.md)

Exception container class for organizing exceptions specific to this data library



### [DataSettings](./ApexData/DataSettings.md)

Data Settings singleton for managing security and other data interaction settings
through the application



### [DatabaseConnection](./ApexData/DatabaseConnection.md)

Standard database connection that wraps the system Database API for various dml operations.



### [IDatabaseConnection](./ApexData/IDatabaseConnection.md)

Base interface for datqabase connections. Primarily used to decouple libraries
from standard DML and to support mocking



### [MockDatabaseConnection](./ApexData/MockDatabaseConnection.md)

Mock database implementation for providing basic db functionality without requiring a coupling
to the Salesforce DB (which then imposes that any operation that involves dml must be unit tested)



### [SObjectMocker](./ApexData/SObjectMocker.md)

Class used for mocking sObjects to generate fake ids, data, etc.


