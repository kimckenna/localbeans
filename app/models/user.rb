class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :stockist
  validates :first_name, :last_name, presence: true, format: {with: /\A\w+\z/, message: 'Name can only include alphanumeric characters'}
end
