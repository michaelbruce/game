require 'nokogiri'

@xml_doc = Nokogiri::XML(File.open("mb_test.xml")) { |config| config.options = Nokogiri::XML::ParseOptions::STRICT }
@xml_doc.remove_namespaces!
# Reading - Minimum XML Requirements
product_id = @xml_doc.xpath('///Product')[0].attributes['productID'].value
status_type = @xml_doc.xpath('//Research//Product//StatusInfo').map{|element| element.attributes['statusType'].value unless element.attributes['statusType'].nil? }[0]
authors = @xml_doc.xpath('//Research//Product//Source//Organization//PersonGroup//PersonGroupMember').map{|element|
  primary_indicator = element.attributes['primaryIndicator'].text
  person_id = element.xpath('Person')[0].attributes['personID'].value
  full_name, email = nil, nil
  element.xpath('Person')[0].children.each {|attribute|
    full_name = attribute.children[0].text if attribute.name == 'DisplayName'
    attribute.children.each {|contact_info_attribute| email = contact_info_attribute.children[0].text if contact_info_attribute.name == 'Email' } if attribute.name == 'ContactInfo'
  }
  [primary_indicator, person_id, full_name, email]
}
content = @xml_doc.xpath('//Research//Product//Content').map{|element|
  title, resource_primary_indicator, resource_name = nil, nil, nil
  element.children.each {|content_attribute|
    title = content_attribute.text if content_attribute.name == 'Title'
  }
  resource = element.xpath('Resource')
  resource.each {|resource_attribute|
    resource_primary_indicator = resource_attribute.attributes['primaryIndicator'].text
    #p resource_attribute[0].text if resource_attribute[0].name == 'Name'
    resource_attribute.children.each {|node| resource_name = node.text if node.name == 'Name'}
    #resource_attribute
  }
  [title, resource_primary_indicator, resource_name]
}
# some of context is extra information
precontext_basic = @xml_doc.xpath('//Research//Product//Context')
context_basic = @xml_doc.xpath('//Research//Product//Context').map{|element|
  external = element.attributes['external'].text
  publication_date_time = element.xpath('ProductDetails')[0].attributes['publicationDateTime'].text
  prec = element.xpath('ProductClassifications//Country')
  [external, publication_date_time]
}
# Reading - Extra XML Requirements
context_extra = @xml_doc.xpath('//Research//Product//Content').map{|element|
  countries = element.xpath('//ProductClassifications//Country').map{|country| [country.attributes['code'].text, country.attributes['primaryIndicator'].text]}
  regions = element.xpath('//ProductClassifications//Region').map{|region| [region.attributes['primaryIndicator'].text, region.attributes['publisherDefinedValue'].text]}
  macro_sector = element.xpath('//ProductClassifications//MacroSector').map{|sector| [sector.attributes['primaryIndicator'].text, sector.attributes['MacroSectorValue'].text]}
  document_type = element.xpath('//ProductClassifications//DocumentTypeTag').map{|type| [type.attributes['primaryIndicator'].text, type.attributes['DocumentTypeTagValue'].text]}
  latest_change = element.xpath('//ProductClassifications//LatestChgReco').map{|change| [change.attributes['primaryIndicator'].text, change.attributes['LatestChgRecoValue'].text]}
  published = element.xpath('//ProductClassifications//PublishedTag').map{|published| [published.attributes['primaryIndicator'].text, published.attributes['PublishedTagValue'].text]}
  bloomberg = element.xpath('//ProductClassifications//BloombergFlag').map{|bloomberg| [bloomberg.attributes['primaryIndicator'].text, bloomberg.attributes['BloombergFlagValue'].text]}
  kmflag = element.xpath('//ProductClassifications//KMFlag').map{|kmflag| [kmflag.attributes['primaryIndicator'].text, kmflag.attributes['KMFlagValue'].text]}
  european_banks = element.xpath('//ProductClassifications//EuropeanBanks').map{|eurobank| [eurobank.attributes['primaryIndicator'].text, eurobank.attributes['EuropeanBanksValue'].text]}
  european_insurance = element.xpath('//ProductClassifications//EuropeanInsurances').map{|eurobank| [eurobank.attributes['primaryIndicator'].text, eurobank.attributes['EuropeanInsurancesValue'].text]}
  sector_industry = element.xpath('//ProductClassifications//SectorIndustry').map{|sector| [sector.attributes['primaryIndicator'].text, sector.attributes['Name'].text]}
  issuer_details = element.xpath('//IssuerDetails//Issuer').map{|issuer| [issuer.attributes['primaryIndicator'].text,
                                                                          issuer.xpath('//IssuerName')[0].attributes['NameValue'].text,
                                                                          issuer.xpath('//SectorIndustry')[0].attributes['name'].text,
                                                                          ]}
  [countries, regions, macro_sector, document_type, latest_change, published, bloomberg, kmflag, european_banks, european_insurance, sector_industry, issuer_details]
}

xml_data = [product_id, status_type, authors, content, context_basic, context_extra]
p xml_data

# Map to csv and upload - !!! how to handle tags?
#CSV.open('test_merged_records.csv', "wb") do |out|
#  out << ['SingletrackCMS__External_Id__c',
#          'ANALYST',
#          'Name',
#          'SingletrackCMS__Long_Title__c',
#          'SingletrackCMS__S3_Description__c',
#          'Summary Section',
#          'Detail Section']
#  merged_records.each { |record| out << record.values }
#end
