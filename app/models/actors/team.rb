class Team < ActiveRecord::Base

  has_many :users

  before_create :generate_program_starts_at
	
  def generate_program_starts_at
  	self.program_starts_at = Date.today.beginning_of_week
  end


=begin
1) Teams have many users
2) Teams require a pathway_starts_at datetime greater than its creation time
3) The program_starts_at used when creating the model must be converted into the beginning of the week, i.e input_value.beginning_of_week
=end

end