# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  factory :membership, class: Popolo::Membership do
    organization
    person
    post
  end

  factory :organization, class: Popolo::Organization do
    name 'ABC, Inc.'
  end

  factory :person, class: Popolo::Person do
    name 'John Q. Public'
  end

  factory :post, class: Popolo::Post do
    label 'Marketing Director'
    organization
  end
end
