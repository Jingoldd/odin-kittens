class Kitten < ApplicationRecord
  validates :name, :age, :softness, :cuteness, presence: true
  validates :age, numericality: { only_integer: true }
end
