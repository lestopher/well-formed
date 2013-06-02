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

require 'spec_helper'

describe Form do
  pending "add some examples to (or delete) #{__FILE__}"
end
