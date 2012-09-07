FactoryGirl.define do
  factory :venue do
    name "Ponderosa"
    tips { [ association(:tip) ] }
  end

  factory :tip do
    text "fun times"
  end
end
