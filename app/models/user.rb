# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :instructor

  has_many :questions

  validates :email, presence: true, uniqueness: true

  enum status: {
    'Registrado': 0,
    'Ativo': 1,
    'Suspenso': 2,
    'Deletado': 3
  }

end
