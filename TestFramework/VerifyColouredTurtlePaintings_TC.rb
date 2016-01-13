# This class is a test case to test the search term "colouredturtlepaintings" on eBay
# We expect the term to return results greater than 0 for the search term
# All page elements and Selenium calls are done via the page objects methods
# Author: Ryan Gomez


require 'rubygems'
require "selenium-webdriver"
require 'test/unit'
require 'test/unit/assertions'
require '../PageObjects/ebay_home_page'
require '../PageObjects/search_result_page'

class VerifyColouredTurtlePaintingsTC < Test::Unit::TestCase
  def setup
    # Selenium and page object creation
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    @ebayPage = EbayHomePage.new
    @resultsPage = SearchResultPage.new
  end

  def test_verify_shoe_search
    #Navigate to eBay URL. Enter search term into search input box
    @driver.manage.window.maximize
    @driver.get(@ebayPage.url)
    @ebayPage.submit_wrong_search(@driver, @wait)

    #Verify we are on a page of search results using our search term
    assert_equal(@driver.title,"#{@ebayPage.wrong_term} | eBay")

    #Verify the search term is the term on the page
    assert_true(@resultsPage.verify_search_term(@driver, "#{@ebayPage.wrong_term}"))

    # Verify we have search results using the class they contain if they are a search result and compare the count
    assert_compare(0,"<",@resultsPage.get_results_size(@driver))
  end

  def teardown
    @driver.quit
  end

end