# require_relative '../book'

# describe Book do
#   before :each do
#     @book = Book.new('All girls are the same', 'Tobby')
#   end

#   describe '#addnew' do
#     it 'takes the two parameter' do
#       expect(@book).to be_an_instance_of Book
#     end
#   end

#   describe 'check value of title and author' do
#     it 'value of title' do
#       expect(@book.title).to eq('All girls are the same')
#     end

#     it 'value of author' do
#       expect(@book.author).to eq('Tobby')
#     end
#   end
# end

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
