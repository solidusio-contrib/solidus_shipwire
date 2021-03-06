# frozen_string_literal: true

require 'spec_helper'

describe SolidusShipwire::ReturnAuthorizationSerializer do
  describe "#as_json" do
    subject { described_class.new(return_authorization).as_json(include: '**') }

    let(:variant)              { create(:variant, shipwire_id: 7_654_321) }
    let(:order)                { create(:shipped_order, line_items_attributes: [variant: variant, quantity: 1]) }
    let(:return_authorization) { create(:return_authorization, order: order) }
    let(:shipment)             { order.shipments.first }
    let(:shipwire_id)          { 1_234_567 }

    before do
      return_authorization.inventory_units << order.inventory_units
      shipment.update(shipwire_id: shipwire_id)
    end

    it "is formatted as shipwire json" do
      expect(subject).to include(
        originalOrder: {
          id: shipwire_id
        },
        items: [
          sku: variant.sku,
          quantity: 1
        ],
        options: {
          generatePrepaidLabel: 0,
          emailCustomer: 0,
        }
      )
    end
  end
end
