class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  scope :recent, -> {order('created_at DESC')}
  has_many :follows
  has_many :guests,through: :follows
  def add_a_role(role)
    self.add_role role
  end
  def remove_a_role(role)
    self.remove_role role
  end
end
