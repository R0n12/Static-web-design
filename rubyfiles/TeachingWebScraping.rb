require 'mechanize'

# File and all contents created on 2/28/20 by Jas Bawa

def list_of_years
  # Creates Mechanize Object and scrapes data from link
  agent = Mechanize.new
  page = agent.get "http://web.cse.ohio-state.edu/~davis.1719/teaching.html"

  # Gets all the years and returns them
  years = page.css("td")[1].css("b")
end

def list_of_items
  # Creates Mechanize Object and scrapes data from link
  agent = Mechanize.new
  page = agent.get "http://web.cse.ohio-state.edu/~davis.1719/teaching.html"

  # Gets all the years and returns them
  items = page.css("td")[1].css("table")
end
