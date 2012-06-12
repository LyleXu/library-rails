class BooksController < ApplicationController
	def index
		@books = Book.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @books.to_json }
			format.xml { render :xml => @books.to_xml }
		end
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(params[:book])
		@book.save

		redirect_to :action => :index
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update_attributes(params[:book])

		redirect_to :action => :show, :id => @book
	end

	def destroy
		@book = Book.new(params[:id])
		@book.destroy

		redirect_to :action => :index
	end
end
