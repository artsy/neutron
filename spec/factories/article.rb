FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Number #{n} Best Article" }
  end
end
