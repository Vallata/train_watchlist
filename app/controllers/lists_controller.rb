class ListsController < ApplicationController

  def index
    @lists = List.all
    # ************************
    @list = List.new
    # ************************
  end

  def show
    @list = List.find(params[:id])
  end

  # could be deleted (because included in the Index meth) but kept because we need button "create a new list" and path to the new form
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to
  end


  private

  # list_param

  def list_params
    params.required(:list).permit(:name)
  end

end
