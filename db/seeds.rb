# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'fernandovj.dev@gmail.com', 
          password: "habbito332yt", 
          password_confirmation: "habbito332yt", 
          role: 1)


5.times do |n|
  post = Property.create(name: "Propiedad Ejemplo #{n+1}", 
                direction: "Dirección Propiedad #{n+1}, Colima, colima.",
                price: 3999,
                square_meter: ("270#{n}").to_i,
                beds: (n+1),
                bathrooms: (n+1),
                property_type: (n %  2 == 0) ? "casa" : "departamento",
                sale_or_rent: (n %  2 == 0) ? "venta" : "renta"
              )
  post.images.attach(io: File.open(Rails.root.join("db/images/img-#{n+1}.webp")), filename: "img-#{n+1}.webp")
  post.save
end