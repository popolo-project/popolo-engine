# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  factory :area, class: Popolo::Area do
    name 'Foo'
  end

  factory :event, class: Popolo::Event do
    source 'example.org'
    url 'http://example.org/news/123.html'
    body 'Lorem ipsum dolor sit amet'
    issued_at 1.day.ago
  end

  factory :post, class: Popolo::Post do
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
