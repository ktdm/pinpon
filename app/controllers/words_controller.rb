class WordsController < ApplicationController
  def index
    @lang = [params[:source_lang] || "Japanese", params[:target_lang] || "English"]
    if params[:source_lang] and params[:target_lang]
      if params[:search]
        @equivalences = Equivalence.where(
          :source_word_id => Word.where("language = ? AND value like ?", @lang[0].capitalize, params[:search] + "%").select("id"),
          :target_word_id => Word.where(:language => @lang[1].capitalize).select("id")
        ).select(:source_word_id).uniq
        render :partial => 'result'
      else
        @equivalences = Equivalence.where(
          :source_word_id => Word.where(:language => @lang[0].capitalize).select("id"),
          :target_word_id => Word.where(:language => @lang[1].capitalize).select("id")
        ).select(:source_word_id).uniq
        render :partial => 'list'
      end
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
