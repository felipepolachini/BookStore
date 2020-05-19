# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

Given("Post book info") do
  FakeRest.postBook
end

Given("Read book info") do
  FakeRest.readBook
end


Given("Change book info") do
  steps %Q{
      Given Read book info
  }
  FakeRest.changeBookInfo
end

Then("API Success") do
  raise "API failed" unless expect(FakeRest.returnResponseCode).to eq 200
end