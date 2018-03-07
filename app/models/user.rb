class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  has_many :permissions
  has_many :roles, through: :permissions
  belongs_to :gender
  has_many :articles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :mobile, :gender_id, :dob
  validates_numericality_of :mobile
  validates_length_of :mobile, is: 10

  after_create :assign_user_role

  def assign_user_role
    Permission.create(user_id:self.id, role_id:Role.last.id)
  end

  def role?(role)
    self.roles.pluck(:name).include?(role)
  end
end
