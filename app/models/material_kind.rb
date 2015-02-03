class MaterialKind < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :materials
end
