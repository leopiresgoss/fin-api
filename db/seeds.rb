# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Transaction.destroy_all
Client.destroy_all

client1 = Client.create name: 'Maria', taxnumber: '123456789', bank_id: '123456789'
client2 = Client.create name: 'João', taxnumber: '123456890', bank_id: '123456789'

Transaction.create description: 'Salary', client: client1, value: 600, created_at: Date.today - 2.years,
                   updated_at: Date.today - 2.years
Transaction.create description: 'Transfer to Lucas', client: client1, value: -550.10, created_at: Date.today - 2.years,
                   updated_at: Date.today - 2.years

Transaction.create description: 'Salary', client: client1, value: 1500.30, created_at: Date.today - 1.month,
                   updated_at: Date.today - 1.month
Transaction.create description: 'Laundry', client: client1, value: -50, created_at: Date.today - 20.days,
                   updated_at: Date.today - 20.days
Transaction.create description: 'Grocery', client: client1, value: -200.95, created_at: Date.today - 18.days,
                   updated_at: Date.today - 18.days
Transaction.create description: 'Cinema', client: client1, value: -5.99, created_at: Date.today - 18.days,
                   updated_at: Date.today - 18.days
Transaction.create description: 'McDonalds', client: client1, value: -15.25, created_at: Date.today - 18.days,
                   updated_at: Date.today - 18.days
Transaction.create description: 'Yellow Store', client: client1, value: -100.5, created_at: Date.today - 16.days,
                   updated_at: Date.today - 16.days
