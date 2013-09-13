

class Library  

  attr_accessor :books, :users

  def initialize(lib="MakerSquare")
  	@library = library
    @books = []
  end



  def add_book(book)
    @books << book
    book.owner = @library
  end


  def books_available
    @books.each do |book|
      if book.status == "Available"
        puts "We have #{book.title}."
      end
    end
  end


  def check_out(book, user)
        if book.owner == " "
      puts "Book is not available. Please add it to the library, before checking it out."
        else
        if user.user_standing == "Bad"
        puts "Sorry, you will not be able to check out this book becuase you have a prior overdue account."
        else
        if user.books_out >= 2 then
          puts "You have too many books checked out!"
          puts "Please return a book before checking out another one."
        elsif book.status == "Checked Out"
          puts "Sorry, this book is already checked out!"
        else
          puts "You checked out #{book.title}. Please bring it back in a week."
          user.books_out = user.books_out + 1
          book.status = "Checked Out"
          book.owner = user.name
          book.due_date = Time.now + (7*24*60*60)
          puts "Your book is due #{book.due_date}!"
        end
      end
    end
  end


  def check_in(book, user)
    puts "Thank you #{user.name} for returning #{book.title}!"
    book.status = "Available"
    user.books_out = user.books_out - 1
    book.owner = @lib
      if user.user_standing == "Horrible"
      if user.books_out == 0
        puts "Thanks, for returning!. You will be able to check out books again!"
        user.user_standing = "Great"
      else
        puts "Please return all books before checking book again."
      end
    end
  end


  def books_overdue?
    @books.each do |book|
        if book.status == "Overdue"
        puts "#{book.title} is Overdue!"
      elsif book.status == "Checked Out"
        if Time.now > book.due_date
          book.status = "Overdue"
          puts "#{book.title} is Overdue!"
          user.user_standing = "Horrible"
        end
      end
    end
  end



  def books_out
    @books.each do |book|
        if book.status == "Checked Out"
        puts "#{book.title} was checked out by #{book.owner} and is due #{book.due_date}."
      end
    end
  end

end



class Book
  attr_accessor :status, :due_date, :owner
  attr_reader :author, :title, :description

  def initialize(author="Ami", title="MakerSquare", description="Great")
    @title = title
    @author = author
    @description = description
    @due_date = ""
    @owner = " "
    @status = "Available"
    puts "You have created a new book. Please add it to your book collection"
  end
  end




class User 
  attr_accessor :books_out, :user_standing
  attr_reader :name

  def initialize(name="Ami")
    @name = name
    puts "Welcome #{@name}."
    @books_out = 0
    @user_standing = "Great"
  end
end







