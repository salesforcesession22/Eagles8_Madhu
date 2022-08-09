({    
    onInit : function(component, event, helper) {        
        var action = component.get("c.getPickListValuesStage");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var list = response.getReturnValue();
                component.set("v.stagePicklistValue", list);
            }           
        })
        $A.enqueueAction(action);
    },
    SubmitOpp : function(component, event, helper) {
		var action = component.get("c.createOppRecord");
        var oppObjectRef = component.get("v.oppObj");
        
        action.setParams({OppTest : oppObjectRef});        
        action.setCallback(this, function(resp){
           var state = resp.getState();
            if(state === 'SUCCESS'){
                alert("Record Created Successfully");
            }
        });
        $A.enqueueAction(action);
	}
})