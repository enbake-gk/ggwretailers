class Job < ActiveRecord::Base
 TIME_SPENT = ["1/2 hr", "1 hr","1 1/2 hr", "2 hr","2 1/2 hr", "3 hr","3 1/2 hr", "4 hr","4 1/2 hr", "5 hr","5 1/2 hr", "6 hr","6 1/2 hr", "7 hr","7 1/2 hr", "8 hr","8 1/2 hr", "9 hr","9 1/2 hr", "10 hr","10 1/2 hr", "11 hr","11 1/2 hr", "12 hr","more then 12hrs"]
scope :recent, -> { order('created_at desc')  }

 def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end 
 
  # def self.to_csv
  #   CSV.generate do |csv|
  #     csv << column_names
  #     all.each do |product|
  #       csv << product.attributes.values_at(*column_names)
  #     end
  #   end
  # end

end
