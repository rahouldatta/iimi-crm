class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # validates :committee, inclusion: {in: ["PlaceCom", "CulCom", "AcadCom", "AlumCom"]}
  # has_many :companies

end
