class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:id])
    client = GistQuestionService.new(@test_passage.current_question)
    result = client.call

    if client.success?
      flash[:notice] = "#{t(".success")} #{view_context.link_to(t(".find_here"), result.html_url, target: "_blank")}"    
      current_user.gists.create(url: result.html_url, user: current_user, question: @test_passage.current_question)
    else
      flash[:notice] = t(".unsuccess")
    end
    redirect_to @test_passage
  end  
end