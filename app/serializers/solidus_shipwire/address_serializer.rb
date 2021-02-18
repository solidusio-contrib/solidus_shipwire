# frozen_string_literal: true

module SolidusShipwire
  class AddressSerializer < ActiveModel::Serializer
    attributes :company, :address1, :address2, :city, :phone

    attribute :state_name, key: :state
    attribute :zipcode,    key: :postalCode

    attribute(:name)    { SolidusSupport.combined_first_and_last_name_in_address? ? object.name : object.full_name }
    attribute(:country) { object.country.iso }
  end
end
