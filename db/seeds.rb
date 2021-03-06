# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# remove all the users from the database
User.destroy_all()

# =============================================
# Users
# =============================================
User.create(email: 'grimsmath@gmail.com', name: 'David King', password: 'password', admin: true)

# remove all the old categories from the database
Category.destroy_all()

# =============================================
# First Coast Green Map
# =============================================
fcgm = Category.create(title: 'First Coast Green Map')
fcgm.children << Category.create(title: 'Green Buildings')
fcgm.children << Category.create(title: 'Community Gardens')
fcgm.children << Category.create(title: 'Murray Hill Community Garden')

# =============================================
# Park Experience
# =============================================
pe = Category.create(title: 'Park Experience')

# National Park Service (NPS)
nps = Category.create(title: 'National Park Service')
pe.children << nps

nps.children << Category.create(title: 'Fort Caroline')
nps.children << Category.create(title: 'Castillo de San Marco')

# Florida State Parks
flps = Category.create(title: 'Florida State Parks')
pe.children << flps

flps.children << Category.create(title: 'Little Talbot Island')
flps.children << Category.create(title: 'Big Talbot Island')

