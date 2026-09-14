using from '../../srv/AdminService';
using from '../../db/data-model';
// using AdminEquipmentService as service from '../../srv/AdminService';

// annotate service.Equipments @(UI.LineItem: [
//     {
//         $Type: 'UI.DataField',
//         Value: ID,
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: name
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: type.name
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: manufacturer
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: location.name
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: status.name,
//         Label : '{i18n>Equipmentstatus}',
//         Criticality : status.criticality,
//         CriticalityRepresentation : #WithIcon,
//     }
// ],
//     UI.SelectionFields : [
//         manufacturer,
//         status_code
//     ],)
annotate AdminEquipmentService.Equipments with @(
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

annotate AdminEquipmentService.EquipmentStatus with {
    code @(
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

