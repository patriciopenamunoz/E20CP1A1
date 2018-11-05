# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all

10.times do |i|
  u = User.new(email:"email#{i}@gmail.com", name:"nombre #{i}", password:'123456', password_confirmation:'123456')
  u.save
  p = Post.new(title: "post #{i}", content: "contenido #{i}", user: u)
  p.save
  10.times do |e|
    c = p.comments.build(content: "Comentario #{e} del post #{i}", user: u, post: p)
    c.save
  end
end
