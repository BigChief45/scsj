class User < ApplicationRecord
  rolify
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile_number, presence: true

  has_many :notifications, foreign_key: :recipient_id

  scope :admins, -> { User.with_role(:admin) }
  scope :judges, -> { User.with_role(:judge) }
  scope :lawyers, -> { User.with_role(:lawyer) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def trials
    Trial.where('judge_id = ? OR plaintiffs_lawyer_id = ?
      OR defendants_lawyer_id = ?', self.id, self.id, self.id)
  end
end
