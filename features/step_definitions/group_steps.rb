Given /^I have groups named (.+)$/ do |groups_string|
  groups_string.split(', ').each do |name|
    Group.create!(:name => name)
  end
end

Given /^I have no groups$/ do
  Group.delete_all
end

Then /^I should have ([0-9]+) groups?$/ do |count|
  Group.count.should == count.to_i
end