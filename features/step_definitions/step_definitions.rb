# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

Given("Post book info") do
  FakeRest.postBook
end

Then("Book created") do
  raise "Error at creating book" unless FakeRest.bookCreated == true
end

Given("Read book info") do
  FakeRest.readBook
end

Then("Book read") do
  raise "Error at reading book" unless FakeRest.bookRead == true
end

Given("Change book info") do
  steps %Q{
      Given Read book info
  }
  FakeRest.changeBookInfo
end

Then("Book changed") do
  raise "Error at changing book" unless FakeRest.bookChanged == true
end
