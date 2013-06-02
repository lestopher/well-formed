# == Schema Information
#
# Table name: forms
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  form_type  :string(255)
#  form_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Form < ActiveRecord::Base
  has_many :form_objects
  accepts_nested_attributes_for :form_objects, :allow_destroy => true

  attr_accessible :title
end
