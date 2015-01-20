# coding: utf-8
Member.create(
  name: "admin",
  tel: "01234567890",
  email: "admin",
  password: "pass",
  password_confirmation: "pass",
  admin: true
)
1.upto(20) do |idx|
  user = "user"+idx.to_s
  Member.create(
    name: user,
    tel: "01234567890",
    email: user+"@example.com",
    password: "pass",
    password_confirmation: "pass"
  )
end

Member.create(
  name: "hoge",
  tel: "01234567890",
  email: "hoge",
  password: "pass",
  password_confirmation: "pass",
  suspend: true
)
