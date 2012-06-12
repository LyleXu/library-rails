class BooksController < ApplicationController
  before_filter :find_book, :only => [ :show, :edit, :update, :destroy ]
	def index
		@books = Book.all
		@page_title = 'index page'

		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @books.to_json }
			format.xml { render :xml => @books.to_xml }
		end
	end

	def new
		@book = Book.new
		@page_title = 'new Book page'
	end

	def create
		@book = Book.new(params[:book])
		if @book.save
      flash[:notice] = "book #{@book.name} was successfully create"
      redirect_to :action => :index
    else
      render :action => :new
    end
	end

	def show
		#@book = Book.find(params[:id])
		@page_title = "#{@book.name} detail page"
	end

	def edit
		#@book = Book.find(params[:id])
		@page_title = "edit #{@book.name}"
	end

	def update
		#@book = Book.find(params[:id])
		if @book.update_attributes(params[:book])
      flash[:notice] = "book #{@book.name} was successfully updated"
      redirect_to :action => :show, :id => @book
    else
      render :action => :edit
    end
	end

	def destroy
		#@book = Book.find(params[:id])
		@book.destroy
    flash[:alert] = "book #{@book.name} was successfully deleted"
    redirect_to :action => :index
	end

  def find_book
    @book = Book.find(params[:id])
  end
end
