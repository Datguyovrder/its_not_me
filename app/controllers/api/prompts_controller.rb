class Api::PromptsController < ApplicationController
  def index
    @prompts = Prompt.all
    render 'index.json.jbuilder'
  end

  def show
    @prompt = Prompt.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end
end
