class Library
	def initialize 
		@books = []
	end
	
	def	addbook(book)
		@books << book
		puts " You have this #{@books.count} in the library."
	end
end

class Membership
	def initialize
		@user = []
	end
	
	def member(name)
		@user << name

	end	

end

class Book
	def initialize
		@books = []
	end

	def addbookinfo(title,author,description)
		@book = title
		@author = title
		@description =	book
		puts " Well, #{@book}, by #{@author} is quite #{@description} interesting."
	
end



library=Library.new
puts " library inti book count"

book1 = book.new('some title')
book2 = book.new('another title')

library.add_book(book1)
library.add_book(book2)

puts "Book 1 title:"

library.add_membership('bob')

library.checkout('some title','bob')
