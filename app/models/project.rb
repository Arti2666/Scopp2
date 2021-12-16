class Project < ApplicationRecord
  belongs_to :user
  has_many :matches, dependent: :destroy
  has_many :participants, through: :matches, source: :user #jointure

  validates :title, presence: true
  validates :description, presence: true
  validates :tag1, presence: true
end
