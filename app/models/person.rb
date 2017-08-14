class Person < ApplicationRecord

  validates :name, presence: true
  validates :last_name, presence: true
  validates :id_number, presence: true, uniqueness: true
  validates :birth_date, presence: true

  def full_name
    "#{name} #{last_name}"
  end

end
