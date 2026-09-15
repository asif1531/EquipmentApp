using from '../../srv/AdminService';
using from '../../db/data-model';

annotate AdminEquipmentService.Equipments with @(
    UI.HeaderInfo : {
        TypeNamePlural : 'Equipment',
        TypeName : '',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    },
    UI.SelectionFields : [
        status_code,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : manufacturer,
        },
        {
            $Type : 'UI.DataField',
            Value : status.name,
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : location.name,
        },
        {
            $Type : 'UI.DataField',
            Value : type.name,
            Label : '{i18n>EquipmentType}',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipment Details',
            ID : 'EquipmentDetails',
            Target : '@UI.FieldGroup#EquipmentDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Task Assigned to Employee',
            ID : 'TaskAssignedtoEmployee',
            Target : 'task/@UI.LineItem#TaskAssignedtoEmployee',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Reported Issues',
            ID : 'ReportedIssues',
            Target : 'issues/@UI.LineItem#ReportedIssues',
        },
    ],
    UI.FieldGroup #EquipmentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : manufacturer,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : location.name,
            },
            {
                $Type : 'UI.DataField',
                Value : type.name,
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
            },
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Details',
            ID : 'Details',
            Target : '@UI.FieldGroup#Details',
        },
    ],
    UI.FieldGroup #Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : manufacturer,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
        ],
    },
);

annotate AdminEquipmentService.Equipments with {
    status @(
        Common.Label : '{i18n>EquipmentStatus}',
        Common.Text : status.name,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate AdminEquipmentService.Tasks with @(
    UI.LineItem #TaskAssignedtoEmployee : [
        {
            $Type : 'UI.DataField',
            Value : equipment.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : equipment_ID,
            Label : '{i18n>EquipmentId}',
        },
        {
            $Type : 'UI.DataField',
            Value : dueDate,
            Label : '{i18n>Duedate}',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : '{i18n>Description}',
        },
        {
            $Type : 'UI.DataField',
            Value : assignedTo_ID,
            Label : '{i18n>AssignedTo}',
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'Priority',
        },
        {
            $Type : 'UI.DataField',
            Value : equipment.status.code,
            Label : '{i18n>EquipmentStatus}',
        },
    ]
);

annotate AdminEquipmentService.Issues with @(
    UI.LineItem #ReportedIssues : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : equipment_ID,
            Label : 'Equipment ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : reportedBy_ID,
            Label : 'Reported By',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ]
);

annotate AdminEquipmentService.Tasks with {
    assignedTo @Common.ExternalID : assignedTo.name
};

annotate AdminEquipmentService.EquipmentStatus with {
    name @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

annotate AdminEquipmentService.EquipmentStatus with {
    code @Common.Text : name
};

