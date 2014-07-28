module ApplicationHelper
	def remain_warrenty(equipment)
		warranty_month = equipment.model.warranty.to_i
		date1 = equipment.purchase_date
		date2 = Date.today

		selling_time = (date2.year*12 + date2.month)-(date1.year*12 + date1.month)
		
		selling_time > warranty_month ? warranty_month_remains = nil : warranty_month_remains = warranty_month - selling_time
			
		
		warranty_month_remains
	end
end
