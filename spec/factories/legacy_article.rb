FactoryBot.define do
  factory :legacy_article do
    sequence(:positron_id) { |n| "asdf1234#{n}" }
  end
end
