require 'rails_helper'

describe Coordinated do
  context 'validations' do
    it { is_expected.to validate_presence_of(:origin) }
    it { is_expected.to validate_presence_of(:destination) }
    it { is_expected.to validate_presence_of(:distance) }
  end
end
