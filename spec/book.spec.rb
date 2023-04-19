require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('title', 'author')
  end
  describe '#addnew' do
    it 'takes the two parameter' do
      @book.should be_an_instance_of Book
    end
  end
end




















# describe "sample test" do
#   it "should pass" do
#     expect(true).to eq(true)
#   end
# end












# describe Book do
#   # before :each do
#   #   @book = Book.new("title", "author")
#   # end
#   describe "#addnew" do

#     it "takes the two parameter" do
#       book = Book.new("title", "author")
#       expect(book).to eq({title: "title", author: "author", rentals: []})
#     end
#   end
# end

# # require 'spec_helper'

# # describe Book do
# #   before :each do
# #     @book = Book.new("title", "author")
# #   end
# #   describe "#addnew" do
# #     # book = Book.new("title", "author")
# #     it "takes the two parameter" do
# #       @book.should be_an_instance_of Book
# #       # expect(book).to eq({title: "title", author: "author", rentals: []})
# #     end
# #   end
# # end
