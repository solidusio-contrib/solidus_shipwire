# frozen_string_literal: true

describe SolidusShipwire::Shipwireable do
  context "when Shipwireable extends a class" do
    subject { dummy_class }

    let(:dummy_class) do
      Class.new do
        extend SolidusShipwire::Shipwireable
      end
    end

    let(:dummy_instance) { dummy_class.new }

    it { is_expected.to respond_to :acts_as_shipwireable }

    describe ".acts_as_shipwireable" do
      subject { dummy_class.acts_as_shipwireable(shipwireable_config) }

      let(:shipwireable_config) { { config: :value } }

      let(:dummy_class) do
        Class.new do
          extend SolidusShipwire::Shipwireable
        end
      end

      it "sets shipwireable_config class variable" do
        subject
        expect(dummy_class.shipwireable_config).to eq shipwireable_config
      end
    end
  end
end
