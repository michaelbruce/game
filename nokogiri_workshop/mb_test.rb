require 'nokogiri'

@xml_doc = Nokogiri::XML(File.open("mb_test.xml")) { |config| config.options = Nokogiri::XML::ParseOptions::STRICT }
@xml_doc.remove_namespaces!
product_id = @xml_doc.xpath('///Product')[0].attributes['productID'].value
status_type = @xml_doc.map{|element| element.attributes['statusType'].value unless element.attributes['statusType'].nil? }[0]
binding.pry
