# frozen_string_literal: true

require 'active_model_serializers'
require 'shipwire'
require 'solidus_core'
require 'solidus_backend'
require 'solidus_support'

require 'solidus_shipwire/version'
require 'solidus_shipwire/engine'
require 'solidus_shipwire/response_exception'
require 'solidus_shipwire/shipwireable'
require 'solidus_shipwire/shipwireable/shipwire_api'
require 'solidus_shipwire/shipwireable/shipwire_serializer'

ActiveSupport.on_load(:active_record) do
  extend SolidusShipwire::Shipwireable
end
