# coding: utf-8
require "csv"

CSV.foreach('/home/koki/rails/studio/db/seeds/development/Material_kinds.csv') do |row|
  MaterialKind.create(
    :name => row[0]
  )
end
