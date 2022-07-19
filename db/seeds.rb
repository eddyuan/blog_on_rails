# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

40.times do
    p = Post.new({
      title: Faker::Commerce.product_name,
      body: Faker::Hipster.sentence,
    })
    p.save
    if p.valid?
      rand(1..5).times do
        r = Comment.new(content: Faker::Hipster.sentence)
        r.post = p
        r.save
      end
    end
  end
  posts = Post.all
  comments = Comment.all
  p "created #{posts.count} posts,#{comments.count} comments"