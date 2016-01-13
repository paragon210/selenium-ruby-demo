# This class is a page object for the home page on eBay
# All page elements and Selenium calls are done via the custom page objects API
# This makes it easy for anyone to use the more user-friendly named methods to build automation
# without having to know the intricacies of Selenium or the page DOM elements.
# Author: Ryan Gomez

require 'selenium-webdriver'

class EbayHomePage

  attr_reader :url
  attr_reader :search_term
  attr_reader :wrong_term

  def initialize
    @url = 'http://www.ebay.com'
    @search_term = "shoes"
    @wrong_term = 'colouredturtlepaintings'
  end

  # Waits for the search input element to appear, inputs search term, and submits the search
  # Params: driver, wait
  def submit_correct_search(driver,wait)
    wait.until { driver.find_element(:id, "gh-ac").displayed? }
    element = driver.find_element(:id, "gh-ac")
    element.send_keys @search_term
    element.submit
  end

  # Waits for the search input element to appear, inputs search term, and submits the search
  # Params: driver, wait
  def submit_wrong_search(driver,wait)
    wait.until { driver.find_element(:id, "gh-ac").displayed? }
    element = driver.find_element(:id, "gh-ac")
    element.send_keys @wrong_term
    element.submit
  end

end