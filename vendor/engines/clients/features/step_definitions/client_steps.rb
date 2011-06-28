Given /^I have no clients$/ do
  Client.delete_all
end

Given /^I (only )?have clients titled "?([^\"]*)"?$/ do |only, titles|
  Client.delete_all if only
  titles.split(', ').each do |title|
    Client.create(:name => title)
  end
end

Then /^I should have ([0-9]+) clients?$/ do |count|
  Client.count.should == count.to_i
end
