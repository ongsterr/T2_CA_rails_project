class Profile < ApplicationRecord
  belongs_to :user

  include ImageUploader[:profile_image]
  include ImageUploader[:passport_image] 
  include ImageUploader[:drivers_license_image] # part of Shrine setup

  def location
      "#{addr_city}, #{addr_state}, #{addr_country_name}"
  end

  def spoken_language
      l1 = language_1
      l2 = language_2.nil? ? "" : ", #{language_2}"
      l3 = language_3.nil? ? "" : ", #{language_3}"
      return l1 + l2 + l3
  end

  def addr_country_name
      # This is converting country_code to country name using the country_select gem
      # This will attempt to translate the country name and use the default (usually English) name if no translation is available
      country = ISO3166::Country[addr_country_code]
      country.translations[I18n.locale.to_s] || country.name
  end

  def passport_country_name
      # This is converting country_code to country name using the country_select gem
      # This will attempt to translate the country name and use the default (usually English) name if no translation is available
      country = ISO3166::Country[passport_country_code]
      country.translations[I18n.locale.to_s] || country.name
  end

end
