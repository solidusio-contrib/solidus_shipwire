# frozen_string_literal: true

module SolidusShipwire
  module InventoryUnitDecorator
    def self.prepended(base)
      base.scope :eligible_for_shipwire, -> { joins(:variant).where.not(spree_variants: { shipwire_id: nil }) }
    end

    ::Spree::InventoryUnit.prepend self
  end
end
