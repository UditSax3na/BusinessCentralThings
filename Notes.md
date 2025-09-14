# Application Language

## Type of object in Business Central
### Core Objects

1) Table
    - Stores data in the database.
    - Each table maps to a physical SQL table.
    - Example: "Customer", "Purchase Header", "Sales Line".

2) Page

    - UI representation of data.
    - Displays table data to the user (Caxrd, List, Worksheet, Document, RoleCenter).
    - Example: "Customer Card", "Sales Order", "Purchase Invoice".

3) Codeunit
    - Container for AL code (procedures/functions).
    - Used for business logic and event subscribers.
    - Example: "Sales-Post", "Report Management".

4) Report
    - Used to format and print data.
    - Can be RDLC or Word layouts.
    - Example: "Sales Invoice", "Purchase Order".

5) XMLport
    - Import/export data in XML or CSV format.
    - Used for integrations or data migration.

6) Query
    - Used for data retrieval (like SQL SELECT).
    - Can expose data to OData/Power BI.
    - Example: CustomerSalesQuery.

7) Enum
    - Defines a fixed list of values (like Option, but extensible).
    - Example: "Document Status", "Sales Document Type".

8) Profile
    - Defines Role Center personalization.
    - Determines what a user’s dashboard looks like.

### Extension Objects
These extend existing objects instead of creating new ones:

1) TableExtension
    - Add fields, keys, or triggers to an existing table.
    - Example: Add "Complaint No." to "Customer" table.

2) PageExtension
    - Modify existing pages (add fields, actions, layouts).
    - Example: Add "Complaints" action to "Customer Card".

3) EnumExtension
    - Add new values to existing enums.
    - Example: Add "Archived" to "Document Status" enum.


### Special Objects

1) Interface
    - Defines a set of procedures that other objects must implement (like in OOP).
    - Used for dependency injection.

2) ControlAddIn
    - Custom UI controls built in JavaScript.
    - Example: Barcode scanner, chart control.

3) PermissionSet / PermissionSetExtension
    - Defines user permissions (what tables/pages they can access).

4) Entitlement
    - Defines which license or plan grants access to which objects.