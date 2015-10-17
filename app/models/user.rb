class User < ActiveRecord::Base
  # before_save { self.email = self.email.downcase }
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :position, presence: true
  # validates :telephone, presence: true, uniqueness: true, length: { is: 8}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
  # format: { with: VALID_EMAIL_REGEX },
  # uniqueness: { case_sensitive: false }
  # validates :os, presence: true
  # validates :communication, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    counter = 0
    CSV.foreach(file.path) do |row|
      if counter > 0
        row = row[0].split(';')
        id, first_name, last_name, email, country, profile_text, gender, sales_manager, sales_manager_email = row || ''
        p first_name
         user = User.create(id: id, first_name: first_name, last_name: last_name,
                  email: email, country: country, profile_text: profile_text,
                  gender: gender, sales_manager: sales_manager)
        puts user.errors.full_messages.join(".") if user.errors.any?
        
      end
      counter += 1

     
    end

  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
