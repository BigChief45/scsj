class User < ApplicationRecord
  scope :admins, -> { User.with_role(:admin) }
  scope :judges, -> { User.with_role(:judge) }
  scope :lawyers, -> { User.with_role(:lawyer) }

  has_many :notifications, foreign_key: :recipient_id

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile_number, presence: true

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader


  def full_name
    "#{first_name} #{last_name}"
  end

  def trials
    @trials ||= Trial.where('judge_id = ? OR plaintiffs_lawyer_id = ?
      OR defendants_lawyer_id = ?', self.id, self.id, self.id).includes(:judge)
  end
end
