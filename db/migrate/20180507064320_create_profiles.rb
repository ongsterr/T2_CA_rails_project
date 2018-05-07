class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :mobile_phone
      t.text :about_me
      t.string :language_1
      t.string :language_2
      t.string :language_3
      t.text :profile_image_data
      t.string :addr_unit_number
      t.string :addr_street_number
      t.string :addr_street_name
      t.string :addr_city
      t.string :addr_state
      t.string :addr_postcode
      t.string :addr_country_code
      t.string passport_number
      t.date :passport_expiry
      t.string :passport_country_code
      t.text :passport_image_data
      t.string :drivers_license_number
      t.date :drivers_license_expiry
      t.string :drivers_license_country_code
      t.text :drivers_license_image_data
      t.boolean :verified?

      t.timestamps
    end
  end
end
