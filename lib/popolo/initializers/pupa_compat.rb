# @see https://github.com/mongoid/mongoid/blob/master/lib/mongoid/factory.rb#L39
module Mongoid
  module Factory
    old_from_db = instance_method(:from_db)

    define_method(:from_db) do |klass, attributes=nil, criteria_instance_id=nil|
      attributes.delete('_type') if attributes && klass.name.deconstantize == 'Popolo'
      old_from_db.bind(self).call(klass, attributes, criteria_instance_id)
    end
  end
end
