module ApplicationHelper
	def remain_warrenty(key)
		equipment = Equipment.find_by_serial_number(key)
		warranty_month = equipment.model.warranty.to_i
		date1 = equipment.purchase_date
		date2 = Date.today
		result = ""
		selling_time = (date2.year*12 + date2.month)-(date1.year*12 + date1.month)
		if selling_time > warranty_month
			result = "No"
		else
			result = "Yes"
		end
		result
	end
end
