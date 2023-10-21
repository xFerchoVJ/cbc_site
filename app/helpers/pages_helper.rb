module PagesHelper

  def property_types(property_type = "")
    result = ""
    property_length = Property.where(property_type: property_type).length
    if property_length == 1
      result = "#{property_length} #{property_type.capitalize}"
    else
      result = "#{property_length} #{property_type.capitalize}s"
    end
    result
  end
end
