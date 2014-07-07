class Company < ActiveRecord::Base

  belongs_to :admin_user

  # validates :admin_user_id, :presence => true

  # before_create :update_association
  #
  # def update_association
  #   user = self.initiator
  #   puts "===================="
  #   puts user.inspect
  #   puts user
  #   a=AdminUser.where(:name => user)
  #   puts a.inspect
  # end

end
