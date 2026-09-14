sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/fiori/app/equipmentmanageadmin/test/integration/pages/EquipmentsList.gen",
	"com/fiori/app/equipmentmanageadmin/test/integration/pages/EquipmentsObjectPage.gen"
], function (JourneyRunner, EquipmentsListGenerated, EquipmentsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/fiori/app/equipmentmanageadmin') + '/test/flp.html#app-preview',
        pages: {
			onTheEquipmentsListGenerated: EquipmentsListGenerated,
			onTheEquipmentsObjectPageGenerated: EquipmentsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

