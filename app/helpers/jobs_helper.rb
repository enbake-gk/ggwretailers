module JobsHelper
	def part_used(job)
	  temp = []
	  job.service_parts.each do |service_part|
	  	temp << service_part.part.name 
	  end
	  temp.join(",")
	end
end
