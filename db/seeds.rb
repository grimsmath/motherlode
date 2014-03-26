# This seed data provides a default administrator user and optional seed data. When seeding a production deployment,
# change the default administrator credentials to a temporary yet secure selection. Once deployed, change password.
# It is recommend that example data be disabled prior to deployment.

# =============================================
# Users
# =============================================
User.create(email: 'david.king@unf.edu', name: 'David King',   password: 'password', admin: true)
User.create(email: 'geoff.wark@unf.edu', name: 'Geoff Wark',   password: 'password', admin: true)
User.create(email: 'm@mlw.ac',           name: 'Matt Walston', password: 'password', admin: true)

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

