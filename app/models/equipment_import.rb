class EquipmentImport
  # switch to ActiveModel::Model in Rails 4
  # extend ActiveModel::Model::Naming
  # include ActiveModel::Model::Conversion
  # include ActiveModel::Model::Validations
  include ActiveModel::Model
  attr_accessor :file
  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_products.map(&:valid?).all?
      imported_products.each(&:save!)
    true
    else
      imported_products.each_with_index do |product, index|
        product.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
    false
    end
  end

  def imported_products
    @imported_products ||= load_imported_products
  end

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv"  then Roo::Csv.new(file.path)
    when ".xls"  then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    when ".ods"  then Roo::OpenOffice.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_products
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row=spreadsheet.row(i)
      row[1] = Brand.find_or_create_by(:name=>spreadsheet.row(i)[1].to_s).id # Replace brand name with brand_id
      row[2] = Model.find_or_create_by(:brand_id=>row[1],:name=>spreadsheet.row(i)[2].to_s).id # Replace model name with model_id
      row = Hash[[header, row].transpose]
      product = Equipment.find_by_serial_number((row["serial_number"]).to_s) || Equipment.new
      product.attributes = row.to_hash
      product 
    end
  end

  
end
