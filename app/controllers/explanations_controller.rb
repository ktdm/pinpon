class ExplanationsController < ApplicationController
  def index
  end

  def new
    @explanation = Explanation.new
  end

  def create
    @equivalence = Equivalence.find(params[:equivalence_id])
    @explanation = @equivalence.explanations.create(params[:explanation])
    redirect_to equivalence_path(@equivalence)
  end

  def edit
    @explanation = Explanation.find(params[:id])
  end

  def update
    @explanation = Explanation.find(params[:id])

    respond_to do |format|
      if @explanation.update_attributes(params[:explanation])
        format.html  { redirect_to(equivalence_path(params[:equivalence_id]),
                      :notice => 'Explanation was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @explanation.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def vote #easily cheatable. rework later
    @explanation = Explanation.find(params[:id])
    @explanation.upvotes += params[:upvote].to_i
    @explanation.downvotes += params[:downvote].to_i
    @explanation.save
    render :nothing => true
  end
end
