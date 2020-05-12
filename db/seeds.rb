# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tweet.delete_all
NUM_Tweet = 20
NUM_Tweet.times do
    created_at = Faker::Date.backward(days: 365 * 5)
    q = Tweet.create(
        title: Faker::Hacker.say_something_smart,
        tweet: Faker::ChuckNorris.fact,
        # user: users.sample, # array method that randomly picks something from an array
        created_at: created_at,
        updated_at: created_at
    )
end
tweet = Tweet.all
puts Cowsay.say("Generated #{tweet.count} tweets", :frogs)