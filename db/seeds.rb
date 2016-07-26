# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.destroy_all
#.....
User.create(:email => "admin@lumlabeauty.com", :password => "aA456321@", :password_confirmation => "aA456321@", first_name: "Supper", last_name: "Admin", phone: "0126 216 9420", address_1: "188 Street 1, Ward 16, Go Vap Dist,", is_admin: true, user_group_id: 3)
#.....

UserGroup.create(name: "Thành viên")
UserGroup.create(name: "Quản trị viên")
UserGroup.create(name: "Quản lý cấp cao")