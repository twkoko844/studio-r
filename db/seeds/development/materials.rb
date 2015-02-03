# coding: utf-8
require "csv"
p "Creating MaterialKinds..."
CSV.foreach('/home/koki/rails/studio/db/seeds/development/Material_kinds.csv') do |row|
  MaterialKind.create(
    :name => row[0]
  )
end

CSV.foreach('/home/koki/rails/studio/db/seeds/development/Materials_20150118.csv') do |row|
  Material.create(:kind => MaterialKind.find(row[0]), :name => row[1])
end

m = Material.find(2)
m.suspend = true
m.save!
