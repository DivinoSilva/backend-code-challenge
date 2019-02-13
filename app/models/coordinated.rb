class Coordinated < ApplicationRecord
  class InvalidDistance < StandardError; end

  before_save :valide_distance
  validates_presence_of :origin, :destination, :distance
  validates :origin, :destination, uniqueness: { case_sensitive: false }

  private

  def valide_distance
    raise InvalidDistance.new if distance <= 0 || distance >=100_000
  end
end
