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

file_4 = File.new(Rails.root.join('app/assets/images/jazz.jpg'))
uploaded_file_4 = uploader.upload(file_4)

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

test_product = {
    transporter_id: "1",
    price_per_day: 20000,
    vehicle_model: "Honda Jazz",
    vehicle_capacity: 5,
    vehicle_description: "Super spacious and comfortable!",
    vehicle_image_data: uploaded_file_4.to_json,
    cancellation_policy: "Full refund only if cancellation is 45 days before trip.",
    things_to_note: "Just be ready to have fun!",
    location_id: "1"
}

test_booking = {
    product_id: "1",
    transporter_id: "1",
    traveler_id: "1",
    booking_ref_number: "ABC123",
    booking_date_from: "15/06/2018",
    booking_date_to: "18/06/2018",
    number_of_traveler: 4,
    transporter_cost: 20000,
    platform_cost: 4000,
    total_cost: 24000,
    booking_confirmed?: true
}

location = [
    {
        location: "Melbourne",
        country: "Australia",
        continent: "Asia Pacific"
    },
    {
        location: "Perth",
        country: "Australia",
        continent: "Asia Pacific"
    },
    {
        location: "Brisbane",
        country: "Australia",
        continent: "Asia Pacific"
    },
    {
        location: "Sydney",
        country: "Australia",
        continent: "Asia Pacific"
    },
    {
        location: "Auckland",
        country: "New Zealand",
        continent: "Asia Pacific"
    },
    {
        location: "Wellington",
        country: "New Zealand",
        continent: "Asia Pacific"
    },
    {
        location: "Christchurch",
        country: "New Zealand",
        continent: "Asia Pacific"
    }
]

test_review = {
    booking_id: "1",
    reviewer_id: "1",
    reviewed_id: "2",
    review: "Chris has been super good!",
    rating: 4
}

User.create!(admin_user) {p "Admin user created"}
Profile.create!(admin_profile) {p "Admin profile created"}
Location.create!(location) {p "Product location seeded"}
Product.create!(test_product) {p "Product created"}
Booking.create!(test_booking) {p "Booking completed"}
Review.create!(test_review) {p "Test review created"}