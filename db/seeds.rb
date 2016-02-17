# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
union = Union.new( name: "SA Unions", www: "www.saunions.org.au/", short_name: "saunions", enabled: true )
union.save(validate: false)
user = Person.create!( email: "admin@saunions.org.au", password: "temptemp", password_confirmation: "temptemp", first_name: "Admin", union: union )
user.update!(invited_by: user) # invite self for the sake of looking like a user

unions = Union.create([
{ name: "National Union of Workers", short_name: "NUW", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Civil Air", short_name: "Civil Air", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Professionals Australia", short_name: "APESMA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Independent Education Union of Australia", short_name: "IEUA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Workers' Union", short_name: "AWU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Victorian Psychologists Association Incorporated", short_name: "VPA Inc", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "National Tertiary Education Union", short_name: "NTEU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "New South Wales Nurses and Midwives' Association", short_name: "NSWNMA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Maritime Officers Union", short_name: "AMOU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Medical Scientists Association of Victoria", short_name: "MSAV", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australasian Meat Industry Employees Union", short_name: "AMIEU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Community and Public Sector Union - SPSF Group", short_name: "CPSU_SPSF", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Flight Attendants Association of Australia - National Division", short_name: "FAAA_National", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Construction, Forestry, Mining and Energy Union", short_name: "CFMEU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Writers' Guild", short_name: "AWG", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Association of Hospital Pharmacists", short_name: "AHP", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Shop Distributive and Allied Employees Association", short_name: "SDA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Pilot Association for Virgin Australia Group", short_name: "VIPA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Funeral and Allied Industries Union of NSW", short_name: "F&AI", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Communications, Electrical and Plumbing Union of Australia", short_name: "CEPU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Transport Workers Union of Australia", short_name: "TWU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Union of Christmas Island Workers", short_name: "UCIW", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Licenced Aircraft Engineers Association", short_name: "ALAEA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Services Union", short_name: "ASU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Manufacturing Workers Union", short_name: "AMWU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Blind Workers Union of Victoria", short_name: "BWU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Maritime Union of Australia", short_name: "MUA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Textile, Clothing and Footwear Union of Australia", short_name: "TCFUA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Flight Attendants' Association of Australia - International", short_name: "FAAA_International", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Club Managers Association Australia", short_name: "CMAA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Media, Entertainment & Arts Alliance", short_name: "MEAA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Western Australian Prison Officers\' Union of Workers", short_name: "WAPOU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Professional Footballers` Association", short_name: "APFA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Education Union", short_name: "AEU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "United Firefighters Union of Australia", short_name: "UFU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Rail, Tram and Bus Union", short_name: "RTBU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Community and Public Sector Union - PSU Group", short_name: "CPSU_PSU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian & International Pilots Association", short_name: "AIPA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Institute of Marine and Power Engineers", short_name: "AIMPE", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Salaried Medical Officers Federation", short_name: "ASMOF", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Finance Sector Union", short_name: "FSU", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Breweries & Bottleyards Employees Industrial Union of Workers", short_name: "BBEIUW", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "United Voice", short_name: "UV", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Police Federation of Australia", short_name: "PFA", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Australian Nursing & Midwifery Federation", short_name: "ANMF", enabled: false, www: "securejobssa.org.au", type: "Union"},
{ name: "Health Services Union", short_name: "HSU", enabled: false, www: "securejobssa.org.au", type: "Union"}
])
unions.each {|u| u.save!(validate: false)}

Union.update_all({
		call_to_action: "LET'S BRING BACK SECURE JOBS", 
		explanation: "The South Australian government says they are determined to regulate labour hire and irradicate sham contracting.  They say they want an end to the exploitation of a growing number people in insecure jobs.  More than 40% of Australians have insecure jobs.  That's un-Australian.   Have your say and make them fix it!",
		submissions_heading: "Join the chorus of submissions before they close on the 23 March 2015",
		action1: "Exploited? Tell your story to the inquiry",
		background_colour: "#900",
		font_colour: "white"
})