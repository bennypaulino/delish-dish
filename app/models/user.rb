class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  validates :user_name, presence: true, uniqueness: {case_sensitive: false}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
