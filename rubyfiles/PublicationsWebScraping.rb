# File Created 2/28/2020 by Ern Chi Khoo

require 'mechanize'
require 'nokogiri'

# Created 2/28/2020 by Ern Chi Khoo
# Returns all the items on the publications page 
def get_items
	# Scrapes data from publications page 
	agent = Mechanize.new
	page = agent.get "http://web.cse.ohio-state.edu/~davis.1719/publications.html"

	all_items = [] 
	# get all the <li> elements
	items = page.css("ul").css("li") 

	# go through every <li> element 
	items.each do |i|
		item_att = []
		text = i.text # returns a string of all the text 
		a = text.split("\n")

		# for some items, the first element is "", and so the title would be in a[1] instead
		if a[0] == ""
			item_att << a[1]
			item_att << a[2]
			item_att << a[3]
		else
			item_att << a[0]
			item_att << a[1]
			item_att << a[2]
		end

		if i.css("a").empty?
			item_att << ""
		else 
			# get the <a> tag 
			link = i.css("a").to_s 
			link = Nokogiri::HTML(link)
			# get the link in at href 
			href = link.at_css("a")[:href]
			item_att << href
		end
		all_items << item_att
	end
	all_items
end