class Client < ActiveRecord::Base
def self.import(file)
    counter = 0
    CSV.foreach(file.path) do |row|
      if counter > 0
        # split on ; or ,
        row = row[0].split(';')
        id, first_name, last_name, email, country, profile_text, gender, phone, sales_manager, sales_manager_email = row || ''
        
        client = Client.create(id: id, first_name: first_name, last_name: last_name,
          email: email, country: country, profile_text: profile_text,
          gender: gender, phone: phone, sales_manager: sales_manager, sales_manager_email: sales_manager_email)
        puts client.errors.full_messages.join(".") if client.errors.any?
        
      end
      counter += 1
    end
  end
end
