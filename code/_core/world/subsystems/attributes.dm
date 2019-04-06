var/global/list/experience/attribute/all_attributes = list()

/subsystem/attributes/
	name = "Attribute Subsystem"
	desc = "Stores all the known attributes in a list."
	priority = SS_ORDER_NORMAL

/subsystem/attributes/Initialize()
	for(var/A in subtypesof(/experience/attribute/))
		all_attributes += A