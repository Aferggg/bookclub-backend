class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :shelves
    has_many :books, through: :shelves
    has_many :notes, through: :books
    has_many :friends
    has_many :group_members
    has_many :groups, through: :group_members
  end