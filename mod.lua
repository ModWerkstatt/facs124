function data()
return {
	info = {
		minorVersion = 2,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "waggon", "schuettgut", "deutschland", "germany", "UIC", "gueterwagen", "db" },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

        params = {
			{
				key = "facs124_fake",
				name = _("Fake_facs124_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_facs124_desc"),
				defaultIndex = 0,
			},	
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["y_dr_fake.mdl"] = true, 
			["db_fake.mdl"] = true, 
			["dbag_fake.mdl"] = true, 
			["dr_fake.mdl"] = true, 
			["vr_fake.mdl"] = true, 
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/Eads-([^/]*.mdl)')
							or fileName:match('/Facs124_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["facs124_fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end

		addModifier( "loadModel", metadataHandler )
	end
	}
end
