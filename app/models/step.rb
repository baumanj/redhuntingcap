class Step < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :owner
end
