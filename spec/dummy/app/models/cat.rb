class Cat
  include Mongoid::Document

  include Popolo::Sluggable
  include Popolo::Eventable
end
