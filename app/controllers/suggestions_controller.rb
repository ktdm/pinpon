class SuggestionsController < ApplicationController
  def index
  end

  def new
    @suggestion = Suggestion.new
    @suggestion.apropos_of = Word.find(params[:word_id])
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])
    @suggestion.apropos_of_id = params[:apropos_of][:id]
    @suggestion.suggested_word_id = Word.where("value = ? AND language = ?", *params[:suggested_word].values)[0].id
    @suggestion.save
    redirect_to word_path(@suggestion.apropos_of)
  end

  def vote #easily cheatable. rework later
    @suggestion = Suggestion.find(params[:id])
    @suggestion.upvotes += params[:upvote].to_i
    @suggestion.downvotes += params[:downvote].to_i
    @suggestion.save
    render :nothing => true
  end
end
