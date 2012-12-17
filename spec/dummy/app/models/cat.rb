class Cat
  include Mongoid::Document

  include Popolo::Mixins::Sluggable
  include Popolo::Mixins::Eventable
end
