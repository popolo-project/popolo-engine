shared_examples_for 'a model with a date attribute' do |attribute|
  it {
    should validate_format_of(attribute).
      # 4.1.2.2 Basic format
      not_to_allow('20041231').
      # 4.1.2.2 Extended format
      to_allow('2004-12-31').
      # 4.1.2.3 a) A specific month
      to_allow('2004-01').
      # 4.1.2.3 b) A specific year
      to_allow('2004').
      # 4.1.2.3 c) A specific century
      not_to_allow('20').
      # Avoid confusion with YYMMDD
      not_to_allow('200401').
      # Date and time of day.
      not_to_allow('2004-12-31T00:00:00Z')
  }
end
