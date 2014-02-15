require 'spec_helper'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'open-uri'
doc = Nokogiri::HTML(open('http://localhost:3000').read)
describe "CreditCards" do
  describe "list_info" do
   	it "should have the list 'Success Disputed and Failed'" do
      expect(doc).to have_selector('.success_h2',:text => "Success")
      expect(doc).to have_selector('.disputed_h2',:text => 'Disputed')
      expect(doc).to have_selector('.failed_h2',:text => 'Failed')
    end

   	it "count success disputed and failed rows " do
      count=0
      doc.css('.success').each do |s|
      	count+=1;
      end
	    puts "total number of success rows "+count.to_s
	    count=0
      doc.css('.danger').each do |s|
      	count+=1;
      end
	    puts "total number of danger rows "+count.to_s
      count=0
	    doc.css('.failed').each do |s|
      	count+=1;
      end
	    puts "total number of failed rows "+count.to_s
	  end
  end
end

