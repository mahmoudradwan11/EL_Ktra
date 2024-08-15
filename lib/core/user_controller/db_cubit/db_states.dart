abstract class DatabaseStates{}
class DatabaseInitStates extends DatabaseStates{}
class CreateDatabaseState extends DatabaseStates{}
class ErrorCreateDatabaseState extends DatabaseStates{}
class InsertDatabaseState extends DatabaseStates{}
class ErrorInsertDatabaseState extends DatabaseStates{}
class GetDatabaseState extends DatabaseStates{}
class ErrorGetDatabaseState extends DatabaseStates{}
class ChoosePaymentMethod extends DatabaseStates{}
class DeleteDatabase extends DatabaseStates{}
class ChangeActiveTap extends DatabaseStates{}