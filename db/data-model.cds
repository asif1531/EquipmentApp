namespace equipement.com.app;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Equipments : cuid, managed {
    name         : String @title: 'Name';
    type         : Association to EquipmentTypes;
    location     : Association to locations;
    manufacturer : String;
    status       : Association to EquipmentStatus;
    task         : Composition of many Tasks
                       on task.equipment = $self;
    issues       : Association to many Issues
                       on issues.equipment = $self;

}

entity Tasks : cuid, managed {
    description : String(500);
    dueDate     : Date;
    priority    : Association to TaskPriority;
    status      : Association to Equipments;
    equipment   : Association to Equipments;
    assignedTo  : Association to Employees;
}

entity Employees : cuid, managed {
    name     : String(100);
    username : String(50);
    email    : String(100);
    role     : Association to Roles;

}

entity Roles {
    key code : String(5);
        type : String(50);
}

entity TaskStatus {
    key code : String(10);
        name : String(100);
}

entity TaskPriority {
    key code : String(10);
        name : String(100);
}

entity Issues : cuid, managed {
    description : String(500);
    status      : Association to IssueStatus;
    equipment   : Association to Equipments;
    reportedBy  : Association to Employees;
}

entity IssueStatus {
    key code : String(10);
        name : String(100);
}

entity EquipmentTypes {
    key code : String(10);
        name : String(100);
}

entity locations {
    key code : String(10);
        name : String(100);
}

entity EquipmentStatus {
    key code : String(10);
        name : String(100);
}
