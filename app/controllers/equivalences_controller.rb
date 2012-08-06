class EquivalencesController < ApplicationController
  def new
    @equivalence = Equivalence.new
    @equivalence.source_word = Word.find_or_initialize_by_id(params[:word_id])
    @equivalence.target_word = Word.new
    @equivalence.explanations << @explanation = Explanation.new

    respond_to do |format|
      format.html
      format.json  { render :json => @equivalence }
    end
  end

  def create
    @equivalence = Equivalence.new
    @equivalence.source_word_id = params[:source_word][:id] || Word.find_or_create_by_value_and_language(*params[:source_word].to_a.map {|p| p[1]}).id #can I assume hash order??
    @equivalence.target_word = Word.find_or_create_by_value_and_language(*params[:target_word].to_a.map {|p| p[1]})
    @equivalence.explanations << @explanation = Explanation.new(params[:explanation])
 
    respond_to do |format|
      if @equivalence.save
        format.html  { redirect_to(@equivalence,
                      :notice => 'Translation was successfully submitted.') }
        format.json  { render :json => @equivalence,
                      :status => :created, :location => @equivalence }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @equivalence.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @equivalence = Equivalence.find(params[:id])
 
    respond_to do |format|
      format.html
      format.json  { render :json => @equivalence }
    end
  end

  def edit
    @equivalence = Equivalence.find(params[:id])
 
    respond_to do |format|
      format.html
      format.json  { render :json => @equivalence }
    end
  end

  def update
    @equivalence = Equivalence.find(params[:id])
    @equivalence.source_word.update_attributes(params[:source_word])
    @equivalence.target_word.update_attributes(params[:target_word])
    @equivalence.explanations[0].update_attributes(params[:explanation]) if params[:explanation] #??
 
    respond_to do |format|
      if @equivalence.update_attributes(params[:equivalence])
        format.html  { redirect_to(@equivalence,
                      :notice => 'Translation was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @equivalence.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @equivalence = Equivalence.find(params[:id])
    @equivalence.destroy

    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end

  def search
    
  end

  def vote #easily cheatable. rework later
    @equivalence = Equivalence.find(params[:id])
    @equivalence.upvotes += params[:upvote].to_i
    @equivalence.downvotes += params[:downvote].to_i
    @equivalence.save
    render :nothing => true
  end
end
