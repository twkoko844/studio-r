class Bookedmaterial < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :booking
  belongs_to :material
end
