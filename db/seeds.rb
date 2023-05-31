Role.create(name: :owner)
Role.create(name: :normal_user)
AdminUser.create!(email: 'shivani@gmail.com', password: 'Shibu2120', password_confirmation: 'Shibu2120') if Rails.env.development?