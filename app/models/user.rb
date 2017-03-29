class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  validates :user_name, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 4, maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
