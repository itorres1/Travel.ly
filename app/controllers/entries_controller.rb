class EntriesController < ApplicationController

  def create
    @stop = Stop.find(params[:stop_id])
    @entry = @stop.entries.create(entry_params)
    redirect_to stop_path(@stop)
  end

  def destroy
    @entry = Entry.destroy(params[:id])
    redirect_to stop_entries_path
  end

  def new
    @entry = Entry.new
    @stop = Stop.find(params[:stop_id])
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update(entry_params)
    redirect_to entry_path(@entry.id)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:photo, :text, :title, :stop_id)
  end
end