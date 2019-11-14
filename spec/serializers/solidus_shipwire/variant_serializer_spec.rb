# frozen_string_literal: true

require 'spec_helper'

describe SolidusShipwire::VariantSerializer do
  describe "#as_json" do
    subject { described_class.new(variant).as_json(include: '**') }

    let!(:variant) { create(:variant) }

    it "is formatted as shipwire json" do
      expect(subject).to include(
        sku: variant.sku,
        classification: "baseProduct",
        description: variant.name,
        countryOfOrigin: "US",
        category: "FURNITURE_&_APPLIANCES",
        batteryConfiguration: 'NOBATTERY',
        values: {
          costValue: variant.price,
          retailValue: variant.price,
          costCurrency: "USD",
          retailCurrency: "USD"
        },
        dimensions: {
          length: 1,
          width: 10,
          height: 1,
          weight: 1
        }
      )
    end
  end
end
