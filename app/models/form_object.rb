# == Schema Information
#
# Table name: form_objects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FormObject < ActiveRecord::Base
  belongs_to :form
  attr_accessible :title, :form_type, :form_id, :validations

end
