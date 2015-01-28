require 'faker'

class Seed
  def self.post_seed
    50.times do
      post = Post.create(
        title: Faker::Company.catch_phrase,
        description: Faker::Lorem.paragraph,
        name: Faker::Name.name,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        category_id: (rand(1..8)).to_s
        )
    end
  end

  def self.category_seed
    category_list = ["travel", "books", "clothing", "women", "men", "cats", "horses", "yoyo"]
    category_list.each do |category|
      Category.create(name: category)
    puts category
    end
  end
end

Seed.post_seed
# Seed.category_seed