import cds from '@sap/cds';

class AdminEquipmentService extends cds.ApplicationService {
    init() {
        const { Equipments } = this.entities;

        this.before('UPDATE', Equipments, (req) => {
            debugger;
            let statusUpdate = req.data.status_code;
            if(statusUpdate === 'BRK'){
                req.error(400,"You are not authorized to change the status")
            }
        });

        return super.init();
    }
}

export default AdminEquipmentService;