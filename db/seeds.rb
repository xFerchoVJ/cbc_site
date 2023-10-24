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


image_filenames = ["img-1.webp", "img-2.webp", "img-3.webp", "img-4.webp", "img-5.webp"]

17.times do |n|
  property = Property.create(name: "Propiedad Ejemplo #{n+1}", 
                direction: "Dirección Propiedad #{n+1}, Colima, colima.",
                price: 3999,
                square_meter: ("270#{n}").to_i,
                beds: (n+1),
                bathrooms: (n+1),
                property_type: (n % 4),
                sale_or_rent: (n %  2 == 0) ? "venta" : "renta"
              )

  # Adjunta al menos 4 imágenes a cada propiedad
  image_filenames.sample(4).each do |filename|
    file_path = Rails.root.join("db/images", filename)
    property.images.attach(io: File.open(file_path), filename: filename)
  end

  property.save
end