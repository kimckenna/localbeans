class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :stockist, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }, format: {with: /\A\w+\z/, message: 'Name can only include alphanumeric characters'}
  accepts_nested_attributes_for :stockist

  def full_name
    "#{first_name.downcase.gsub(/[a-z']+/,&:capitalize)} #{last_name.downcase.gsub(/[a-z']+/,&:capitalize)}"
  end
end
