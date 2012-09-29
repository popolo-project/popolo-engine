# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  factory :area, class: Popolo::Area do
    name 'Foo'
  end

  factory :party, class: Popolo::Party do
    name 'Foo'
  end

  factory :person, class: Popolo::Person do
    name 'Foo'
  end
end
