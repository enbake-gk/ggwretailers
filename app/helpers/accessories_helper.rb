module AccessoriesHelper
	
	def models_list(accessory)
	  models = ""
	  accessory.models.each do |i| 
        models = models + i.name + " "
      end
      models
	end
	
end
