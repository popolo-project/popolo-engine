class Cat
  include Mongoid::Document

  include Popolo::Sluggable
  index({slug: 1}, unique: true)
end
