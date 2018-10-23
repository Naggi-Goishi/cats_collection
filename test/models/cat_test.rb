# == Schema Information
#
# Table name: cats
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  age        :integer
#  text       :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
