class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

	has_one_attached :avatar
	has_many :reservations

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
	validates :introduction, presence: false
	validates :avatart, presence: false
	has_many :reservations, dependent: :destroy

end
