# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.create(email: "gwretailers@enbake.com", password: "gwretailers", reset_password_token: nil,:role_id=>'1', reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2014-06-24 07:16:53", last_sign_in_at: "2014-06-24 07:07:32", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil)
User.create(email: "bryan@gomotorised.co.nz", password: "gwretailers",contact_person: "GoMotorised",phone_number: "094150012",last_name: "Henry",first_name: "Bryan", reset_password_token: nil,:role_id=>'2', reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2014-06-24 07:16:53", last_sign_in_at: "2014-06-24 07:07:32", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil)
#RetailerGroup.create(name: "GoMotorised")