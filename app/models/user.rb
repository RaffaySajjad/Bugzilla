class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: { Manager: 0, Developer: 1, Quality_Assurance: 2 }

  has_many :projects, inverse_of: :manager
  #has_many :bugs, inverse_of: :assignee

  def manager?
    user_type == 'Manager'
  end

  def developer?
    user_type == 'Developer'
  end

  def quality_assurance?
    user_type == 'Quality_Assurance'
  end
end
