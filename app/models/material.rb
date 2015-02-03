class Material < ActiveRecord::Base
 #attr_accessible :material_kind
  belongs_to :kind, class_name: "MaterialKind", foreign_key: "material_kind_id"
  has_many :bookedmaterials, dependent: :destroy
  has_many :bookings, through: :bookedmaterials, source: :booking
  acts_as_paranoid
end
