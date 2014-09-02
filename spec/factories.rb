# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do

  sequence(:name) { |n| "ABC#{n} Org." }

  factory :membership, class: Popolo::Membership do
    organization
    person
    post
  end

  factory :organization, class: Popolo::Organization do
    name
  end

  factory :person, class: Popolo::Person do
    name 'John Q. Public'
  end

  factory :post, class: Popolo::Post do
    label 'Marketing Director'
    organization
  end
end
