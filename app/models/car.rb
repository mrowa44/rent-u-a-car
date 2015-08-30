class Car < ActiveRecord::Base
  has_many :rentals, dependent: :destroy

  validates :name, presence: true
  validates :kind, inclusion: { in: ["A", "B", "C"],  message: 'has to be one of A, B, C' }
end
