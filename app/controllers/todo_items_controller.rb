class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  # GET /todo_items
  # GET /todo_items.json
  def index
    if params[:sort_by]
      if(params[:sort_by] == "color")
        @todo_items = TodoItem.order(uses_color: :desc , color: :desc)
      else
        @todo_items = TodoItem.order(params[:sort_by])
      end
    else 
      @todo_items = TodoItem.order(uses_color: :desc , color: :desc,  completed: :asc, due: :desc,)
    end
  end

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
  end

  # GET /todo_items/new
  def new
    @todo_item = TodoItem.new
  end

  # GET /todo_items/1/edit
  def edit
  end

  # GET /todo_items/1/complete
  def complete
    todo_item = TodoItem.find(params[:complete_id])
    todo_item.completed = !todo_item.completed
    todo_item.save

    # logger.debug "***** " + todo_item.inspect
    # logger.debug "**** todo_item_params = " + todo_item_params.inspect;

    redirect_to "/todo_items/"
  end

  # POST /todo_items
  # POST /todo_items.json
  def create
    @todo_item = TodoItem.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to @todo_item, notice: 'Todo item was successfully created.' }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
    # logger.debug @todo_item.inspect
    logger.debug todo_item_params.inspect;

    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @todo_item, notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to todo_items_url, notice: 'Todo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:description, :due, :assigned, :owner, :completed, :color, :uses_color)
    end

    def todo_items_params
      params
    end
end
