# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
time = "2014-05-16 18:15:12".to_time
User.create(admin: true, name: "admin", password: "123", password_confirmation: "123")
Device.create(id: 1, name: "First Device", address: "Fake mac address", notes: "Dummy", created_at: time, updated_at: "2014-05-16 18:20:18".to_time, building_id: 1, user_id: 1, encryption_key: "this")
Device.create(id: 2, name: "WF", address: "080028575A0E", notes: "Physical board", created_at: Time.now, updated_at: "2014-05-16 20:01:03".to_time, building_id: nil, user_id: 1, encryption_key: "theworstkeyever")

Building.create(id: 1, name: "First building", location: "Somewhere", start: time, :end => nil, user_id: 1)
Building.create(id: 2, name: "Second building", location: "Not sure", start: Time.now, :end => nil, user_id: 1)
DeviceBuilding.create(id: 1, location: "Somewhere in somewhere", building_id: 1, device_id: 2)

Page.create( title: "FAQ", long_title: "Frequently asked questions", content: "###This uses Github flavored markdown!\r\n1. Just edit this from by clicking 'edit'\r\n    (It only shows up if you're an admin)\r\n2. It is probably easiest to copy & paste into the content box\r\n\r\n* FAQ and Buy are the only pages that do anything, now.\r\n* But more could be added easily, or things could be changed so that *all* pages are viewable.\r\n\r\n<p>\r\n\t Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et pulvinar est, eget lobortis erat. Aliquam facilisis, sapien a tincidunt varius, tortor velit euismod metus, vel ultricies mi libero sit amet libero. Duis id mi lacus. Donec eget tellus luctus metus euismod consectetur. Pellentesque dictum aliquam leo, sed malesuada justo tincidunt ut. Etiam eget condimentum lectus, vitae ultrices neque. Curabitur ut quam a nisi vulputate sollicitudin vel eu arcu. Curabitur consequat aliquam ipsum eu venenatis. Morbi sed sem sollicitudin enim pulvinar lacinia. Fusce vehicula adipiscing molestie. Duis varius lectus id cursus tincidunt.\r\n</p>\r\n\r\n<p>\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Donec tincidunt diam et faucibus dapibus. Aliquam posuere augue sed lorem dapibus cursus. Nunc a mi leo. Phasellus ullamcorper gravida pellentesque. Aliquam id lacus non dui viverra convallis non ultrices ligula. Morbi nec tempor tellus. Nulla suscipit et velit vitae imperdiet.\r\n</p>\r\n\r\n<p>\r\nMauris eu ante ultricies, tincidunt felis eu, blandit orci. Proin euismod elit non turpis tristique facilisis. Vivamus tristique tristique nisl, eu porta eros porta fringilla. Cras condimentum pellentesque mattis. Aenean erat nisl, tempus et sodales non, fermentum sit amet dui. Aliquam ac diam sed quam egestas euismod. Duis faucibus suscipit tortor adipiscing tempus. Phasellus egestas enim convallis lacus tempus, a consequat massa sodales. Ut eu fermentum lectus. Morbi eu enim vel ligula dignissim porta. Phasellus posuere vel dolor vitae sollicitudin. Phasellus dapibus fringilla sagittis. Duis suscipit, nunc id iaculis dapibus, turpis mi iaculis magna, ac sollicitudin orci nunc vulputate nisi. Donec consequat tristique turpis, sit amet tempor dolor adipiscing at. \r\n\r\n</p>")
Page.create( title: "Buy", long_title: "Purchase sensors", content: "Purchase sensors here!\r\n\r\nEventually...")

