class BorrowsController < ApplicationController
  # GET /borrows
  # GET /borrows.json
  def index
    @borrows = Borrow.all
    @books = User.find(session[:current_user_id]).books
    @books.build unless @books

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @borrows }
    end
  end

  # GET /borrows/1
  # GET /borrows/1.json
  def show
    @borrow = Borrow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @borrow }
    end
  end

  # GET /borrows/new
  # GET /borrows/new.json
  def new
    @book = Book.find(params[:book_id])
    user_id = session['current_user_id']
    @borrow = Borrow.create(:book_id => @book.id, :user_id => user_id)
    if(@borrow)
      redirect_to user_books_path(user_id)
    else

	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @borrow }
	    end
    end
  end

  # GET /borrows/1/edit
  def edit
    @borrow = Borrow.find(params[:id])
  end

  # POST /borrows
  # POST /borrows.json
  def create
    @borrow = Borrow.new(params[:borrow])

    respond_to do |format|
      if @borrow.save
        format.html { redirect_to @borrow, notice: 'Borrow was successfully created.' }
        format.json { render json: @borrow, status: :created, location: @borrow }
      else
        format.html { render action: "new" }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /borrows/1
  # PUT /borrows/1.json
  def update
    @borrow = Borrow.find(params[:id])

    respond_to do |format|
      if @borrow.update_attributes(params[:borrow])
        format.html { redirect_to @borrow, notice: 'Borrow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrows/1
  # DELETE /borrows/1.json
  def destroy
    @borrow = Borrow.find(params[:id])
    @borrow.destroy

    respond_to do |format|
      format.html { redirect_to borrows_url }
      format.json { head :no_content }
    end
  end
end
