# frozen_string_literal: true

require 'solidus_shipwire/testing_support/factories'
require 'spree/testing_support/shipwire_factory'

RSpec.configure do |config|
  config.include ShipwireFactory
end
