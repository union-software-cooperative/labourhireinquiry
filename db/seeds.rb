# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unions = Union.create([
{ name: "National Union of Workers", short_name: "NUW", enabled: false, www: "secure.work", type: "Union"},
{ name: "Civil Air", short_name: "Civil Air", enabled: false, www: "secure.work", type: "Union"},
{ name: "Professionals Australia", short_name: "APESMA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Independent Education Union of Australia", short_name: "IEUA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Workers' Union", short_name: "AWU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Victorian Psychologists Association Incorporated", short_name: "VPA Inc", enabled: false, www: "secure.work", type: "Union"},
{ name: "National Tertiary Education Union", short_name: "NTEU", enabled: false, www: "secure.work", type: "Union"},
{ name: "New South Wales Nurses and Midwives' Association", short_name: "NSWNMA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Maritime Officers Union", short_name: "AMOU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Medical Scientists Association of Victoria", short_name: "MSAV", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australasian Meat Industry Employees Union", short_name: "AMIEU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Community and Public Sector Union - SPSF Group", short_name: "CPSU_SPSF", enabled: false, www: "secure.work", type: "Union"},
{ name: "Flight Attendants Association of Australia - National Division", short_name: "FAAA_National", enabled: false, www: "secure.work", type: "Union"},
{ name: "Construction, Forestry, Mining and Energy Union", short_name: "CFMEU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Writers' Guild", short_name: "AWG", enabled: false, www: "secure.work", type: "Union"},
{ name: "Association of Hospital Pharmacists", short_name: "AHP", enabled: false, www: "secure.work", type: "Union"},
{ name: "Shop Distributive and Allied Employees Association", short_name: "SDA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Pilot Association for Virgin Australia Group", short_name: "VIPA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Funeral and Allied Industries Union of NSW", short_name: "F&AI", enabled: false, www: "secure.work", type: "Union"},
{ name: "Communications, Electrical and Plumbing Union of Australia", short_name: "CEPU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Transport Workers Union of Australia", short_name: "TWU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Union of Christmas Island Workers", short_name: "UCIW", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Licenced Aircraft Engineers Association", short_name: "ALAEA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Services Union", short_name: "ASU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Manufacturing Workers Union", short_name: "AMWU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Blind Workers Union of Victoria", short_name: "BWU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Maritime Union of Australia", short_name: "MUA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Textile, Clothing and Footwear Union of Australia", short_name: "TCFUA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Flight Attendants' Association of Australia - International", short_name: "FAAA_International", enabled: false, www: "secure.work", type: "Union"},
{ name: "Club Managers Association Australia", short_name: "CMAA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Media, Entertainment & Arts Alliance", short_name: "MEAA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Western Australian Prison Officers\' Union of Workers", short_name: "WAPOU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Professional Footballers` Association", short_name: "APFA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Education Union", short_name: "AEU", enabled: false, www: "secure.work", type: "Union"},
{ name: "United Firefighters Union of Australia", short_name: "UFU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Rail, Tram and Bus Union", short_name: "RTBU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Community and Public Sector Union - PSU Group", short_name: "CPSU_PSU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian & International Pilots Association", short_name: "AIPA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Institute of Marine and Power Engineers", short_name: "AIMPE", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Salaried Medical Officers Federation", short_name: "ASMOF", enabled: false, www: "secure.work", type: "Union"},
{ name: "Finance Sector Union", short_name: "FSU", enabled: false, www: "secure.work", type: "Union"},
{ name: "Breweries & Bottleyards Employees Industrial Union of Workers", short_name: "BBEIUW", enabled: false, www: "secure.work", type: "Union"},
{ name: "United Voice", short_name: "UV", enabled: false, www: "secure.work", type: "Union"},
{ name: "Police Federation of Australia", short_name: "PFA", enabled: false, www: "secure.work", type: "Union"},
{ name: "Australian Nursing & Midwifery Federation", short_name: "ANMF", enabled: false, www: "secure.work", type: "Union"},
{ name: "Health Services Union", short_name: "HSU", enabled: false, www: "secure.work", type: "Union"}
])
unions.each {|u| u.save!(validate: false)}