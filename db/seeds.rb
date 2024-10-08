# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Guest.create(name: "John Doe", email: "john@example.com")
Guest.create(name: "Jane Smith", email: "jane@example.com")
Guest.create(name: "Gideon Grey", email: "gideon@example.com")
Guest.create(name: "Paula Jones", email: "paula@example.com")


Admin.create(email: "bride@example.com", password: "password", role: "bride")
Admin.create(email: "groom@example.com", password: "password", role: "groom")
Admin.create(email: "planner@example.com", password: "password", role: "planner")
