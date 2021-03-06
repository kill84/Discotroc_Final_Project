class DealContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_completed?

  def create
    @deal = Deal.find(params[:deal_id])
    @receiver_library = UserLibrary.find_by(params[:id])
    @new_deal_content = DealContent.new(sender_library_id: params[:sender_library_id], receiver_library_id: @receiver_library.id, deal_id: @deal.id)
    if @new_deal_content.save
      redirect_to user_library_deal_path(params[:user_library_id], params[:deal_id])
      flash[:notice_good] = "La proposition d'échange a bien été créée."

    else
      render 'new'
      flash[:notice_bad] = "La proposition d'échange n'a pas été créée."
    end
  end

  def update
    @edit_deal_content = DealContent.find(params[:id])
    post_params = params.permit(:sender_library_id, :receiver_library_id, :deal_id)
    @edit_deal_content.update(post_params)

    ### In order to update the other user's status when changing the disc
    @edit_deal=Deal.find(params[:deal_id])
    @edit_deal.update(sender_ok: false, receiver_ok: false)

    ### For AJAX
    # respond_to do |format|
    #   format.html { redirect_to user_library_deal_path(params[:user_library_id], params[:deal_id]) }
    #   format.js { }
    # end
    ### Comment this line if you activate AJAX
    redirect_to user_library_deal_path(params[:user_library_id], params[:deal_id])
  end

  def destroy
    @destroy_deal_content = DealContent.find(params[:id])
    @destroy_deal_content.destroy
    redirect_to root_path
  end

end
