class InvitationsController < ApplicationController
  before_action :user_signed_in?, only: [:create]

  def create
    @invitation = current_user.invitations.build(invitation_params)
    event_id = params[:invitation][:attended_event_id]

    if @invitation.save
     flash[:notice] = "You Have Successfully Joined the Event!"
     redirect_to event_path(event_id)
    else
      flash[:alert] = "You Are Already Invited!"
      redirect_to event_path(event_id)
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:attendee_id, :attended_event_id)
  end
end