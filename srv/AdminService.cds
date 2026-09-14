using { equipement.com.app as AdminModel } from '../db/data-model';

service AdminEquipmentService {

    entity Equipments      as projection on AdminModel.Equipments;
    entity Tasks           as projection on AdminModel.Tasks; // <-- Added Tasks
    entity Issues          as projection on AdminModel.Issues;
    entity Employees       as projection on AdminModel.Employees;
    
    // Master Data / Status Entities
    entity IssueStatus     as projection on AdminModel.IssueStatus;
    entity TaskStatus      as projection on AdminModel.TaskStatus;
    entity TaskPriority    as projection on AdminModel.TaskPriority;
    entity EquipmentTypes  as projection on AdminModel.EquipmentTypes;
    entity Locations       as projection on AdminModel.Locations; // <-- Capitalized to match best practice
    entity EquipmentStatus as projection on AdminModel.EquipmentStatus; // <-- Fixed typo
    entity Roles           as projection on AdminModel.Roles;

}