# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  factory :area, class: Popolo::Area do
    name 'Foo'
  end

  factory :membership, class: Popolo::Membership do
    person
    organization
  end

  factory :organization, class: Popolo::Organization do
    name 'ABC, Inc.'
  end

  factory :person, class: Popolo::Person do
    name 'John Q. Public'
  end

  factory :post, class: Popolo::Post do
    name 'Marketing Director'
    role 'Director'
    person
    organization
  end
end
