module DateHandler
  extend ActiveSupport::Concern

  module InstanceMethods
    def validate_date_for(date_attribute)
      date = self.read_attribute(date_attribute)
      unless date.nil?
        if (/(\d{1,2}[-\/]\d{1,2}[-\/]\d{4})|(\d{4}[-\/]\d{1,2}[-\/]\d{1,2})/ =~ date).blank?
          errors.add(date_attribute, "format is invalid")
          self.send("#{date_attribute}=", nil)
        end
      end
    end
  end

end