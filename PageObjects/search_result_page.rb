# This class is a page object for the search results page on eBay
# All page elements and Selenium calls are done via the custom page objects API
# This makes it easy for anyone to use the more user-friendly named methods to build automation
# without having to know the intricacies of Selenium or the page DOM elements.
# Author: Ryan Gomez

require 'selenium-webdriver'

class SearchResultPage

  # Returns the number of results on the first result page based on the class used to display each item
  # Params: driver
  def get_results_size(driver)
    size = driver.find_elements(:xpath, "//*[@class='sresult gvresult']").size
  end

  # Returns a boolean value based on whether the search term appears in the results area
  # Params: driver, term
  def verify_search_term(driver,term)
    result = driver.find_element(:xpath, "//*[@id='bciw']/div/h1/span/b").text.include? term
  end

end