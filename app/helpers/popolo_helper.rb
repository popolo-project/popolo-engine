module PopoloHelper
  # @note inherited_resources sets incorrect arguments for glob routes.
  # @see https://github.com/josevalim/inherited_resources/blob/master/lib/inherited_resources/url_helpers.rb
  def nested_resources_path(*args)
    send("nested_#{resource_collection_name}_path", *args)
  end
  def nested_resource_path(*args)
    send("nested_#{resource_instance_name}_path", *args)
  end
end
