# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  factory :area, class: Popolo::Area do
    name 'Foo'
  end

  factory :event, class: Popolo::Event do
    # @todo
  end

  factory :membership, class: Popolo::Membership do
    person
    organization
  end

  factory :organization, class: Popolo::Organization do
    name 'ABC, Inc.'
  end

  factory :organizational_unit, class: Popolo::OrganizationalUnit do
    name 'Marketing'
  end

  factory :person, class: Popolo::Person do
    name 'John Q. Public'
  end
end
