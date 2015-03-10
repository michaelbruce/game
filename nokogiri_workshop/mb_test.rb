require 'nokogiri'

@xml_doc = Nokogiri::XML(File.open("mb_test.xml")) { |config| config.options = Nokogiri::XML::ParseOptions::STRICT }
@xml_doc.remove_namespaces!
# Reading - Minimum XML Requirements
product_id = @xml_doc.xpath('///Product')[0].attributes['productID'].value
status_type = @xml_doc.xpath('//Research//Product//StatusInfo').map{|element| element.attributes['statusType'].value unless element.attributes['statusType'].nil? }[0]
authors = @xml_doc.xpath('//Research//Product//Source//Organization//PersonGroup//PersonGroupMember//').map{|element|
  #element.attributes['']
  #get displayname etc
  #map it to an out array
}
content = @xml_doc.xpath('//Research//Product//Content').map{|element|
  #element.attributes['']
  #title, synopsis, extract etc...
  #map it to an out array
}
# some of context is extra information
context_basic = @xml_doc.xpath('//Research//Product//Content').map{|element|
  #element.attributes['']
  #publication date, country, region etc...
  #map it to an out array
}
# Reading - Extra XML Requirements
context_extra = @xml_doc.xpath('//Research//Product//Content').map{|element|
  #element.attributes['']
  #publication date, country, region etc...
  #map it to an out array
}

# Map to csv and upload - !!! how to handle tags?
CSV.open('test_merged_records.csv', "wb") do |out|
  out << ['SingletrackCMS__External_Id__c',
          'ANALYST',
          'Name',
          'SingletrackCMS__Long_Title__c',
          'SingletrackCMS__S3_Description__c',
          'Summary Section',
          'Detail Section']
  merged_records.each { |record| out << record.values }
end
