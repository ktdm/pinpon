class WordsController < ApplicationController
  def index
    @search = [params[:source_lang] || "Japanese", params[:target_lang] || "English"]
    if params[:source_lang] and params[:target_lang]
      @equivalences = Equivalence.where(
        :source_word_id => Word.where(:language => @search[0].capitalize).select("id"),
        :target_word_id => Word.where(:language => @search[1].capitalize).select("id")
      ).select(:source_word_id).uniq
      render :partial => 'list'
    end

#    respond_to do |format|
#      format.html
#      format.json  { render :json => @words }
#    end
  end

  def show
    @word = Word.find(params[:id])
  end

  def create
  end

  def vote
  end
end
