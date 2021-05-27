class Stockist < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
  has_many :listings, dependent: :destroy
  validates :business_name, :abn, presence: true, uniqueness: true
end
