class Technician < ApplicationRecord
  has_many :created_tickets, class_name: 'Ticket'
  has_many :assigned_tickets, class_name: 'Ticket'
  has_many :resolved_tickets, class_name: 'Ticket'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
