FactoryBot.define do
  factory :admin_brand, class: Admin::Brand do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(word_count: 20).chomp }
  end
end
