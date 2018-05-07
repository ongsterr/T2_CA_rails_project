# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Below seeded data for testing
admin_user = {
    email: ENV.fetch('ADMIN_EMAIL'),
    password: ENV.fetch('ADMIN_PASSWORD')
}

uploader = ImageUploader.new(:store)
file_1 = File.new(Rails.root.join('app/assets/images/profile_image.jpg'))
uploaded_file_1 = uploader.upload(file_1)

file_2 = File.new(Rails.root.join('app/assets/images/pitch.png'))
uploaded_file_2 = uploader.upload(file_2)

file_3 = File.new(Rails.root.join('app/assets/images/T2_logo.png'))
uploaded_file_3 = uploader.upload(file_3)

admin_profile = {
    user_id: "1",
    first_name: "Christopher",
    last_name: "Ong",
    date_of_birth: "10/01/1990",
    mobile_phone: "0422678500",
    about_me: "I love travelling!",
    language_1: "English",
    language_2: "Chinese",
    language_3: "Malay",
    profile_image_data: uploaded_file_1.to_json,
    addr_unit_number: "1",
    addr_street_number: "888",
    addr_street_name: "Collins Street",
    addr_city: "Docklands",
    addr_state: "Victoria",
    addr_postcode: "3008",
    addr_country_code: "AU",
    passport_number: "A123456",
    passport_expiry_date: "12/12/2022",
    passport_country_code: "AU",
    passport_image_data: uploaded_file_2.to_json,
    drivers_license_number: "A123456",
    drivers_license_expiry_date: "12/12/2022",
    drivers_license_country_code: "AU",
    drivers_license_image_data: uploaded_file_3.to_json,
    verified?: 0
}

User.create!(admin_user) {p "Admin user created"}
Profile.create!(admin_profile) {p "Admin profile created"}