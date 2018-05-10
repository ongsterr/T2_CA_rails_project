class Location < ApplicationRecord
    has_many :products

    def self.search_by_name(search)
        where("LOWER(location) ILIKE ?", "%#{search.downcase}%")
    end
end
