# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Maker.destroy_all

Maker.create!([{ name: 'bmw' },
               { name: 'toyota' },
               { name: 'renault' }])

p "Created #{Maker.count} makers"

Model.destroy_all

bmw = Maker.find_by(name: 'bmw')
toyota = Maker.find_by(name: 'toyota')

Model.create!([{ name: 'series 3', maker: bmw },
               { name: 'x1', maker: bmw },
               { name: 'yaris', maker: toyota },
               { name: 'rav4', maker: toyota },
               { name: 'supra', maker: toyota }])

p "Created #{Model.count} models"

Subscription.destroy_all

Subscription.create!([{ name: 'standard', price: 149.99 },
                      { name: 'sport',         price:  199.99 },
                      { name: 'sport +',       price:  249.99 },
                      { name: 'super sport +', price:  299.99 }])

p "Created #{Subscription.count} subscriptions"

Car.destroy_all

series_3 = Model.find_by(name: 'series 3')
x1 =  Model.find_by(name: 'x1')
yaris = Model.find_by(name: 'yaris')
rav4 =  Model.find_by(name: 'rav4')
supra =  Model.find_by(name: 'supra')

standard = Subscription.find_by(name: 'standard')
super_sport_plus = Subscription.find_by(name: 'super sport +')

Car.create!([{ maker: bmw, model: series_3, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: bmw, model: x1, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: yaris, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: super_sport_plus, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: super_sport_plus, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: super_sport_plus, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: super_sport_plus, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: super_sport_plus, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: super_sport_plus, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: rav4, subscription: standard, year: 2019, color: 'red',
               availability_date: DateTime.current },
             { maker: toyota, model: supra, subscription: super_sport_plus, year: 2010, color: 'red',
               availability_date: DateTime.current }])

p "Created #{Car.count} cars"
