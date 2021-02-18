# frozen_string_literal: true

require 'spec_helper'

describe SolidusShipwire::AddressSerializer do
  describe "#as_json" do
    subject { described_class.new(address).as_json(include: '**') }

    let!(:address) { create(:address) }
    let(:expected_name) do
      SolidusSupport.combined_first_and_last_name_in_address? ? address.name : address.full_name
    end

    it "is formatted as shipwire json" do
      expect(subject).to include(
        name: expected_name,
        company: address.company,
        address1: address.address1,
        address2: address.address2,
        city: address.city,
        state: address.state_name,
        postalCode: address.zipcode,
        country: address.country.iso,
        phone: address.phone
      )
    end
  end
end
